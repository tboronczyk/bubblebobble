;-------------------------------------------------------------------------------
; Bubble Bobble
; initial disassembly by DISASM6 v1.5
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; Registers
;-------------------------------------------------------------------------------
PPUCTRL              = $2000
PPUMASK              = $2001
PPUSTATUS            = $2002
OAMADDR              = $2003
OAMDATA              = $2004
PPUSCROLL            = $2005
PPUADDR              = $2006
PPUDATA              = $2007
SQ1_VOL              = $4000
SQ1_SWEEP            = $4001
SQ1_LO               = $4002
SQ1_HI               = $4003
SQ2_VOL              = $4004
SQ2_SWEEP            = $4005
SQ2_LO               = $4006
SQ2_HI               = $4007
TRI_LINEAR           = $4008
TRI_LO               = $400A
TRI_HI               = $400B
NOISE_VOL            = $400C
NOISE_LO             = $400E
NOISE_HI             = $400F
DMC_FREQ             = $4010
DMC_RAW              = $4011
DMC_START            = $4012
DMC_LEN              = $4013
OAM_DMA              = $4014
SND_CHN              = $4015
JOY1                 = $4016
JOY2                 = $4017

;-------------------------------------------------------------------------------
; iNES Header
;-------------------------------------------------------------------------------
            .db "NES", $1A     ; Header
            .db 8              ; 8 x 16k PRG banks
            .db 4              ; 4 x 8k CHR banks
            .db %00010000      ; Mirroring: Horizontal
                               ; SRAM: Not used
                               ; 512k Trainer: Not used
                               ; 4 Screen VRAM: Not used
                               ; Mapper: 1
            .db %00000000      ; RomType: NES
            .hex 00 00 00 00   ; iNES Tail
            .hex 00 00 00 00

;-------------------------------------------------------------------------------
; PRG Start
;-------------------------------------------------------------------------------
            ; bank 0
            .base $8000
            .include prg_00.asm
            .pad $c000, $ff

            ; bank 1
            .base $8000
            .include prg_01.asm
            .pad $c000, $ff

            ; bank 2
            .base $8000
            .include prg_02.asm
            .pad $c000, $ff

            ; bank 3
            .base $8000
            .include prg_03.asm
            .pad $c000, $ff

            ; bank 4
            .base $8000
            .include prg_04.asm
            .pad $c000, $ff

            ; bank 5
            .base $8000
            .include prg_05.asm
            .pad $c000, $ff

            ; bank 6
            .base $8000
            .include prg_06.asm
            .pad $c000, $ff

            ; bank 7
            .include prg_07.asm

;-------------------------------------------------------------------------------
; CHR-ROM
;-------------------------------------------------------------------------------
            .incbin BubbleBobble.chr ; Include CHR-ROM
