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
dd if=chr/pop.bin of="$ROM" conv=notrunc bs=1 seek=$((0x212d0))
dd if=chr/pop.bin of="$ROM" conv=notrunc bs=1 seek=$((0x262d0))
dd if=chr/hurry.bin of="$ROM" conv=notrunc bs=1 seek=$((0x21eb0))

echo "Updating Levels..."
dd if=levels/level-25.bin of="$ROM" conv=notrunc bs=1 seek=$((0x02a90))
dd if=levels/level-27.bin of="$ROM" conv=notrunc bs=1 seek=$((0x02d30))
dd if=levels/level-35.bin of="$ROM" conv=notrunc bs=1 seek=$((0x042b0))
dd if=levels/level-40.bin of="$ROM" conv=notrunc bs=1 seek=$((0x04940))
dd if=levels/level-46.bin of="$ROM" conv=notrunc bs=1 seek=$((0x05120))
dd if=levels/level-59.bin of="$ROM" conv=notrunc bs=1 seek=$((0x06d30))
dd if=levels/level-66.bin of="$ROM" conv=notrunc bs=1 seek=$((0x08160))
dd if=levels/level-72.bin of="$ROM" conv=notrunc bs=1 seek=$((0x08940))
dd if=levels/level-98.bin of="$ROM" conv=notrunc bs=1 seek=$((0x0c160))

echo "Done"
