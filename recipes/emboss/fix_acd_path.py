#!/usr/bin/env python

import os
import sys
import shutil

"""
This script produces for every binary a new shell script similar to:

--------------------------------------------
#!/bin/bash

export EMBOSS_ACDROOT=../share/EMBOSS/acd/
export EMBOSS_DATA=../share/EMBOSS/data
export PLPLOT_LIB=../share/EMBOSS

_water $@

--------------------------------------------

Run this script on the binary directory of EMBOSS tools:

    python fix_acd_path.py $PREFIX/bin/

"""


for filename in os.listdir(sys.argv[1]):

    source = os.path.join(sys.argv[1], filename)
    dest = os.path.join(sys.argv[1], "_%s" % filename)
    shutil.move(source, dest)
    with open(source, 'w+') as handle:
        handle.write('#!/bin/sh\n\n')
        handle.write('BIN_DIR=$(dirname $(which %s))\n' % filename)

        handle.write('export EMBOSS_ACDROOT=$BIN_DIR/../share/EMBOSS/acd/\n')
        handle.write('export EMBOSS_DATA=$BIN_DIR/../share/EMBOSS/data/\n')
        handle.write('export PLPLOT_LIB=$BIN_DIR/../share/EMBOSS/\n')
        handle.write('_%s $@\n' % filename)
