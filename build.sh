#! /bin/bash

set -e

ROM="bubblebobble-eo.nes"

echo "Assembling ROM..."
cd src
/opt/asm6f/asm6f BubbleBobble.asm bb.nes
cp bb.nes ../$ROM
cd ..

echo "Updating CHR..."
dd if=chr/alphabet1.bin of="$ROM" conv=notrunc bs=1 seek=$((0x20010))
dd if=chr/alphabet2.bin of="$ROM" conv=notrunc bs=1 seek=$((0x22010))
dd if=chr/alphabet2.bin of="$ROM" conv=notrunc bs=1 seek=$((0x23010))
dd if=chr/alphabet2.bin of="$ROM" conv=notrunc bs=1 seek=$((0x24010))
dd if=chr/alphabet2.bin of="$ROM" conv=notrunc bs=1 seek=$((0x25010))
dd if=chr/alphabet2.bin of="$ROM" conv=notrunc bs=1 seek=$((0x27010))
dd if=chr/underline.bin of="$ROM" conv=notrunc bs=1 seek=$((0x27e90))

echo "Done"