#!/bin/bash

# Written to fix potential issues with Arch Linux having
# Python 3 as the default.

for filename in $(find . -type f); do
    echo $filename
    sed -i 's/\(^\#\!\/usr\/bin\/env python$\)/\12/' $filename
done
