#!/bin/sh

find $PWD -name '*.go' -exec echo \"{}\" \; | sort -u > cscope.files
#cscope -bvq
cscope -b
