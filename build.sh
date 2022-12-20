#! /bin/bash

set -e

ROM="bubblebobble-eo.nes"

echo "Assembling ROM..."
cd src
/opt/asm6f/asm6f BubbleBobble.asm bb.nes
cp bb.nes ../$ROM
cd ..

echo "Updating CHR..."
# ...

echo "Done"
