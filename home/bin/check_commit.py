#!/usr/bin/env python
#
# save as bin/check_commit.py and make executable

import re

def bad_lines(difflines):
    #
    linenum, header = 0, False

    for line in difflines:
        if header:
            # remember the name of the file that this diff affects
            m = re.match(r'(?:---|\+\+\+) ([^\t]+)', line)
            if m and m.group(1) != '/dev/null':
                filename = m.group(1).split('/', 1)[-1]
            if line.startswith('+++ '):
                header = False
            continue
        if line.startswith('diff '):
            header = True
            continue
        # hunk header - save the line number
        m = re.match(r'@@ -\d+,\d+ \+(\d+),', line)
        if m:
            linenum = int(m.group(1))
            continue
        # hunk body - check for problems with the line
        m = re.match(r'\+', line)
        if m:
            m = re.search(r' \s*$', line)
            if m:
                yield filename, linenum, 'trailing whitespace'
            m = re.search(r'TODO', line)
            if m:
                yield filename, linenum, 'TODO'
            m = re.search(r'FIXME', line)
            if m:
                yield filename, linenum, 'FIXME'
            m = re.search(r'console\.log', line)
            if m:
                yield filename, linenum, 'console.log'
            m = re.search(r'std::cout', line)
            if m:
                yield filename, linenum, 'std::cout'
            m = re.search(r'fdescribe\(', line)
            if m:
                yield filename, linenum, 'fdescribe()'
            m = re.search(r'fit\(', line)
            if m:
                yield filename, linenum, 'fit()'
            m = re.search(r'Capture Page Screenshot', line)
            if m:
                yield filename, linenum, 'Capture Page Screenshot'
        if line and line[0] in ' +':
            linenum += 1

if __name__ == '__main__':
    import os, sys
    from distutils import util
    # don't do anything if we're merging
    if os.environ['HG_PARENT2']:
        sys.exit(0)

    added = 0
    for filename, linenum, reason in bad_lines(os.popen('hg export tip')):
        print >> sys.stderr, ('%s, line %d: %s added' %
                              (filename, linenum, reason))
        added += 1
    if added:
        print >> sys.stderr, ('Are you sure you want to commit? [y/N]')
        input = raw_input()
        if input == '':
            input = 'N'
        if not util.strtobool(input.lower()):
        # save the commit message so we don't need to retype it
            os.system('hg tip --template "{desc}" > .hg/commit.save')
            print >> sys.stderr, 'commit message saved to .hg/commit.save'
            sys.exit(1)
