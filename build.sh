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
dd if=chr/alphabet2-w.bin of="$ROM" conv=notrunc bs=1 seek=$((0x27ea0))
dd if=chr/alphabet2-y.bin of="$ROM" conv=notrunc bs=1 seek=$((0x27eb0))
dd if=chr/happyend.bin of="$ROM" conv=notrunc bs=1 seek=$((0x27470))
dd if=chr/extend.bin of="$ROM" conv=notrunc bs=1 seek=$((0x22290))
dd if=chr/extend.bin of="$ROM" conv=notrunc bs=1 seek=$((0x23290))
dd if=chr/extend.bin of="$ROM" conv=notrunc bs=1 seek=$((0x24290))
dd if=chr/extend.bin of="$ROM" conv=notrunc bs=1 seek=$((0x25290))
dd if=chr/plus.bin of="$ROM" conv=notrunc bs=1 seek=$((0x22ff0))
dd if=chr/plus.bin of="$ROM" conv=notrunc bs=1 seek=$((0x23ff0))
dd if=chr/plus.bin of="$ROM" conv=notrunc bs=1 seek=$((0x24ff0))
dd if=chr/plus.bin of="$ROM" conv=notrunc bs=1 seek=$((0x25ff0))

echo "Done"
