;-------------------------------------------------------------------------------
; Bubble Bobble
; initial disassembly by DISASM6 v1.5
;-------------------------------------------------------------------------------

            jmp __8006         ; $8000: 4c 06 80

;-------------------------------------------------------------------------------
            jmp __804b         ; $8003: 4c 4b 80

;-------------------------------------------------------------------------------
__8006:     lda $0f            ; $8006: a5 0f
            asl                ; $8008: 0a
            cmp #$48           ; $8009: c9 48
            bcs __8016         ; $800b: b0 09
            tax                ; $800d: aa
            lda __8415+1,x     ; $800e: bd 16 84
            pha                ; $8011: 48
            lda __8415,x       ; $8012: bd 15 84
            pha                ; $8015: 48
__8016:     rts                ; $8016: 60

;-------------------------------------------------------------------------------
__8017:     lda #$00           ; $8017: a9 00
            ldx #$ca           ; $8019: a2 ca
__801b:     sta $00,x          ; $801b: 95 00
            inx                ; $801d: e8
            cpx #$f1           ; $801e: e0 f1
            bne __801b         ; $8020: d0 f9
            ldx #$00           ; $8022: a2 00
__8024:     sta SQ1_VOL,x      ; $8024: 9d 00 40
            inx                ; $8027: e8
            cpx #$14           ; $8028: e0 14
            bne __8024         ; $802a: d0 f8
            lda SND_CHN        ; $802c: ad 15 40
            ora #$0f           ; $802f: 09 0f
            sta SND_CHN        ; $8031: 8d 15 40
            rts                ; $8034: 60

;-------------------------------------------------------------------------------
            lda #$00           ; $8035: a9 00
            sta SND_CHN        ; $8037: 8d 15 40
            rts                ; $803a: 60

;-------------------------------------------------------------------------------
__803b:     .hex 03 01 06 02   ; $803b: 03 01 06 02   Data
            .hex 09 0c 04 12   ; $803f: 09 0c 04 12   Data
            .hex 18 08 24 30   ; $8043: 18 08 24 30   Data
            .hex 10 48 3c 1e   ; $8047: 10 48 3c 1e   Data

;-------------------------------------------------------------------------------
__804b:     ldx #$ca           ; $804b: a2 ca
            ldy #$00           ; $804d: a0 00
            lda $ca            ; $804f: a5 ca
            beq __8060         ; $8051: f0 0d
            cmp #$ff           ; $8053: c9 ff
            bne __805d         ; $8055: d0 06
            jsr __8096         ; $8057: 20 96 80
            jmp __8060         ; $805a: 4c 60 80

;-------------------------------------------------------------------------------
__805d:     jsr __8102         ; $805d: 20 02 81
__8060:     ldx #$d4           ; $8060: a2 d4
            ldy #$04           ; $8062: a0 04
            lda $d4            ; $8064: a5 d4
            beq __8075         ; $8066: f0 0d
            cmp #$ff           ; $8068: c9 ff
            bne __8072         ; $806a: d0 06
            jsr __8096         ; $806c: 20 96 80
            jmp __8075         ; $806f: 4c 75 80

;-------------------------------------------------------------------------------
__8072:     jsr __8102         ; $8072: 20 02 81
__8075:     lda $de            ; $8075: a5 de
            beq __8080         ; $8077: f0 07
            ldx #$de           ; $8079: a2 de
            ldy #$08           ; $807b: a0 08
            jsr __8096         ; $807d: 20 96 80
__8080:     lda $e7            ; $8080: a5 e7
            beq __808b         ; $8082: f0 07
            ldx #$e7           ; $8084: a2 e7
            ldy #$0c           ; $8086: a0 0c
            jsr __8096         ; $8088: 20 96 80
__808b:     rts                ; $808b: 60

;-------------------------------------------------------------------------------
__808c:     jmp __8176         ; $808c: 4c 76 81

;-------------------------------------------------------------------------------
__808f:     lda $05,x          ; $808f: b5 05
            sta $06,x          ; $8091: 95 06
            jmp __80a6         ; $8093: 4c a6 80

;-------------------------------------------------------------------------------
__8096:     lda $06,x          ; $8096: b5 06
            beq __808f         ; $8098: f0 f5
            dec $06,x          ; $809a: d6 06
            bne __80dd         ; $809c: d0 3f
            lda $05,x          ; $809e: b5 05
            sta $06,x          ; $80a0: 95 06
            dec $07,x          ; $80a2: d6 07
            bne __80dc         ; $80a4: d0 36
__80a6:     lda ($03,x)        ; $80a6: a1 03
            cmp #$00           ; $80a8: c9 00
            beq __808c         ; $80aa: f0 e0
            sta SQ1_LO,y       ; $80ac: 99 02 40
            lda #$08           ; $80af: a9 08
            cpy #$0c           ; $80b1: c0 0c
            beq __80be         ; $80b3: f0 09
            jsr __81f7         ; $80b5: 20 f7 81
            lda ($03,x)        ; $80b8: a1 03
            and #$07           ; $80ba: 29 07
            ora #$08           ; $80bc: 09 08
__80be:     sta SQ1_HI,y       ; $80be: 99 03 40
            lda ($03,x)        ; $80c1: a1 03
            lsr                ; $80c3: 4a
            lsr                ; $80c4: 4a
            lsr                ; $80c5: 4a
            lsr                ; $80c6: 4a
            cpy #$08           ; $80c7: c0 08
            bne __80d3         ; $80c9: d0 08
            sta $f0            ; $80cb: 85 f0
            cmp #$0f           ; $80cd: c9 0f
            bne __80d3         ; $80cf: d0 02
            lda #$01           ; $80d1: a9 01
__80d3:     tay                ; $80d3: a8
            lda __803b,y       ; $80d4: b9 3b 80
            sta $07,x          ; $80d7: 95 07
            jsr __81f7         ; $80d9: 20 f7 81
__80dc:     rts                ; $80dc: 60

;-------------------------------------------------------------------------------
__80dd:     cpy #$08           ; $80dd: c0 08
            bne __80dc         ; $80df: d0 fb
            lda $f0            ; $80e1: a5 f0
            cmp #$0f           ; $80e3: c9 0f
            bne __80dc         ; $80e5: d0 f5
            lda $05,x          ; $80e7: b5 05
            sec                ; $80e9: 38
            sbc $06,x          ; $80ea: f5 06
            cmp #$04           ; $80ec: c9 04
            bne __80dc         ; $80ee: d0 ec
            lda #$00           ; $80f0: a9 00
            sta SQ1_LO,y       ; $80f2: 99 02 40
            lda #$08           ; $80f5: a9 08
            sta SQ1_HI,y       ; $80f7: 99 03 40
            rts                ; $80fa: 60

;-------------------------------------------------------------------------------
__80fb:     lda $05,x          ; $80fb: b5 05
            sta $06,x          ; $80fd: 95 06
            jmp __8112         ; $80ff: 4c 12 81

;-------------------------------------------------------------------------------
__8102:     lda $06,x          ; $8102: b5 06
            beq __80fb         ; $8104: f0 f5
            dec $06,x          ; $8106: d6 06
            bne __8144         ; $8108: d0 3a
            lda $05,x          ; $810a: b5 05
            sta $06,x          ; $810c: 95 06
            dec $07,x          ; $810e: d6 07
            bne __8144         ; $8110: d0 32
__8112:     lda ($03,x)        ; $8112: a1 03
            cmp #$00           ; $8114: c9 00
            beq __8176         ; $8116: f0 5e
            sta SQ1_LO,y       ; $8118: 99 02 40
            lda #$08           ; $811b: a9 08
            cpy #$0c           ; $811d: c0 0c
            beq __812a         ; $811f: f0 09
            jsr __81f7         ; $8121: 20 f7 81
            lda ($03,x)        ; $8124: a1 03
            and #$07           ; $8126: 29 07
            ora #$08           ; $8128: 09 08
__812a:     sta SQ1_HI,y       ; $812a: 99 03 40
            lda ($03,x)        ; $812d: a1 03
            lsr                ; $812f: 4a
            lsr                ; $8130: 4a
            lsr                ; $8131: 4a
            lsr                ; $8132: 4a
            sty $08            ; $8133: 84 08
            tay                ; $8135: a8
            lda __803b,y       ; $8136: b9 3b 80
            sta $07,x          ; $8139: 95 07
            jsr __81f7         ; $813b: 20 f7 81
            ldy $08            ; $813e: a4 08
            lda #$00           ; $8140: a9 00
            sta $09,x          ; $8142: 95 09
__8144:     lda $00,x          ; $8144: b5 00
            and #$f0           ; $8146: 29 f0
            sta $0a            ; $8148: 85 0a
            lda $00,x          ; $814a: b5 00
            and #$0f           ; $814c: 29 0f
            asl                ; $814e: 0a
            sty $0b            ; $814f: 84 0b
            tay                ; $8151: a8
            lda __828c,y       ; $8152: b9 8c 82
            sta $08            ; $8155: 85 08
            lda __828c+1,y     ; $8157: b9 8d 82
            sta $09            ; $815a: 85 09
            lda $09,x          ; $815c: b5 09
            lsr                ; $815e: 4a
            tay                ; $815f: a8
            lda ($08),y        ; $8160: b1 08
            bcs __8168         ; $8162: b0 04
            lsr                ; $8164: 4a
            lsr                ; $8165: 4a
            lsr                ; $8166: 4a
            lsr                ; $8167: 4a
__8168:     and #$0f           ; $8168: 29 0f
            beq __816e         ; $816a: f0 02
            inc $09,x          ; $816c: f6 09
__816e:     ora $0a            ; $816e: 05 0a
            ldy $0b            ; $8170: a4 0b
            sta SQ1_VOL,y      ; $8172: 99 00 40
            rts                ; $8175: 60

;-------------------------------------------------------------------------------
__8176:     jsr __81f0         ; $8176: 20 f0 81
__8179:     lda ($01,x)        ; $8179: a1 01
            cmp #$00           ; $817b: c9 00
            beq __8191         ; $817d: f0 12
            sta $03,x          ; $817f: 95 03
            jsr __81f0         ; $8181: 20 f0 81
            lda ($01,x)        ; $8184: a1 01
            sta $04,x          ; $8186: 95 04
            lda $00,x          ; $8188: b5 00
            cmp #$ff           ; $818a: c9 ff
            bne __8112         ; $818c: d0 84
            jmp __80a6         ; $818e: 4c a6 80

;-------------------------------------------------------------------------------
__8191:     jsr __81f0         ; $8191: 20 f0 81
            lda ($01,x)        ; $8194: a1 01
            beq __81e4         ; $8196: f0 4c
            cmp #$ff           ; $8198: c9 ff
            beq __81d1         ; $819a: f0 35
            cmp #$fe           ; $819c: c9 fe
            beq __81c5         ; $819e: f0 25
            cpx #$ca           ; $81a0: e0 ca
            beq __81ab         ; $81a2: f0 07
            cpx #$d4           ; $81a4: e0 d4
            beq __81ab         ; $81a6: f0 03
            jmp __81b3         ; $81a8: 4c b3 81

;-------------------------------------------------------------------------------
__81ab:     sta $00,x          ; $81ab: 95 00
            and #$10           ; $81ad: 29 10
            bne __81ba         ; $81af: d0 09
            lda $00,x          ; $81b1: b5 00
__81b3:     sta SQ1_VOL,y      ; $81b3: 99 00 40
            lda #$ff           ; $81b6: a9 ff
            sta $00,x          ; $81b8: 95 00
__81ba:     jsr __81f0         ; $81ba: 20 f0 81
            lda ($01,x)        ; $81bd: a1 01
            sta SQ1_SWEEP,y    ; $81bf: 99 01 40
            jmp __8176         ; $81c2: 4c 76 81

;-------------------------------------------------------------------------------
__81c5:     jsr __81f0         ; $81c5: 20 f0 81
            lda ($01,x)        ; $81c8: a1 01
            sta $05,x          ; $81ca: 95 05
            sta $06,x          ; $81cc: 95 06
            jmp __8176         ; $81ce: 4c 76 81

;-------------------------------------------------------------------------------
__81d1:     jsr __81f0         ; $81d1: 20 f0 81
            lda ($01,x)        ; $81d4: a1 01
            pha                ; $81d6: 48
            jsr __81f0         ; $81d7: 20 f0 81
            lda ($01,x)        ; $81da: a1 01
            sta $02,x          ; $81dc: 95 02
            pla                ; $81de: 68
            sta $01,x          ; $81df: 95 01
            jmp __8179         ; $81e1: 4c 79 81

;-------------------------------------------------------------------------------
__81e4:     lda #$00           ; $81e4: a9 00
            sta SQ1_VOL,y      ; $81e6: 99 00 40
            sta $00,x          ; $81e9: 95 00
            sta $05,x          ; $81eb: 95 05
            sta $06,x          ; $81ed: 95 06
            rts                ; $81ef: 60

;-------------------------------------------------------------------------------
__81f0:     inc $01,x          ; $81f0: f6 01
            bne __81f6         ; $81f2: d0 02
            inc $02,x          ; $81f4: f6 02
__81f6:     rts                ; $81f6: 60

;-------------------------------------------------------------------------------
__81f7:     inc $03,x          ; $81f7: f6 03
            bne __81fd         ; $81f9: d0 02
            inc $04,x          ; $81fb: f6 04
__81fd:     rts                ; $81fd: 60

;-------------------------------------------------------------------------------
__81fe:     ldx #$ca           ; $81fe: a2 ca
            ldy #$00           ; $8200: a0 00
            jmp __8217         ; $8202: 4c 17 82

;-------------------------------------------------------------------------------
__8205:     ldx #$d4           ; $8205: a2 d4
            ldy #$04           ; $8207: a0 04
            jmp __8217         ; $8209: 4c 17 82

;-------------------------------------------------------------------------------
__820c:     ldx #$de           ; $820c: a2 de
            ldy #$08           ; $820e: a0 08
            jmp __8217         ; $8210: 4c 17 82

;-------------------------------------------------------------------------------
__8213:     ldx #$e7           ; $8213: a2 e7
            ldy #$0c           ; $8215: a0 0c
__8217:     stx $0c            ; $8217: 86 0c
            sty $0d            ; $8219: 84 0d
            jsr __c4c3         ; $821b: 20 c3 c4
            ldx $0c            ; $821e: a6 0c
            ldy $0d            ; $8220: a4 0d
            lda $00,x          ; $8222: b5 00
            beq __8230         ; $8224: f0 0a
            lda $08,x          ; $8226: b5 08
            cmp $0f            ; $8228: c5 0f
            bcc __824b         ; $822a: 90 1f
            lda #$00           ; $822c: a9 00
            sta $00,x          ; $822e: 95 00
__8230:     lda $00            ; $8230: a5 00
            sta $01,x          ; $8232: 95 01
            lda $01            ; $8234: a5 01
            sta $02,x          ; $8236: 95 02
            lda $0f            ; $8238: a5 0f
            sta $08,x          ; $823a: 95 08
__823c:     lda ($01,x)        ; $823c: a1 01
            cmp #$00           ; $823e: c9 00
            beq __824c         ; $8240: f0 0a
            sta $03,x          ; $8242: 95 03
            jsr __81f0         ; $8244: 20 f0 81
            lda ($01,x)        ; $8247: a1 01
            sta $04,x          ; $8249: 95 04
__824b:     rts                ; $824b: 60

;-------------------------------------------------------------------------------
__824c:     jsr __81f0         ; $824c: 20 f0 81
            lda ($01,x)        ; $824f: a1 01
            beq __81e4         ; $8251: f0 91
            cmp #$fe           ; $8253: c9 fe
            beq __827f         ; $8255: f0 28
            cpx #$ca           ; $8257: e0 ca
            beq __8262         ; $8259: f0 07
            cpx #$d4           ; $825b: e0 d4
            beq __8262         ; $825d: f0 03
            jmp __826a         ; $825f: 4c 6a 82

;-------------------------------------------------------------------------------
__8262:     sta $00,x          ; $8262: 95 00
            and #$10           ; $8264: 29 10
            bne __8271         ; $8266: d0 09
            lda $00,x          ; $8268: b5 00
__826a:     sta SQ1_VOL,y      ; $826a: 99 00 40
            lda #$ff           ; $826d: a9 ff
            sta $00,x          ; $826f: 95 00
__8271:     jsr __81f0         ; $8271: 20 f0 81
            lda ($01,x)        ; $8274: a1 01
            sta SQ1_SWEEP,y    ; $8276: 99 01 40
            jsr __81f0         ; $8279: 20 f0 81
            jmp __823c         ; $827c: 4c 3c 82

;-------------------------------------------------------------------------------
__827f:     jsr __81f0         ; $827f: 20 f0 81
            lda ($01,x)        ; $8282: a1 01
            sta $05,x          ; $8284: 95 05
            jsr __81f0         ; $8286: 20 f0 81
            jmp __823c         ; $8289: 4c 3c 82

;-------------------------------------------------------------------------------
__828c:     .db <__82ac, >__82ac
            .db <__82bd, >__82bd
            .db <__82c0, >__82c0
            .db <__82d7, >__82d7
            .db <__82e3, >__82e3
            .db <__8302, >__8302
            .db <__830e, >__830e
            .db <__8310, >__8310
            .db <__8323, >__8323
            .db <__8330, >__8330
            .db <__8347, >__8347
            .db <__8357, >__8357
            .db <__8367, >__8367
            .db <__8378, >__8378
            .db <__83a0, >__83a0
            .db <__83f0, >__83f0

__82ac:     .hex fe dc b9 78   ; $82ac: fe dc b9 78   Data
            .hex ac ec a8 67   ; $82b0: ac ec a8 67   Data
            .hex 9b db 97 56   ; $82b4: 9b db 97 56   Data
            .hex 8a ca 86 45   ; $82b8: 8a ca 86 45   Data
            .hex 79            ; $82bc: 79            Data
__82bd:     .hex b9 75 34      ; $82bd: b9 75 34      Data
__82c0:     .hex 68 a8 64 23   ; $82c0: 68 a8 64 23   Data
            .hex 57 97 53 12   ; $82c4: 57 97 53 12   Data
            .hex 46 86 42 11   ; $82c8: 46 86 42 11   Data
            .hex 35 75 31 11   ; $82cc: 35 75 31 11   Data
            .hex 24 64 21 11   ; $82d0: 24 64 21 11   Data
            .hex 13 53 10      ; $82d4: 13 53 10      Data
__82d7:     .hex fe dc ba 98   ; $82d7: fe dc ba 98   Data
            .hex ed cb a9 87   ; $82db: ed cb a9 87   Data
            .hex dc ba 98 76   ; $82df: dc ba 98 76   Data
__82e3:     .hex cb a9 87 65   ; $82e3: cb a9 87 65   Data
            .hex ba 98 76 54   ; $82e7: ba 98 76 54   Data
            .hex a9 87 65 43   ; $82eb: a9 87 65 43   Data
            .hex 98 76 54 32   ; $82ef: 98 76 54 32   Data
            .hex 87 65 43 21   ; $82f3: 87 65 43 21   Data
            .hex 76 54 32 11   ; $82f7: 76 54 32 11   Data
            .hex 65 43 21 11   ; $82fb: 65 43 21 11   Data
            .hex 54 32 10      ; $82ff: 54 32 10      Data
__8302:     .hex fe dc         ; $8302: fe dc         Data
            .hex b9 ed cb a8   ; $8304: b9 ed cb a8   Data
            .hex dc ba 97 cb   ; $8308: dc ba 97 cb   Data
            .hex a9 86         ; $830c: a9 86         Data
__830e:     .hex ba 98         ; $830e: ba 98         Data
__8310:     .hex 75 a9 87 64   ; $8310: 75 a9 87 64   Data
            .hex 98 76 53 87   ; $8314: 98 76 53 87   Data
            .hex 65 42 76 54   ; $8318: 65 42 76 54   Data
            .hex 31 65 43 21   ; $831c: 31 65 43 21   Data
            .hex 54 32 10      ; $8320: 54 32 10      Data
__8323:     .hex fb 73 ba 98   ; $8323: fb 73 ba 98   Data
            .hex 76 54 32 15   ; $8327: 76 54 32 15   Data
            .hex 43 21 21 21   ; $832b: 43 21 21 21   Data
            .hex 20            ; $832f: 20            Data
__8330:     .hex f8 dc ba 98   ; $8330: f8 dc ba 98   Data
            .hex 76 54 32 21   ; $8334: 76 54 32 21   Data
            .hex 48 76 54 32   ; $8338: 48 76 54 32   Data
            .hex 24 32 21 12   ; $833c: 24 32 21 12   Data
            .hex 34 43 21 12   ; $8340: 34 43 21 12   Data
            .hex 34 43 20      ; $8344: 34 43 20      Data
__8347:     .hex dd db b8 52   ; $8347: dd db b8 52   Data
            .hex 12 58 9b 85   ; $834b: 12 58 9b 85   Data
            .hex 21 25 89 b8   ; $834f: 21 25 89 b8   Data
            .hex 52 21 12 20   ; $8353: 52 21 12 20   Data
__8357:     .hex 12 34 56 77   ; $8357: 12 34 56 77   Data
            .hex 65 44 56 55   ; $835b: 65 44 56 55   Data
            .hex 44 55 44 32   ; $835f: 44 55 44 32   Data
            .hex 11 23 32 10   ; $8363: 11 23 32 10   Data
            .hex dd b8 52 12   ; $8367: dd b8 52 12   Data
            .hex 58 9b 85 21   ; $8366: 58 9b 85 21   Data
            .hex 25 89 b8 52   ; $836a: 25 89 b8 52   Data
            .hex 21 11 11 32   ; $836e: 21 11 11 32   Data
            .hex 20            ; $8372: 20            Data
__8378:     .hex 45 67 89 ab   ; $8378: 45 67 89 ab   Data
            .hex cd ef ff ff   ; $837c: cd ef ff ff   Data
            .hex ff ee ee dd   ; $8380: ff ee ee dd   Data
            .hex cc bb aa 99   ; $8384: cc bb aa 99   Data
            .hex 88 77 66 55   ; $8388: 88 77 66 55   Data
            .hex 44 33 33 33   ; $838c: 44 33 33 33   Data
            .hex 33 33 33 33   ; $8390: 33 33 33 33   Data
            .hex 33 33 33 33   ; $8394: 33 33 33 33   Data
            .hex 33 33 33 33   ; $8398: 33 33 33 33   Data
            .hex 33 33 33 30   ; $839c: 33 33 33 30   Data
__83a0:     .hex ff ff ff ff   ; $83a0: ff ff ff ff   Data
            .hex dd dd dd dd   ; $83a4: dd dd dd dd   Data
            .hex ff ff ff ff   ; $83a8: ff ff ff ff   Data
            .hex dd dd dd dd   ; $83ac: dd dd dd dd   Data
            .hex ee ee ee ee   ; $83b0: ee ee ee ee   Data
            .hex cc cc cc cc   ; $83b4: cc cc cc cc   Data
            .hex ee ee ee ee   ; $83b8: ee ee ee ee   Data
            .hex cc cc cc cc   ; $83bc: cc cc cc cc   Data
            .hex dd dd dd dd   ; $83c0: dd dd dd dd   Data
            .hex bb bb bb bb   ; $83c4: bb bb bb bb   Data
            .hex dd dd dd dd   ; $83c8: dd dd dd dd   Data
            .hex bb bb bb bb   ; $83cc: bb bb bb bb   Data
            .hex cc cc cc cc   ; $83d0: cc cc cc cc   Data
            .hex aa aa aa aa   ; $83d4: aa aa aa aa   Data
            .hex bb bb bb bb   ; $83d8: bb bb bb bb   Data
            .hex 99 99 99 99   ; $83dc: 99 99 99 99   Data
            .hex aa aa aa aa   ; $83e0: aa aa aa aa   Data
            .hex 88 88 88 88   ; $83e4: 88 88 88 88   Data
            .hex 99 99 99 99   ; $83e8: 99 99 99 99   Data
            .hex 77 77 77 70   ; $83ec: 77 77 77 70   Data
__83f0:     .hex ff ff ff ff   ; $83f0: ff ff ff ff   Data
            .hex dd dd dd bb   ; $83f4: dd dd dd bb   Data
            .hex bb bb 99 99   ; $83f8: bb bb 99 99   Data
            .hex 99 88 88 88   ; $83fc: 99 88 88 88   Data
            .hex 77 77 77 66   ; $8400: 77 77 77 66   Data
            .hex 66 66 55 55   ; $8404: 66 66 55 55   Data
            .hex 55 44 44 44   ; $8408: 55 44 44 44   Data
            .hex 33 33 33 22   ; $840c: 33 33 33 22   Data
            .hex 22 22 11 11   ; $8410: 22 22 11 11   Data
            .hex 10            ; $8414: 10            Data
__8415:     .hex 49 8d 83 8d   ; $8415: 49 8d 83 8d   Data
            .hex 8f 8e e7 92   ; $8419: 8f 8e e7 92   Data
            .hex f9 90 4f 93   ; $841d: f9 90 4f 93   Data
            .hex d1 93 99 94   ; $8421: d1 93 99 94   Data
            .hex eb 95 a6 90   ; $8425: eb 95 a6 90   Data
            .hex 4b 96 19 97   ; $8429: 4b 96 19 97   Data
            .hex 7f 98 a5 98   ; $842d: 7f 98 a5 98   Data
            .hex 81 97 8c 97   ; $8431: 81 97 8c 97   Data
            .hex 0e 96 2b 95   ; $8435: 0e 96 2b 95   Data
            .hex e4 96 ea 96   ; $8439: e4 96 ea 96   Data
            .hex c7 96 6a 97   ; $843d: c7 96 6a 97   Data
            .hex 0c 95 66 98   ; $8441: 0c 95 66 98   Data
            .hex 24 98 ed 94   ; $8445: 24 98 ed 94   Data
            .hex 9e 96 3b 98   ; $8449: 9e 96 3b 98   Data
            .hex 5c 84 ee 85   ; $844d: 5c 84 ee 85   Data
            .hex a9 86 bf 8a   ; $8451: a9 86 bf 8a   Data
            .hex 3f 8a af 8a   ; $8455: 3f 8a af 8a   Data
            .hex 3a 8b df 98   ; $8459: 3a 8b df 98   Data

;-------------------------------------------------------------------------------
            jsr __8017         ; $845d: 20 17 80
            jsr __8205         ; $8460: 20 05 82
            .db <__846b, >__846b
            jsr __820c         ; $8465: 20 0c 82
            .db <__848f, >__848f
            rts                ; $846a: 60

;-------------------------------------------------------------------------------
__846b:     .hex 00 fe 05 00   ; $846b: 00 fe 05 00   Data
            .hex 9c 00 bb 84   ; $846f: 9c 00 bb 84   Data
            .hex dc 84 dc 84   ; $8473: dc 84 dc 84   Data
            .hex ed 84 0e 85   ; $8477: ed 84 0e 85   Data
            .hex 0e 85 1f 85   ; $847b: 0e 85 1f 85   Data
            .hex dc 84 dc 84   ; $847f: dc 84 dc 84   Data
            .hex ed 84 40 85   ; $8483: ed 84 40 85   Data
            .hex 40 85 51 85   ; $8487: 40 85 51 85   Data
            .hex 00 ff 6b 84   ; $848b: 00 ff 6b 84   Data
__848f:     .hex 00 fe 05 00   ; $848f: 00 fe 05 00   Data
            .hex 98 00 72 85   ; $8493: 98 00 72 85   Data
            .hex ab 85 ab 85   ; $8497: ab 85 ab 85   Data
            .hex ab 85 ab 85   ; $849b: ab 85 ab 85   Data
            .hex bc 85 bc 85   ; $849f: bc 85 bc 85   Data
            .hex bc 85 bc 85   ; $84a3: bc 85 bc 85   Data
            .hex cd 85 cd 85   ; $84a7: cd 85 cd 85   Data
            .hex cd 85 cd 85   ; $84ab: cd 85 cd 85   Data
            .hex de 85 de 85   ; $84af: de 85 de 85   Data
            .hex de 85 de 85   ; $84b3: de 85 de 85   Data
            .hex 00 ff 8f 84   ; $84b7: 00 ff 8f 84   Data
            .hex ac 31 2e 31   ; $84bb: ac 31 2e 31   Data
            .hex e3 30 40 31   ; $84bf: e3 30 40 31   Data
            .hex e3 30 aa 30   ; $84c3: e3 30 aa 30   Data
            .hex f0 30 aa 30   ; $84c7: f0 30 aa 30   Data
            .hex 7f 30 b4 30   ; $84cb: 7f 30 b4 30   Data
            .hex 7f 30 5f 30   ; $84cf: 7f 30 5f 30   Data
            .hex 01 30 8f 30   ; $84d3: 01 30 8f 30   Data
            .hex 01 10 8f 00   ; $84d7: 01 10 8f 00   Data
            .hex 00 aa 10 b4   ; $84db: 00 aa 10 b4   Data
            .hex 10 be 10 ca   ; $84df: 10 be 10 ca   Data
            .hex 10 d6 10 ca   ; $84e3: 10 d6 10 ca   Data
            .hex 10 be 10 b4   ; $84e7: 10 be 10 b4   Data
            .hex 10 00 aa 10   ; $84eb: 10 00 aa 10   Data
            .hex b4 10 be 10   ; $84ef: b4 10 be 10   Data
            .hex ca 10 b4 10   ; $84f3: ca 10 b4 10   Data
            .hex be 10 ca 10   ; $84f7: be 10 ca 10   Data
            .hex d6 10 be 10   ; $84fb: d6 10 be 10   Data
            .hex ca 10 d6 10   ; $84ff: ca 10 d6 10   Data
            .hex e3 10 d6 10   ; $8503: e3 10 d6 10   Data
            .hex e3 10 f0 10   ; $8507: e3 10 f0 10   Data
            .hex fe 10 00 7f   ; $850b: fe 10 00 7f   Data
            .hex 10 87 10 8f   ; $850f: 10 87 10 8f   Data
            .hex 10 97 10 a0   ; $8513: 10 97 10 a0   Data
            .hex 10 97 10 8f   ; $8517: 10 97 10 8f   Data
            .hex 10 87 10 00   ; $851b: 10 87 10 00   Data
            .hex 7f 10 87 10   ; $851f: 7f 10 87 10   Data
            .hex 8f 10 97 10   ; $8523: 8f 10 97 10   Data
            .hex 87 10 8f 10   ; $8527: 87 10 8f 10   Data
            .hex 97 10 a0 10   ; $852b: 97 10 a0 10   Data
            .hex 8f 10 97 10   ; $852f: 8f 10 97 10   Data
            .hex a0 10 aa 10   ; $8533: a0 10 aa 10   Data
            .hex 97 10 a0 10   ; $8537: 97 10 a0 10   Data
            .hex aa 10 b4 10   ; $853b: aa 10 b4 10   Data
            .hex 00 71 10 78   ; $853f: 00 71 10 78   Data
            .hex 10 7f 10 87   ; $8543: 10 7f 10 87   Data
            .hex 10 8f 10 87   ; $8547: 10 8f 10 87   Data
            .hex 10 7f 10 78   ; $854b: 10 7f 10 78   Data
            .hex 10 00 71 10   ; $854f: 10 00 71 10   Data
            .hex 78 10 7f 10   ; $8553: 78 10 7f 10   Data
            .hex 87 10 8f 10   ; $8557: 87 10 8f 10   Data
            .hex 97 10 a0 10   ; $855b: 97 10 a0 10   Data
            .hex aa 10 b4 10   ; $855f: aa 10 b4 10   Data
            .hex be 10 ca 10   ; $8563: be 10 ca 10   Data
            .hex d6 10 e3 10   ; $8567: d6 10 e3 10   Data
            .hex f0 10 fe 10   ; $856b: f0 10 fe 10   Data
            .hex 0d 11 00 d6   ; $856f: 0d 11 00 d6   Data
            .hex f0 01 10 97   ; $8573: f0 01 10 97   Data
            .hex f0 01 10 71   ; $8577: f0 01 10 71   Data
            .hex f0 01 10 a0   ; $857b: f0 01 10 a0   Data
            .hex f0 01 10 71   ; $857f: f0 01 10 71   Data
            .hex f0 01 10 55   ; $8583: f0 01 10 55   Data
            .hex f0 01 10 78   ; $8587: f0 01 10 78   Data
            .hex f0 01 10 55   ; $858b: f0 01 10 55   Data
            .hex f0 01 f0 40   ; $858f: f0 01 f0 40   Data
            .hex f0 01 10 5a   ; $8593: f0 01 10 5a   Data
            .hex f0 01 10 40   ; $8597: f0 01 10 40   Data
            .hex f0 01 10 30   ; $859b: f0 01 10 30   Data
            .hex f0 01 f0 01   ; $859f: f0 01 f0 01   Data
            .hex 30 5f 30 01   ; $85a3: 30 5f 30 01   Data
            .hex 10 5f 00 00   ; $85a7: 10 5f 00 00   Data
            .hex fd f1 01 10   ; $85ab: fd f1 01 10   Data
            .hex 53 f1 01 10   ; $85af: 53 f1 01 10   Data
            .hex ac f1 01 10   ; $85b3: ac f1 01 10   Data
            .hex 53 f1 01 10   ; $85b7: 53 f1 01 10   Data
            .hex 00 7d f1 01   ; $85bb: 00 7d f1 01   Data
            .hex 10 fe f0 01   ; $85bf: 10 fe f0 01   Data
            .hex 10 40 f1 01   ; $85c3: 10 40 f1 01   Data
            .hex 10 fe f0 01   ; $85c7: 10 fe f0 01   Data
            .hex 10 00 fd f1   ; $85cb: 10 00 fd f1   Data
            .hex 01 10 53 f1   ; $85cf: 01 10 53 f1   Data
            .hex 01 10 ac f1   ; $85d3: 01 10 ac f1   Data
            .hex 01 10 53 f1   ; $85d7: 01 10 53 f1   Data
            .hex 01 10 00 53   ; $85db: 01 10 00 53   Data
            .hex f1 01 10 e3   ; $85df: f1 01 10 e3   Data
            .hex f0 01 10 0d   ; $85e3: f0 01 10 0d   Data
            .hex f1 01 10 e3   ; $85e7: f1 01 10 e3   Data
            .hex f0 01 10 00   ; $85eb: f0 01 10 00   Data
            .hex 20 17 80 20   ; $85ef: 20 17 80 20   Data
            .hex fe 81 02 86   ; $85f3: fe 81 02 86   Data
            .hex 20 05 82 1b   ; $85f7: 20 05 82 1b   Data
            .hex 86 20 0c 82   ; $85fb: 86 20 0c 82   Data
            .hex 34 86 60 00   ; $85ff: 34 86 60 00   Data
            .hex fe 0a 00 9c   ; $8603: fe 0a 00 9c   Data
            .hex 00 42 86 53   ; $8607: 00 42 86 53   Data
            .hex 86 4b 86 4b   ; $860b: 86 4b 86 4b   Data
            .hex 86 4b 86 64   ; $860f: 86 4b 86 64   Data
            .hex 86 00 bd 00   ; $8613: 86 00 bd 00   Data
            .hex 67 86 00 00   ; $8617: 67 86 00 00   Data
            .hex 00 fe 0a 00   ; $861b: 00 fe 0a 00   Data
            .hex 9c 00 6e 86   ; $861f: 9c 00 6e 86   Data
            .hex 7f 86 77 86   ; $8623: 7f 86 77 86   Data
            .hex 77 86 77 86   ; $8627: 77 86 77 86   Data
            .hex 90 86 00 bd   ; $862b: 90 86 00 bd   Data
            .hex 00 93 86 00   ; $862f: 00 93 86 00   Data
            .hex 00 00 fe 0a   ; $8633: 00 00 fe 0a   Data
            .hex 00 9c 00 9a   ; $8637: 00 9c 00 9a   Data
            .hex 86 9a 86 a3   ; $863b: 86 9a 86 a3   Data
            .hex 86 00 00 01   ; $863f: 86 00 00 01   Data
            .hex 30 7d 31 40   ; $8643: 30 7d 31 40   Data
            .hex 31 0d 31 00   ; $8647: 31 0d 31 00   Data
            .hex fe 20 7d 31   ; $864b: fe 20 7d 31   Data
            .hex 40 31 0d 31   ; $864f: 40 31 0d 31   Data
            .hex fe 30 ca 30   ; $8653: fe 30 ca 30   Data
            .hex be 20 fd 31   ; $8657: be 20 fd 31   Data
            .hex 94 31 53 31   ; $865b: 94 31 53 31   Data
            .hex 40 31 0d 31   ; $865f: 40 31 0d 31   Data
            .hex 00 fe 60 00   ; $8663: 00 fe 60 00   Data
            .hex b4 c0 be c0   ; $8667: b4 c0 be c0   Data
            .hex 01 10 00 01   ; $866b: 01 10 00 01   Data
            .hex 30 7b 31 3e   ; $866f: 30 7b 31 3e   Data
            .hex 31 0b 31 00   ; $8673: 31 0b 31 00   Data
            .hex fc 20 7b 31   ; $8677: fc 20 7b 31   Data
            .hex 3e 31 0b 31   ; $867b: 3e 31 0b 31   Data
            .hex fc 30 c8 30   ; $867f: fc 30 c8 30   Data
            .hex bc 20 fb 31   ; $8683: bc 20 fb 31   Data
            .hex 92 31 51 31   ; $8687: 92 31 51 31   Data
            .hex 3e 31 0b 31   ; $868b: 3e 31 0b 31   Data
            .hex 00 fc 60 00   ; $868f: 00 fc 60 00   Data
            .hex f0 c0 fe c0   ; $8693: f0 c0 fe c0   Data
            .hex 01 10 00 e0   ; $8697: 01 10 00 e0   Data
            .hex c1 fd c1 e0   ; $869b: c1 fd c1 e0   Data
            .hex c1 fd c1 00   ; $869f: c1 fd c1 00   Data
            .hex e0 c1 fd c1   ; $86a3: e0 c1 fd c1   Data
            .hex 01 10 00      ; $86a7: 01 10 00      Data

;-------------------------------------------------------------------------------
            jsr __8017         ; $86aa: 20 17 80
            jsr __81fe         ; $86ad: 20 fe 81
            .db <__86bd, >__86bd
            jsr __8205         ; $86b2: 20 05 82
            .db <__86dd, >__86dd
            jsr __820c         ; $86b7: 20 0c 82
            .db <__86fd, >__86fd
            rts                ; $86bc: 60

;-------------------------------------------------------------------------------
__86bd:     .hex 00 fe 07 00   ; $86bd: 00 fe 07 00   Data
            .hex be 00 67 87   ; $86c1: be 00 67 87   Data
            .hex 82 87 00 9a   ; $86c5: 82 87 00 9a   Data
            .hex 00 95 87 00   ; $86c9: 00 95 87 00   Data
            .hex be 00 82 87   ; $86cd: be 00 82 87   Data
            .hex 00 9a 00 95   ; $86d1: 00 9a 00 95   Data
            .hex 87 00 be 00   ; $86d5: 87 00 be 00   Data
            .hex a0 87 00 00   ; $86d9: a0 87 00 00   Data
__86dd:     .hex 00 fe 07 00   ; $86dd: 00 fe 07 00   Data
            .hex be 00 39 88   ; $86e1: be 00 39 88   Data
            .hex 54 88 00 9a   ; $86e5: 54 88 00 9a   Data
            .hex 00 67 88 00   ; $86e9: 00 67 88 00   Data
            .hex be 00 54 88   ; $86ed: be 00 54 88   Data
            .hex 00 9a 00 67   ; $86f1: 00 9a 00 67   Data
            .hex 88 00 be 00   ; $86f5: 88 00 be 00   Data
            .hex 76 88 00 00   ; $86f9: 76 88 00 00   Data
__86fd:     .hex 00 fe 07 00   ; $86fd: 00 fe 07 00   Data
            .hex be 00 0f 89   ; $8701: be 00 0f 89   Data
            .hex 0f 89 0f 89   ; $8705: 0f 89 0f 89   Data
            .hex 0f 89 0f 89   ; $8709: 0f 89 0f 89   Data
            .hex 0f 89 0f 89   ; $870d: 0f 89 0f 89   Data
            .hex 0f 89 0f 89   ; $8711: 0f 89 0f 89   Data
            .hex 0f 89 0f 89   ; $8715: 0f 89 0f 89   Data
            .hex 0f 89 0f 89   ; $8719: 0f 89 0f 89   Data
            .hex 0f 89 0f 89   ; $871d: 0f 89 0f 89   Data
            .hex 0f 89 0f 89   ; $8721: 0f 89 0f 89   Data
            .hex 0f 89 0f 89   ; $8725: 0f 89 0f 89   Data
            .hex 0f 89 0f 89   ; $8729: 0f 89 0f 89   Data
            .hex 30 89 51 89   ; $872d: 30 89 51 89   Data
            .hex 72 89 0f 89   ; $8731: 72 89 0f 89   Data
            .hex 30 89 59 89   ; $8735: 30 89 59 89   Data
            .hex 93 89 bc 89   ; $8739: 93 89 bc 89   Data
            .hex d5 89 dd 89   ; $873d: d5 89 dd 89   Data
            .hex 40 89 cc 89   ; $8741: 40 89 cc 89   Data
            .hex fe 89 d5 89   ; $8745: fe 89 d5 89   Data
            .hex d5 89 40 89   ; $8749: d5 89 40 89   Data
            .hex cc 89 1f 8a   ; $874d: cc 89 1f 8a   Data
            .hex 0f 89 0f 89   ; $8751: 0f 89 0f 89   Data
            .hex 0f 89 0f 89   ; $8755: 0f 89 0f 89   Data
            .hex 0f 89 0f 89   ; $8759: 0f 89 0f 89   Data
            .hex 0f 89 0f 89   ; $875d: 0f 89 0f 89   Data
            .hex 0f 89 0f 89   ; $8761: 0f 89 0f 89   Data
            .hex 00 00 01 c0   ; $8765: 00 00 01 c0   Data
            .hex 01 c0 01 c0   ; $8769: 01 c0 01 c0   Data
            .hex 01 c0 8f c0   ; $876d: 01 c0 8f c0   Data
            .hex 8f c0 8f c0   ; $8771: 8f c0 8f c0   Data
            .hex 8f c0 8f c0   ; $8775: 8f c0 8f c0   Data
            .hex 8f c0 8f c0   ; $8779: 8f c0 8f c0   Data
            .hex 8f c0 8f c0   ; $877d: 8f c0 8f c0   Data
            .hex 00 aa 90 aa   ; $8781: 00 aa 90 aa   Data
            .hex 30 a0 30 8f   ; $8785: 30 a0 30 8f   Data
            .hex 30 6b 20 8f   ; $8789: 30 6b 20 8f   Data
            .hex 60 a0 60 8f   ; $878d: 60 a0 60 8f   Data
            .hex 30 aa c0 00   ; $8791: 30 aa c0 00   Data
            .hex 50 60 50 30   ; $8795: 50 60 50 30   Data
            .hex 55 60 5f 30   ; $8799: 55 60 5f 30   Data
            .hex 55 20 00 7f   ; $879d: 55 20 00 7f   Data
            .hex 90 aa 30 a0   ; $87a1: 90 aa 30 a0   Data
            .hex 30 8f 30 a0   ; $87a5: 30 8f 30 a0   Data
            .hex c0 01 30 8f   ; $87a9: c0 01 30 8f   Data
            .hex 90 be 30 aa   ; $87ad: 90 be 30 aa   Data
            .hex 30 a0 30 aa   ; $87b1: 30 a0 30 aa   Data
            .hex c0 01 30 7f   ; $87b5: c0 01 30 7f   Data
            .hex 90 aa 30 a0   ; $87b9: 90 aa 30 a0   Data
            .hex 30 8f 30 a0   ; $87bd: 30 8f 30 a0   Data
            .hex 40 01 10 01   ; $87c1: 40 01 10 01   Data
            .hex 30 a0 30 aa   ; $87c5: 30 a0 30 aa   Data
            .hex 60 be 60 aa   ; $87c9: 60 be 60 aa   Data
            .hex 60 a0 60 97   ; $87cd: 60 a0 60 97   Data
            .hex 60 8f 90 01   ; $87d1: 60 8f 90 01   Data
            .hex 30 8f 30 7f   ; $87d5: 30 8f 30 7f   Data
            .hex 30 6b 00 01   ; $87d9: 30 6b 00 01   Data
            .hex 10 6b 30 71   ; $87dd: 10 6b 30 71   Data
            .hex 60 7f 30 71   ; $87e1: 60 7f 30 71   Data
            .hex 60 6b 00 01   ; $87e5: 60 6b 00 01   Data
            .hex 10 6b 30 71   ; $87e9: 10 6b 30 71   Data
            .hex 60 7f 30 71   ; $87ed: 60 7f 30 71   Data
            .hex 20 a0 90 8f   ; $87f1: 20 a0 90 8f   Data
            .hex 20 aa 40 01   ; $87f5: 20 aa 40 01   Data
            .hex 10 01 30 8f   ; $87f9: 10 01 30 8f   Data
            .hex 30 7f 30 6b   ; $87fd: 30 7f 30 6b   Data
            .hex 00 01 10 6b   ; $8801: 00 01 10 6b   Data
            .hex 30 71 60 7f   ; $8805: 30 71 60 7f   Data
            .hex 30 71 60 6b   ; $8809: 30 71 60 6b   Data
            .hex 00 01 10 6b   ; $880d: 00 01 10 6b   Data
            .hex 30 71 60 7f   ; $8811: 30 71 60 7f   Data
            .hex 30 71 20 a0   ; $8815: 30 71 20 a0   Data
            .hex 90 8f 20 aa   ; $8819: 90 8f 20 aa   Data
            .hex 20 7f 60 71   ; $881d: 20 7f 60 71   Data
            .hex 60 8f 60 6b   ; $8821: 60 8f 60 6b   Data
            .hex c0 6b c0 8f   ; $8825: c0 6b c0 8f   Data
            .hex c0 8f c0 8f   ; $8829: c0 8f c0 8f   Data
            .hex c0 8f c0 8f   ; $882d: c0 8f c0 8f   Data
            .hex c0 8f c0 8f   ; $8831: c0 8f c0 8f   Data
            .hex c0 8f c0 00   ; $8835: c0 8f c0 00   Data
            .hex 01 c0 01 c0   ; $8839: 01 c0 01 c0   Data
            .hex 01 c0 01 c0   ; $883d: 01 c0 01 c0   Data
            .hex a0 c0 aa c0   ; $8841: a0 c0 aa c0   Data
            .hex a0 c0 aa c0   ; $8845: a0 c0 aa c0   Data
            .hex a0 c0 aa c0   ; $8849: a0 c0 aa c0   Data
            .hex a0 c0 aa c0   ; $884d: a0 c0 aa c0   Data
            .hex aa c0 00 a9   ; $8851: aa c0 00 a9   Data
            .hex 90 a9 30 9f   ; $8855: 90 a9 30 9f   Data
            .hex 30 8e 30 6a   ; $8859: 30 8e 30 6a   Data
            .hex 20 8e 60 9f   ; $885d: 20 8e 60 9f   Data
            .hex 60 8e 30 a9   ; $8861: 60 8e 30 a9   Data
            .hex c0 00 01 10   ; $8865: c0 00 01 10   Data
            .hex 4f 60 4f 30   ; $8869: 4f 60 4f 30   Data
            .hex 54 60 5e 30   ; $886d: 54 60 5e 30   Data
            .hex 54 60 01 10   ; $8871: 54 60 01 10   Data
            .hex 00 7e 90 a9   ; $8875: 00 7e 90 a9   Data
            .hex 30 9f 30 8e   ; $8879: 30 9f 30 8e   Data
            .hex 30 9f c0 01   ; $887d: 30 9f c0 01   Data
            .hex 30 8e 90 bd   ; $8881: 30 8e 90 bd   Data
            .hex 30 a9 30 9f   ; $8885: 30 a9 30 9f   Data
            .hex 30 a9 c0 01   ; $8889: 30 a9 c0 01   Data
            .hex 30 7e 90 a9   ; $888d: 30 7e 90 a9   Data
            .hex 30 9f 30 8e   ; $8891: 30 9f 30 8e   Data
            .hex 30 9f 40 01   ; $8895: 30 9f 40 01   Data
            .hex 10 01 30 9f   ; $8899: 10 01 30 9f   Data
            .hex 30 a9 60 bd   ; $889d: 30 a9 60 bd   Data
            .hex 60 a9 60 9f   ; $88a1: 60 a9 60 9f   Data
            .hex 60 96 60 8e   ; $88a5: 60 96 60 8e   Data
            .hex 90 01 30 8e   ; $88a9: 90 01 30 8e   Data
            .hex 30 7e 30 6a   ; $88ad: 30 7e 30 6a   Data
            .hex 00 01 10 6a   ; $88b1: 00 01 10 6a   Data
            .hex 30 70 60 7e   ; $88b5: 30 70 60 7e   Data
            .hex 30 70 60 6a   ; $88b9: 30 70 60 6a   Data
            .hex 00 01 10 6a   ; $88bd: 00 01 10 6a   Data
            .hex 30 70 60 7e   ; $88c1: 30 70 60 7e   Data
            .hex 30 70 20 9f   ; $88c5: 30 70 20 9f   Data
            .hex 90 8e 20 a9   ; $88c9: 90 8e 20 a9   Data
            .hex 40 01 10 01   ; $88cd: 40 01 10 01   Data
            .hex 30 8e 30 7e   ; $88d1: 30 8e 30 7e   Data
            .hex 30 6a 00 01   ; $88d5: 30 6a 00 01   Data
            .hex 10 6a 30 70   ; $88d9: 10 6a 30 70   Data
            .hex 60 7e 30 70   ; $88dd: 60 7e 30 70   Data
            .hex 60 6a 00 01   ; $88e1: 60 6a 00 01   Data
            .hex 10 6a 30 70   ; $88e5: 10 6a 30 70   Data
            .hex 60 7e 30 70   ; $88e9: 60 7e 30 70   Data
            .hex 20 9f 90 8e   ; $88ed: 20 9f 90 8e   Data
            .hex 20 a9 20 7e   ; $88f1: 20 a9 20 7e   Data
            .hex 60 70 60 8e   ; $88f5: 60 70 60 8e   Data
            .hex 60 6a c0 6a   ; $88f9: 60 6a c0 6a   Data
            .hex c0 a0 c0 aa   ; $88fd: c0 a0 c0 aa   Data
            .hex c0 a0 c0 aa   ; $8901: c0 a0 c0 aa   Data
            .hex c0 a0 c0 aa   ; $8905: c0 a0 c0 aa   Data
            .hex c0 a0 c0 aa   ; $8909: c0 a0 c0 aa   Data
            .hex c0 00 ac f1   ; $890d: c0 00 ac f1   Data
            .hex 01 10 ac f1   ; $8911: 01 10 ac f1   Data
            .hex 01 10 ac f1   ; $8915: 01 10 ac f1   Data
            .hex 01 10 ac f1   ; $8919: 01 10 ac f1   Data
            .hex 01 10 ac f1   ; $891d: 01 10 ac f1   Data
            .hex 01 10 ac f1   ; $8921: 01 10 ac f1   Data
            .hex 01 10 ac f1   ; $8925: 01 10 ac f1   Data
            .hex 01 10 ac f1   ; $8929: 01 10 ac f1   Data
            .hex 01 10 00 40   ; $892d: 01 10 00 40   Data
            .hex f1 01 10 40   ; $8931: f1 01 10 40   Data
            .hex f1 01 10 40   ; $8935: f1 01 10 40   Data
            .hex f1 01 10 40   ; $8939: f1 01 10 40   Data
            .hex f1 01 10 40   ; $893d: f1 01 10 40   Data
            .hex f1 01 10 40   ; $8941: f1 01 10 40   Data
            .hex f1 01 10 40   ; $8945: f1 01 10 40   Data
            .hex f1 01 10 40   ; $8949: f1 01 10 40   Data
            .hex f1 01 10 00   ; $894d: f1 01 10 00   Data
            .hex 7d f1 01 10   ; $8951: 7d f1 01 10   Data
            .hex 7d f1 01 10   ; $8955: 7d f1 01 10   Data
            .hex 7d f1 01 10   ; $8959: 7d f1 01 10   Data
            .hex 7d f1 01 10   ; $895d: 7d f1 01 10   Data
            .hex 7d f1 01 10   ; $8961: 7d f1 01 10   Data
            .hex 7d f1 01 10   ; $8965: 7d f1 01 10   Data
            .hex 7d f1 01 10   ; $8969: 7d f1 01 10   Data
            .hex 7d f1 01 10   ; $896d: 7d f1 01 10   Data
            .hex 00 53 f1 01   ; $8971: 00 53 f1 01   Data
            .hex 10 53 f1 01   ; $8975: 10 53 f1 01   Data
            .hex 10 53 f1 01   ; $8979: 10 53 f1 01   Data
            .hex 10 53 f1 01   ; $897d: 10 53 f1 01   Data
            .hex 10 53 f1 01   ; $8981: 10 53 f1 01   Data
            .hex 10 53 f1 01   ; $8985: 10 53 f1 01   Data
            .hex 10 53 f1 01   ; $8989: 10 53 f1 01   Data
            .hex 10 53 f1 01   ; $898d: 10 53 f1 01   Data
            .hex 10 00 53 f1   ; $8991: 10 00 53 f1   Data
            .hex 01 10 53 f1   ; $8995: 01 10 53 f1   Data
            .hex 01 10 7d f1   ; $8999: 01 10 7d f1   Data
            .hex 01 10 7d f1   ; $899d: 01 10 7d f1   Data
            .hex 01 10 53 f1   ; $89a1: 01 10 53 f1   Data
            .hex 01 10 53 f1   ; $89a5: 01 10 53 f1   Data
            .hex 01 10 40 f1   ; $89a9: 01 10 40 f1   Data
            .hex 01 10 40 f1   ; $89ad: 01 10 40 f1   Data
            .hex 01 10 2e f1   ; $89b1: 01 10 2e f1   Data
            .hex 01 10 2e f1   ; $89b5: 01 10 2e f1   Data
            .hex 01 10 00 1d   ; $89b9: 01 10 00 1d   Data
            .hex f1 01 10 1d   ; $89bd: f1 01 10 1d   Data
            .hex f1 01 10 1d   ; $89c1: f1 01 10 1d   Data
            .hex f1 01 10 1d   ; $89c5: f1 01 10 1d   Data
            .hex f1 01 10 1d   ; $89c9: f1 01 10 1d   Data
            .hex f1 01 10 1d   ; $89cd: f1 01 10 1d   Data
            .hex f1 01 10 00   ; $89d1: f1 01 10 00   Data
            .hex fe f0 01 10   ; $89d5: fe f0 01 10   Data
            .hex d6 f0 01 10   ; $89d9: d6 f0 01 10   Data
            .hex d6 f0 01 10   ; $89dd: d6 f0 01 10   Data
            .hex d6 f0 01 10   ; $89e1: d6 f0 01 10   Data
            .hex d6 f0 01 10   ; $89e5: d6 f0 01 10   Data
            .hex d6 f0 01 10   ; $89e9: d6 f0 01 10   Data
            .hex d6 f0 01 10   ; $89ed: d6 f0 01 10   Data
            .hex d6 f0 01 10   ; $89f1: d6 f0 01 10   Data
            .hex d6 f0 01 10   ; $89f5: d6 f0 01 10   Data
            .hex d6 f0 01 10   ; $89f9: d6 f0 01 10   Data
            .hex 00 53 f1 01   ; $89fd: 00 53 f1 01   Data
            .hex 10 53 f1 01   ; $8a01: 10 53 f1 01   Data
            .hex 10 53 f1 01   ; $8a05: 10 53 f1 01   Data
            .hex 10 53 f1 01   ; $8a09: 10 53 f1 01   Data
            .hex 10 53 f1 01   ; $8a0d: 10 53 f1 01   Data
            .hex 10 1d f1 01   ; $8a11: 10 1d f1 01   Data
            .hex 10 fe f0 01   ; $8a15: 10 fe f0 01   Data
            .hex 10 d6 f0 01   ; $8a19: 10 d6 f0 01   Data
            .hex 10 00 53 f1   ; $8a1d: 10 00 53 f1   Data
            .hex 01 10 53 f1   ; $8a21: 01 10 53 f1   Data
            .hex 01 10 fe f0   ; $8a25: 01 10 fe f0   Data
            .hex 01 10 fe f0   ; $8a29: 01 10 fe f0   Data
            .hex 01 10 e3 f0   ; $8a2d: 01 10 e3 f0   Data
            .hex 01 10 e3 f0   ; $8a31: 01 10 e3 f0   Data
            .hex 01 10 1d f1   ; $8a35: 01 10 1d f1   Data
            .hex 01 10 1d f1   ; $8a39: 01 10 1d f1   Data
            .hex 01 10 00      ; $8a3d: 01 10 00      Data

;-------------------------------------------------------------------------------
            jsr __8017         ; $8a40: 20 17 80
            jsr __81fe         ; $8a43: 20 fe 81
            .db <__8a4e, >__8a4e
            jsr __8205         ; $8a48: 20 05 82
            .db <__8a58, >__8a58
            rts                ; $8a4d: 60

;-------------------------------------------------------------------------------
__8a4e:     .hex 00 fe 05 00   ; $8a4e: 00 fe 05 00   Data
            .hex 9c 00 62 8a   ; $8a52: 9c 00 62 8a   Data
            .hex 00 00         ; $8a56: 00 00         Data
__8a58:     .hex 00 fe 05 00   ; $8a58: 00 fe 05 00   Data
            .hex 9c 00 89 8a   ; $8a5c: 9c 00 89 8a   Data
            .hex 00 00 26 30   ; $8a60: 00 00 26 30   Data
            .hex 32 30 43 30   ; $8a64: 32 30 43 30   Data
            .hex 32 30 43 30   ; $8a68: 32 30 43 30   Data
            .hex 5a 30 43 30   ; $8a6c: 5a 30 43 30   Data
            .hex 5a 30 78 30   ; $8a70: 5a 30 78 30   Data
            .hex 5a 30 78 30   ; $8a74: 5a 30 78 30   Data
            .hex 97 30 b4 30   ; $8a78: 97 30 b4 30   Data
            .hex 87 30 65 30   ; $8a7c: 87 30 65 30   Data
            .hex 4c 30 3c 30   ; $8a80: 4c 30 3c 30   Data
            .hex 2d 30 26 90   ; $8a84: 2d 30 26 90   Data
            .hex 00 01 10 2d   ; $8a88: 00 01 10 2d   Data
            .hex 30 3c 30 4c   ; $8a8c: 30 3c 30 4c   Data
            .hex 30 3c 30 4c   ; $8a90: 30 3c 30 4c   Data
            .hex 30 65 30 4c   ; $8a94: 30 65 30 4c   Data
            .hex 30 65 30 87   ; $8a98: 30 65 30 87   Data
            .hex 30 65 30 87   ; $8a9c: 30 65 30 87   Data
            .hex 30 b4 30 97   ; $8aa0: 30 b4 30 97   Data
            .hex 30 78 30 5a   ; $8aa4: 30 78 30 5a   Data
            .hex 30 43 30 32   ; $8aa8: 30 43 30 32   Data
            .hex 30 26 30 00   ; $8aac: 30 26 30 00   Data
            .hex 20 fe 81 b6   ; $8ab0: 20 fe 81 b6   Data
            .hex 8a 60 00 fe   ; $8ab4: 8a 60 00 fe   Data
            .hex 01 00 74 9c   ; $8ab8: 01 00 74 9c   Data
            .hex ea 8a 00 00   ; $8abc: ea 8a 00 00   Data

;-------------------------------------------------------------------------------
            jsr __8017         ; $8ac0: 20 17 80
            jsr __81fe         ; $8ac3: 20 fe 81
            .db <__8ace, >__8ace
            jsr __8205         ; $8ac8: 20 05 82
            .db <__8adc, >__8adc
            rts                ; $8acd: 60

;-------------------------------------------------------------------------------
__8ace:     .hex 00 fe 06 00   ; $8ace: 00 fe 06 00   Data
            .hex 9c 00 05 8b   ; $8ad2: 9c 00 05 8b   Data
            .hex 0e 8b 00 ff   ; $8ad6: 0e 8b 00 ff   Data
            .hex ce 8a         ; $8ada: ce 8a         Data
__8adc:     .hex 00 fe 06 00   ; $8adc: 00 fe 06 00   Data
            .hex 9c 00 1f 8b   ; $8ae0: 9c 00 1f 8b   Data
            .hex 2a 8b 00 ff   ; $8ae4: 2a 8b 00 ff   Data
            .hex dc 8a fe 60   ; $8ae8: dc 8a fe 60   Data
            .hex 01 30 f0 60   ; $8aec: 01 30 f0 60   Data
            .hex 01 30 e3 60   ; $8af0: 01 30 e3 60   Data
            .hex 01 30 d6 60   ; $8af4: 01 30 d6 60   Data
            .hex 01 30 ca 60   ; $8af8: 01 30 ca 60   Data
            .hex 01 30 be 60   ; $8afc: 01 30 be 60   Data
            .hex 01 30 aa c0   ; $8b00: 01 30 aa c0   Data
            .hex 00 2d 30 3c   ; $8b04: 00 2d 30 3c   Data
            .hex 30 2d 30 3c   ; $8b08: 30 2d 30 3c   Data
            .hex 30 00 2d 30   ; $8b0c: 30 00 2d 30   Data
            .hex 3c 30 2d 30   ; $8b10: 3c 30 2d 30   Data
            .hex 3c 30 2d 30   ; $8b14: 3c 30 2d 30   Data
            .hex 3c 30 2d 30   ; $8b18: 3c 30 2d 30   Data
            .hex 3c 30 00 01   ; $8b1c: 3c 30 00 01   Data
            .hex 10 32 30 43   ; $8b20: 10 32 30 43   Data
            .hex 30 32 30 43   ; $8b24: 30 32 30 43   Data
            .hex 30 00 32 30   ; $8b28: 30 00 32 30   Data
            .hex 43 30 32 30   ; $8b2c: 43 30 32 30   Data
            .hex 43 30 32 30   ; $8b30: 43 30 32 30   Data
            .hex 43 30 32 30   ; $8b34: 43 30 32 30   Data
            .hex 43 30 00 20   ; $8b38: 43 30 00 20   Data
            .hex 17 80 20 fe   ; $8b3c: 17 80 20 fe   Data
            .hex 81 53 8b 20   ; $8b40: 81 53 8b 20   Data
            .hex 05 82 67 8b   ; $8b44: 05 82 67 8b   Data
            .hex 20 0c 82 7b   ; $8b48: 20 0c 82 7b   Data
            .hex 8b 20 13 82   ; $8b4c: 8b 20 13 82   Data
            .hex a7 8b 60 00   ; $8b50: a7 8b 60 00   Data
            .hex fe 07 00 04   ; $8b54: fe 07 00 04   Data
            .hex 00 b5 8b b8   ; $8b58: 00 b5 8b b8   Data
            .hex 8b e3 8b 0e   ; $8b5c: 8b e3 8b 0e   Data
            .hex 8c 39 8c 00   ; $8b60: 8c 39 8c 00   Data
            .hex ff 59 8b 00   ; $8b64: ff 59 8b 00   Data
            .hex fe 07 00 88   ; $8b68: fe 07 00 88   Data
            .hex 00 1e 8d 5c   ; $8b6c: 00 1e 8d 5c   Data
            .hex 8c 5c 8c bd   ; $8b70: 8c 5c 8c bd   Data
            .hex 8c bd 8c 00   ; $8b74: 8c bd 8c 00   Data
            .hex ff 6f 8b 00   ; $8b78: ff 6f 8b 00   Data
            .hex fe 07 00 28   ; $8b7c: fe 07 00 28   Data
            .hex 00 b5 8b 25   ; $8b80: 00 b5 8b 25   Data
            .hex 8d 25 8d 25   ; $8b84: 8d 25 8d 25   Data
            .hex 8d 25 8d 2c   ; $8b88: 8d 25 8d 2c   Data
            .hex 8d 2c 8d 2c   ; $8b8c: 8d 2c 8d 2c   Data
            .hex 8d 2c 8d 33   ; $8b90: 8d 2c 8d 33   Data
            .hex 8d 33 8d 33   ; $8b94: 8d 33 8d 33   Data
            .hex 8d 33 8d 3a   ; $8b98: 8d 33 8d 3a   Data
            .hex 8d 3a 8d 3a   ; $8b9c: 8d 3a 8d 3a   Data
            .hex 8d 3a 8d 00   ; $8ba0: 8d 3a 8d 00   Data
            .hex ff 83 8b 00   ; $8ba4: ff 83 8b 00   Data
            .hex fe 07 00 02   ; $8ba8: fe 07 00 02   Data
            .hex 00 41 8d 43   ; $8bac: 00 41 8d 43   Data
            .hex 8d 00 ff af   ; $8bb0: 8d 00 ff af   Data
            .hex 8b aa 30 00   ; $8bb4: 8b aa 30 00   Data
            .hex 7f 30 7f 10   ; $8bb8: 7f 30 7f 10   Data
            .hex 71 10 7f 10   ; $8bbc: 71 10 7f 10   Data
            .hex 71 10 6b 30   ; $8bc0: 71 10 6b 30   Data
            .hex 71 10 6b 10   ; $8bc4: 71 10 6b 10   Data
            .hex 71 10 6b 10   ; $8bc8: 71 10 6b 10   Data
            .hex 71 10 7f 10   ; $8bcc: 71 10 7f 10   Data
            .hex 7f 10 71 10   ; $8bd0: 7f 10 71 10   Data
            .hex 6b 30 71 10   ; $8bd4: 6b 30 71 10   Data
            .hex 6b 10 71 10   ; $8bd8: 6b 10 71 10   Data
            .hex 6b 10 71 10   ; $8bdc: 6b 10 71 10   Data
            .hex 7f 10 00 8f   ; $8be0: 7f 10 00 8f   Data
            .hex 30 8f 10 7f   ; $8be4: 30 8f 10 7f   Data
            .hex 10 8f 10 7f   ; $8be8: 10 8f 10 7f   Data
            .hex 10 71 30 7f   ; $8bec: 10 71 30 7f   Data
            .hex 10 71 10 7f   ; $8bf0: 10 71 10 7f   Data
            .hex 10 71 10 7f   ; $8bf4: 10 71 10 7f   Data
            .hex 10 8f 10 8f   ; $8bf8: 10 8f 10 8f   Data
            .hex 10 7f 10 71   ; $8bfc: 10 7f 10 71   Data
            .hex 30 7f 10 71   ; $8c00: 30 7f 10 71   Data
            .hex 10 7f 10 71   ; $8c04: 10 7f 10 71   Data
            .hex 10 7f 10 8f   ; $8c08: 10 7f 10 8f   Data
            .hex 10 00 a0 30   ; $8c0c: 10 00 a0 30   Data
            .hex a0 10 8f 10   ; $8c10: a0 10 8f 10   Data
            .hex a0 10 8f 10   ; $8c14: a0 10 8f 10   Data
            .hex 7f 30 8f 10   ; $8c18: 7f 30 8f 10   Data
            .hex 7f 10 8f 10   ; $8c1c: 7f 10 8f 10   Data
            .hex 7f 10 8f 10   ; $8c20: 7f 10 8f 10   Data
            .hex a0 10 a0 10   ; $8c24: a0 10 a0 10   Data
            .hex 8f 10 7f 30   ; $8c28: 8f 10 7f 30   Data
            .hex 8f 10 7f 10   ; $8c2c: 8f 10 7f 10   Data
            .hex 8f 10 7f 10   ; $8c30: 8f 10 7f 10   Data
            .hex 8f 10 a0 10   ; $8c34: 8f 10 a0 10   Data
            .hex 00 aa 30 aa   ; $8c38: 00 aa 30 aa   Data
            .hex 10 aa 10 aa   ; $8c3c: 10 aa 10 aa   Data
            .hex 10 aa 10 aa   ; $8c40: 10 aa 10 aa   Data
            .hex 30 aa 10 aa   ; $8c44: 30 aa 10 aa   Data
            .hex 10 aa 10 aa   ; $8c48: 10 aa 10 aa   Data
            .hex 10 aa 30 aa   ; $8c4c: 10 aa 30 aa   Data
            .hex 10 aa 10 aa   ; $8c50: 10 aa 10 aa   Data
            .hex 10 aa 10 aa   ; $8c54: 10 aa 10 aa   Data
            .hex 30 aa 30 00   ; $8c58: 30 aa 30 00   Data
            .hex fe 00 fe 10   ; $8c5c: fe 00 fe 10   Data
            .hex fe 30 fe 00   ; $8c60: fe 30 fe 00   Data
            .hex fe 10 fe 30   ; $8c64: fe 10 fe 30   Data
            .hex fe 00 e3 10   ; $8c68: fe 00 e3 10   Data
            .hex d6 30 d6 00   ; $8c6c: d6 30 d6 00   Data
            .hex e3 10 fe 30   ; $8c70: e3 10 fe 30   Data
            .hex e3 00 1d 11   ; $8c74: e3 00 1d 11   Data
            .hex 1d 31 1d 01   ; $8c78: 1d 31 1d 01   Data
            .hex 1d 11 1d 31   ; $8c7c: 1d 11 1d 31   Data
            .hex 1d 01 fe 10   ; $8c80: 1d 01 fe 10   Data
            .hex e3 30 e3 00   ; $8c84: e3 30 e3 00   Data
            .hex fe 10 1d 31   ; $8c88: fe 10 1d 31   Data
            .hex fe 00 40 11   ; $8c8c: fe 00 40 11   Data
            .hex 40 31 40 01   ; $8c90: 40 31 40 01   Data
            .hex 40 11 40 31   ; $8c94: 40 11 40 31   Data
            .hex 40 01 1d 11   ; $8c98: 40 01 1d 11   Data
            .hex fe 30 fe 00   ; $8c9c: fe 30 fe 00   Data
            .hex 1d 11 40 31   ; $8ca0: 1d 11 40 31   Data
            .hex 0d 01 0d 11   ; $8ca4: 0d 01 0d 11   Data
            .hex 0d 31 0d 01   ; $8ca8: 0d 31 0d 01   Data
            .hex 0d 11 0d 31   ; $8cac: 0d 11 0d 31   Data
            .hex e3 00 e3 10   ; $8cb0: e3 00 e3 10   Data
            .hex e3 30 e3 00   ; $8cb4: e3 30 e3 00   Data
            .hex e3 10 e3 30   ; $8cb8: e3 10 e3 30   Data
            .hex 00 aa 00 aa   ; $8cbc: 00 aa 00 aa   Data
            .hex 10 aa 30 aa   ; $8cc0: 10 aa 30 aa   Data
            .hex 00 aa 10 aa   ; $8cc4: 00 aa 10 aa   Data
            .hex 30 aa 00 be   ; $8cc8: 30 aa 00 be   Data
            .hex 10 d6 30 d6   ; $8ccc: 10 d6 30 d6   Data
            .hex 00 be 10 aa   ; $8cd0: 00 be 10 aa   Data
            .hex 30 be 00 e3   ; $8cd4: 30 be 00 e3   Data
            .hex 10 e3 30 e3   ; $8cd8: 10 e3 30 e3   Data
            .hex 00 e3 10 e3   ; $8cdc: 00 e3 10 e3   Data
            .hex 30 e3 00 d6   ; $8ce0: 30 e3 00 d6   Data
            .hex 10 be 30 be   ; $8ce4: 10 be 30 be   Data
            .hex 00 d6 10 e3   ; $8ce8: 00 d6 10 e3   Data
            .hex 30 d6 00 fe   ; $8cec: 30 d6 00 fe   Data
            .hex 10 fe 30 fe   ; $8cf0: 10 fe 30 fe   Data
            .hex 00 fe 10 fe   ; $8cf4: 00 fe 10 fe   Data
            .hex 30 fe 00 e3   ; $8cf8: 30 fe 00 e3   Data
            .hex 10 d6 30 d6   ; $8cfc: 10 d6 30 d6   Data
            .hex 00 e3 10 fe   ; $8d00: 00 e3 10 fe   Data
            .hex 30 e3 00 e3   ; $8d04: 30 e3 00 e3   Data
            .hex 10 e3 30 e3   ; $8d08: 10 e3 30 e3   Data
            .hex 00 e3 10 e3   ; $8d0c: 00 e3 10 e3   Data
            .hex 30 aa 00 aa   ; $8d10: 30 aa 00 aa   Data
            .hex 10 aa 30 aa   ; $8d14: 10 aa 30 aa   Data
            .hex 00 aa 10 aa   ; $8d18: 00 aa 10 aa   Data
            .hex 30 00 01 d0   ; $8d1c: 30 00 01 d0   Data
            .hex 01 80 01 30   ; $8d20: 01 80 01 30   Data
            .hex 00 fe 30 aa   ; $8d24: 00 fe 30 aa   Data
            .hex 30 aa 30 00   ; $8d28: 30 aa 30 00   Data
            .hex 1d 31 be 30   ; $8d2c: 1d 31 be 30   Data
            .hex be 30 00 40   ; $8d30: be 30 00 40   Data
            .hex 31 d6 30 d6   ; $8d34: 31 d6 30 d6   Data
            .hex 30 00 53 31   ; $8d38: 30 00 53 31   Data
            .hex e3 30 e3 30   ; $8d3c: e3 30 e3 30   Data
            .hex 00 31 00 2f   ; $8d40: 00 31 00 2f   Data
            .hex 2f 2f 3f 32   ; $8d44: 2f 2f 3f 32   Data
            .hex 32 00         ; $8d48: 32 00         Data

;-------------------------------------------------------------------------------
            lda #$00           ; $8d4a: a9 00
            sta $04a0          ; $8d4c: 8d a0 04
            jsr __8017         ; $8d4f: 20 17 80
            jsr __81fe         ; $8d52: 20 fe 81
            .db <__8d62, >__8d62
            jsr __8205         ; $8d57: 20 05 82
            .db <__8d97, >__8d97
            jsr __820c         ; $8d5c: 20 0c 82
            .db <__8e2e, >__8e2e
            rts                ; $8d61: 60

;-------------------------------------------------------------------------------
__8d62:     .hex 00 fe 07 00   ; $8d62: 00 fe 07 00   Data
            .hex 98 00 bb 8e   ; $8d66: 98 00 bb 8e   Data
            .hex bb 8e bb 8e   ; $8d6a: bb 8e bb 8e   Data
            .hex bb 8e c4 8e   ; $8d6e: bb 8e c4 8e   Data
            .hex c4 8e c4 8e   ; $8d72: c4 8e c4 8e   Data
            .hex c4 8e cd 8e   ; $8d76: c4 8e cd 8e   Data
            .hex cd 8e cd 8e   ; $8d7a: cd 8e cd 8e   Data
            .hex cd 8e d6 8e   ; $8d7e: cd 8e d6 8e   Data
            .hex 00 00         ; $8d82: 00 00         Data

;-------------------------------------------------------------------------------
            lda #$00           ; $8d84: a9 00
            sta $04a0          ; $8d86: 8d a0 04
            jsr __8017         ; $8d89: 20 17 80
            jsr __8205         ; $8d8c: 20 05 82
            .db <__8d9f, >__8d9f
            jsr __820c         ; $8d91: 20 0c 82
            .db <__8e36, >__8e36
            rts                ; $8d96: 60

;-------------------------------------------------------------------------------
__8d97:     .hex 00 fe 07 00   ; $8d97: 00 fe 07 00   Data
            .hex b9 00 e5 8e   ; $8d9b: b9 00 e5 8e   Data
__8d9f:     .hex 00 fe 07 00   ; $8d9f: 00 fe 07 00   Data
            .hex 98 00 25 8f   ; $8da3: 98 00 25 8f   Data
            .hex 00 9a 00 2a   ; $8da7: 00 9a 00 2a   Data
            .hex 8f 00 98 00   ; $8dab: 8f 00 98 00   Data
            .hex 2d 8f 00 9a   ; $8daf: 2d 8f 00 9a   Data
            .hex 00 40 8f 00   ; $8db3: 00 40 8f 00   Data
            .hex 99 00 45 8f   ; $8db7: 99 00 45 8f   Data
            .hex 00 98 00 1f   ; $8dbb: 00 98 00 1f   Data
            .hex 8f 00 9a 00   ; $8dbf: 8f 00 9a 00   Data
            .hex 2a 8f 00 98   ; $8dc3: 2a 8f 00 98   Data
            .hex 00 2d 8f 00   ; $8dc7: 00 2d 8f 00   Data
            .hex 9a 00 40 8f   ; $8dcb: 9a 00 40 8f   Data
            .hex 00 99 00 64   ; $8dcf: 00 99 00 64   Data
            .hex 8f 00 5b 00   ; $8dd3: 8f 00 5b 00   Data
            .hex 82 8f 00 99   ; $8dd7: 82 8f 00 99   Data
            .hex 00 8b 8f 00   ; $8ddb: 00 8b 8f 00   Data
            .hex 5b 00 8b 8f   ; $8ddf: 5b 00 8b 8f   Data
            .hex 00 99 00 94   ; $8de3: 00 99 00 94   Data
            .hex 8f 00 5b 00   ; $8de7: 8f 00 5b 00   Data
            .hex 94 8f 00 99   ; $8deb: 94 8f 00 99   Data
            .hex 00 9d 8f 00   ; $8def: 00 9d 8f 00   Data
            .hex 5b 00 9d 8f   ; $8df3: 5b 00 9d 8f   Data
            .hex 00 99 00 a6   ; $8df7: 00 99 00 a6   Data
            .hex 8f b9 8f 82   ; $8dfb: 8f b9 8f 82   Data
            .hex 8f 00 5b 00   ; $8dff: 8f 00 5b 00   Data
            .hex 82 8f 00 99   ; $8e03: 82 8f 00 99   Data
            .hex 00 8b 8f 00   ; $8e07: 00 8b 8f 00   Data
            .hex 5b 00 8b 8f   ; $8e0b: 5b 00 8b 8f   Data
            .hex 00 99 00 94   ; $8e0f: 00 99 00 94   Data
            .hex 8f 00 5b 00   ; $8e13: 8f 00 5b 00   Data
            .hex 94 8f 00 99   ; $8e17: 94 8f 00 99   Data
            .hex 00 9d 8f 00   ; $8e1b: 00 9d 8f 00   Data
            .hex 5b 00 9d 8f   ; $8e1f: 5b 00 9d 8f   Data
            .hex 00 99 00 a6   ; $8e23: 00 99 00 a6   Data
            .hex 8f c6 8f 00   ; $8e27: 8f c6 8f 00   Data
            .hex ff a2 8d      ; $8e2b: ff a2 8d      Data
__8e2e:     .hex 00 fe 07 00   ; $8e2e: 00 fe 07 00   Data
            .hex 7f 00 08 8f   ; $8e32: 7f 00 08 8f   Data
__8e36:     .hex 00 fe 07 00   ; $8e36: 00 fe 07 00   Data
            .hex 7f 00 dd 8f   ; $8e3a: 7f 00 dd 8f   Data
            .hex dd 8f dd 8f   ; $8e3e: dd 8f dd 8f   Data
            .hex dd 8f ee 8f   ; $8e42: dd 8f ee 8f   Data
            .hex ee 8f ee 8f   ; $8e46: ee 8f ee 8f   Data
            .hex ee 8f dd 8f   ; $8e4a: ee 8f dd 8f   Data
            .hex dd 8f dd 8f   ; $8e4e: dd 8f dd 8f   Data
            .hex dd 8f ee 8f   ; $8e52: dd 8f ee 8f   Data
            .hex ee 8f ee 8f   ; $8e56: ee 8f ee 8f   Data
            .hex ff 8f 10 90   ; $8e5a: ff 8f 10 90   Data
            .hex dd 8f dd 8f   ; $8e5e: dd 8f dd 8f   Data
            .hex 10 90 dd 8f   ; $8e62: 10 90 dd 8f   Data
            .hex 31 90 41 90   ; $8e66: 31 90 41 90   Data
            .hex 52 90 52 90   ; $8e6a: 52 90 52 90   Data
            .hex 63 90 ee 8f   ; $8e6e: 63 90 ee 8f   Data
            .hex 63 90 75 90   ; $8e72: 63 90 75 90   Data
            .hex 10 90 dd 8f   ; $8e76: 10 90 dd 8f   Data
            .hex dd 8f 10 90   ; $8e7a: dd 8f 10 90   Data
            .hex dd 8f 31 90   ; $8e7e: dd 8f 31 90   Data
            .hex 41 90 52 90   ; $8e82: 41 90 52 90   Data
            .hex 52 90 63 90   ; $8e86: 52 90 63 90   Data
            .hex 86 90 00 ff   ; $8e8a: 86 90 00 ff   Data
            .hex 39 8e a9 01   ; $8e8e: 39 8e a9 01   Data
            .hex 8d a0 04 20   ; $8e92: 8d a0 04 20   Data
            .hex 17 80 20 05   ; $8e96: 17 80 20 05   Data
            .hex 82 a3 8e 20   ; $8e9a: 82 a3 8e 20   Data
            .hex 0c 82 af 8e   ; $8e9e: 0c 82 af 8e   Data
            .hex 60 00 fe 06   ; $8ea2: 60 00 fe 06   Data
            .hex 00 98 00 25   ; $8ea6: 00 98 00 25   Data
            .hex 8f 00 ff a7   ; $8eaa: 8f 00 ff a7   Data
            .hex 8d 00 fe 06   ; $8eae: 8d 00 fe 06   Data
            .hex 00 7f 00 dd   ; $8eb2: 00 7f 00 dd   Data
            .hex 8f 00 ff 3e   ; $8eb6: 8f 00 ff 3e   Data
            .hex 8e 1b 10 26   ; $8eba: 8e 1b 10 26   Data
            .hex 10 2d 10 35   ; $8ebe: 10 2d 10 35   Data
            .hex 10 00 1e 10   ; $8ec2: 10 00 1e 10   Data
            .hex 28 10 30 10   ; $8ec6: 28 10 30 10   Data
            .hex 3c 10 00 24   ; $8eca: 3c 10 00 24   Data
            .hex 10 2a 10 35   ; $8ece: 10 2a 10 35   Data
            .hex 10 47 10 00   ; $8ed2: 10 47 10 00   Data
            .hex 28 10 35 10   ; $8ed6: 28 10 35 10   Data
            .hex 3f 10 50 10   ; $8eda: 3f 10 50 10   Data
            .hex be 20 b4 20   ; $8ede: be 20 b4 20   Data
            .hex a0 20 00 b4   ; $8ee2: a0 20 00 b4   Data
            .hex 20 b4 60 be   ; $8ee6: 20 b4 60 be   Data
            .hex 30 d6 60 be   ; $8eea: 30 d6 60 be   Data
            .hex 30 b4 60 a0   ; $8eee: 30 b4 60 a0   Data
            .hex 30 f0 60 01   ; $8ef2: 30 f0 60 01   Data
            .hex 60 d6 20 1d   ; $8ef6: 60 d6 20 1d   Data
            .hex 61 1d 31 be   ; $8efa: 61 1d 31 be   Data
            .hex 60 b4 60 a0   ; $8efe: 60 b4 60 a0   Data
            .hex 20 8f 20 7f   ; $8f02: 20 8f 20 7f   Data
            .hex 20 00 68 91   ; $8f06: 20 00 68 91   Data
            .hex 40 61 2e 61   ; $8f0a: 40 61 2e 61   Data
            .hex 40 91 7d 91   ; $8f0e: 40 91 7d 91   Data
            .hex ac 91 7d 91   ; $8f12: ac 91 7d 91   Data
            .hex ac 61 40 21   ; $8f16: ac 61 40 21   Data
            .hex 1d 21 fd 20   ; $8f1a: 1d 21 fd 20   Data
            .hex 00 a0 30 8f   ; $8f1e: 00 a0 30 8f   Data
            .hex 30 7f 30 78   ; $8f22: 30 7f 30 78   Data
            .hex 30 7f 30 00   ; $8f26: 30 7f 30 00   Data
            .hex 8f 00 00 a0   ; $8f2a: 8f 00 00 a0   Data
            .hex 10 7f 30 8f   ; $8f2e: 10 7f 30 8f   Data
            .hex 30 a0 30 b4   ; $8f32: 30 a0 30 b4   Data
            .hex 30 8f 30 a0   ; $8f36: 30 8f 30 a0   Data
            .hex 30 b4 10 be   ; $8f3a: 30 b4 10 be   Data
            .hex 30 00 a0 20   ; $8f3e: 30 00 a0 20   Data
            .hex 01 10 00 be   ; $8f42: 01 10 00 be   Data
            .hex 10 d6 10 f0   ; $8f46: 10 d6 10 f0   Data
            .hex 30 d6 30 be   ; $8f4a: 30 d6 30 be   Data
            .hex 30 b4 30 d6   ; $8f4e: 30 b4 30 d6   Data
            .hex 30 be 10 b4   ; $8f52: 30 be 10 b4   Data
            .hex 00 a0 30 a0   ; $8f56: 00 a0 30 a0   Data
            .hex 30 8f 30 7f   ; $8f5a: 30 8f 30 7f   Data
            .hex 10 8f 00 a0   ; $8f5e: 10 8f 00 a0   Data
            .hex 30 00 be 10   ; $8f62: 30 00 be 10   Data
            .hex d6 10 f0 30   ; $8f66: d6 10 f0 30   Data
            .hex d6 30 be 30   ; $8f6a: d6 30 be 30   Data
            .hex b4 30 d6 30   ; $8f6e: b4 30 d6 30   Data
            .hex be 10 b4 00   ; $8f72: be 10 b4 00   Data
            .hex a0 30 a0 30   ; $8f76: a0 30 a0 30   Data
            .hex 8f 30 7f 10   ; $8f7a: 8f 30 7f 10   Data
            .hex a0 00 78 30   ; $8f7e: a0 00 78 30   Data
            .hex a0 30 8f 30   ; $8f82: a0 30 8f 30   Data
            .hex 87 30 7f 30   ; $8f86: 87 30 7f 30   Data
            .hex 00 a0 30 8f   ; $8f8a: 00 a0 30 8f   Data
            .hex 30 7f 30 78   ; $8f8e: 30 7f 30 78   Data
            .hex 30 00 a0 30   ; $8f92: 30 00 a0 30   Data
            .hex 8f 30 7f 30   ; $8f96: 8f 30 7f 30   Data
            .hex 6b 30 00 a0   ; $8f9a: 6b 30 00 a0   Data
            .hex 30 8f 30 7f   ; $8f9e: 30 8f 30 7f   Data
            .hex 30 5f 30 00   ; $8fa2: 30 5f 30 00   Data
            .hex 78 30 6b 30   ; $8fa6: 78 30 6b 30   Data
            .hex 5f 30 5a 20   ; $8faa: 5f 30 5a 20   Data
            .hex 5a 60 5f 30   ; $8fae: 5a 60 5f 30   Data
            .hex 6b 60 5f 50   ; $8fb2: 6b 60 5f 50   Data
            .hex 5f 60 00 6b   ; $8fb6: 5f 60 00 6b   Data
            .hex 20 8f 20 5f   ; $8fba: 20 8f 20 5f   Data
            .hex 60 6b 40 01   ; $8fbe: 60 6b 40 01   Data
            .hex 10 00 10 00   ; $8fc2: 10 00 10 00   Data
            .hex 6b 20 a0 10   ; $8fc6: 6b 20 a0 10   Data
            .hex a0 00 5f 30   ; $8fca: a0 00 5f 30   Data
            .hex a0 30 5f 30   ; $8fce: a0 30 5f 30   Data
            .hex 78 90 01 30   ; $8fd2: 78 90 01 30   Data
            .hex a0 30 8f 30   ; $8fd6: a0 30 8f 30   Data
            .hex 7f 30 00 e0   ; $8fda: 7f 30 00 e0   Data
            .hex 11 01 10 f0   ; $8fde: 11 01 10 f0   Data
            .hex f0 01 10 e0   ; $8fe2: f0 01 10 e0   Data
            .hex 11 01 10 f0   ; $8fe6: 11 01 10 f0   Data
            .hex f0 01 10 00   ; $8fea: f0 01 10 00   Data
            .hex 3b 12 01 10   ; $8fee: 3b 12 01 10   Data
            .hex 1d f1 01 10   ; $8ff2: 1d f1 01 10   Data
            .hex 3b 12 01 10   ; $8ff6: 3b 12 01 10   Data
            .hex 1d f1 01 10   ; $8ffa: 1d f1 01 10   Data
            .hex 00 f0 10 01   ; $8ffe: 00 f0 10 01   Data
            .hex 10 40 11 01   ; $9002: 10 40 11 01   Data
            .hex 10 1d 11 01   ; $9006: 10 1d 11 01   Data
            .hex 10 0d 11 01   ; $900a: 10 0d 11 01   Data
            .hex 10 00 fd 11   ; $900e: 10 00 fd 11   Data
            .hex 01 10 fe f0   ; $9012: 01 10 fe f0   Data
            .hex 01 10 fd 11   ; $9016: 01 10 fd 11   Data
            .hex 01 10 fe f0   ; $901a: 01 10 fe f0   Data
            .hex 01 10 fd 11   ; $901e: 01 10 fd 11   Data
            .hex 01 10 fe f0   ; $9022: 01 10 fe f0   Data
            .hex 01 10 fd 11   ; $9026: 01 10 fd 11   Data
            .hex 01 10 fe f0   ; $902a: 01 10 fe f0   Data
            .hex 01 10 00 f0   ; $902e: 01 10 00 f0   Data
            .hex f0 01 10 f0   ; $9032: f0 01 10 f0   Data
            .hex 10 01 10 d6   ; $9036: 10 01 10 d6   Data
            .hex 10 01 10 be   ; $903a: 10 01 10 be   Data
            .hex 10 01 10 68   ; $903e: 10 01 10 68   Data
            .hex 11 01 10 b4   ; $9042: 11 01 10 b4   Data
            .hex f0 01 10 68   ; $9046: f0 01 10 68   Data
            .hex 11 01 10 b4   ; $904a: 11 01 10 b4   Data
            .hex f0 01 10 00   ; $904e: f0 01 10 00   Data
            .hex 7d 11 01 10   ; $9052: 7d 11 01 10   Data
            .hex be f0 01 10   ; $9056: be f0 01 10   Data
            .hex 7d 11 01 10   ; $905a: 7d 11 01 10   Data
            .hex be f0 01 10   ; $905e: be f0 01 10   Data
            .hex 00 ac 11 01   ; $9062: 00 ac 11 01   Data
            .hex 10 d6 f0 01   ; $9066: 10 d6 f0 01   Data
            .hex 10 ac 11 01   ; $906a: 10 ac 11 01   Data
            .hex 10 d6 f0 01   ; $906e: 10 d6 f0 01   Data
            .hex 10 00 00 ac   ; $9072: 10 00 00 ac   Data
            .hex 11 01 10 40   ; $9076: 11 01 10 40   Data
            .hex 11 01 10 1d   ; $907a: 11 01 10 1d   Data
            .hex 11 01 10 0d   ; $907e: 11 01 10 0d   Data
            .hex 11 01 10 00   ; $9082: 11 01 10 00   Data
            .hex 40 11 01 10   ; $9086: 40 11 01 10   Data
            .hex be f0 01 10   ; $908a: be f0 01 10   Data
            .hex 40 11 01 10   ; $908e: 40 11 01 10   Data
            .hex be f0 01 10   ; $9092: be f0 01 10   Data
            .hex f0 90 01 30   ; $9096: f0 90 01 30   Data
            .hex 40 11 01 10   ; $909a: 40 11 01 10   Data
            .hex 1d 11 01 10   ; $909e: 1d 11 01 10   Data
            .hex fe 10 01 10   ; $90a2: fe 10 01 10   Data
            .hex 00            ; $90a6: 00            Data

;-------------------------------------------------------------------------------
            lda #$01           ; $90a7: a9 01
            sta $04a0          ; $90a9: 8d a0 04
            jsr __8017         ; $90ac: 20 17 80
            jsr __81fe         ; $90af: 20 fe 81
            .db <__90bf, >__90bf
            jsr __8205         ; $90b4: 20 05 82
            .db <__90cf, >__90cf
            jsr __820c         ; $90b9: 20 0c 82
            .db <__90e1, >__90e1
            rts                ; $90be: 60

;-------------------------------------------------------------------------------
__90bf:     .hex 00 fe 03 00   ; $90bf: 00 fe 03 00   Data
            .hex d3 bc ed 90   ; $90c3: d3 bc ed 90   Data
            .hex ed 90 ed 90   ; $90c7: ed 90 ed 90   Data
            .hex ed 90 00 00   ; $90cb: ed 90 00 00   Data
__90cf:     .hex 00 fe 03 00   ; $90cf: 00 fe 03 00   Data
            .hex d3 bc f2 90   ; $90d3: d3 bc f2 90   Data
            .hex f2 90 f2 90   ; $90d7: f2 90 f2 90   Data
            .hex f2 90 00 ff   ; $90db: f2 90 00 ff   Data
            .hex a3 8e         ; $90df: a3 8e         Data
__90e1:     .hex 00 fe 03 00   ; $90e1: 00 fe 03 00   Data
            .hex 98 00 f7 90   ; $90e5: 98 00 f7 90   Data
            .hex 00 ff af 8e   ; $90e9: 00 ff af 8e   Data
            .hex f0 90 01 10   ; $90ed: f0 90 01 10   Data
            .hex 00 ea 90 01   ; $90f1: 00 ea 90 01   Data
            .hex 10 00 01 a0   ; $90f5: 10 00 01 a0   Data
            .hex 00 20 17 80   ; $90f9: 00 20 17 80   Data
            .hex 20 fe 81 0d   ; $90fd: 20 fe 81 0d   Data
            .hex 91 20 05 82   ; $9101: 91 20 05 82   Data
            .hex 19 91 20 0c   ; $9105: 19 91 20 0c   Data
            .hex 82 25 91 60   ; $9109: 82 25 91 60   Data
            .hex 00 fe 02 00   ; $910d: 00 fe 02 00   Data
            .hex 98 00 31 91   ; $9111: 98 00 31 91   Data
            .hex 00 ff 0d 91   ; $9115: 00 ff 0d 91   Data
            .hex 00 fe 02 00   ; $9119: 00 fe 02 00   Data
            .hex 98 00 ac 91   ; $911d: 98 00 ac 91   Data
            .hex 00 ff 19 91   ; $9121: 00 ff 19 91   Data
            .hex 00 fe 02 00   ; $9125: 00 fe 02 00   Data
            .hex 98 00 27 92   ; $9129: 98 00 27 92   Data
            .hex 00 ff 25 91   ; $912d: 00 ff 25 91   Data
            .hex 71 20 5f 00   ; $9131: 71 20 5f 00   Data
            .hex 55 20 71 00   ; $9135: 55 20 71 00   Data
            .hex 47 20 47 00   ; $9139: 47 20 47 00   Data
            .hex 01 40 71 20   ; $913d: 01 40 71 20   Data
            .hex 5f 00 55 20   ; $9141: 5f 00 55 20   Data
            .hex 71 00 47 20   ; $9145: 71 00 47 20   Data
            .hex 47 00 01 40   ; $9149: 47 00 01 40   Data
            .hex 71 20 5f 00   ; $914d: 71 20 5f 00   Data
            .hex 55 20 71 00   ; $9151: 55 20 71 00   Data
            .hex 47 20 47 00   ; $9155: 47 20 47 00   Data
            .hex 01 40 71 20   ; $9159: 01 40 71 20   Data
            .hex 5f 00 55 20   ; $915d: 5f 00 55 20   Data
            .hex 71 00 47 20   ; $9161: 71 00 47 20   Data
            .hex 47 00 01 40   ; $9165: 47 00 01 40   Data
            .hex 4c 20 43 00   ; $9169: 4c 20 43 00   Data
            .hex 39 20 4c 00   ; $916d: 39 20 4c 00   Data
            .hex 43 20 39 00   ; $9171: 43 20 39 00   Data
            .hex 4c 20 43 00   ; $9175: 4c 20 43 00   Data
            .hex 39 20 4c 00   ; $9179: 39 20 4c 00   Data
            .hex 43 20 39 00   ; $917d: 43 20 39 00   Data
            .hex 4c 20 43 00   ; $9181: 4c 20 43 00   Data
            .hex 39 40 4c 20   ; $9185: 39 40 4c 20   Data
            .hex 43 00 39 20   ; $9189: 43 00 39 20   Data
            .hex 4c 00 43 20   ; $918d: 4c 00 43 20   Data
            .hex 39 00 4c 20   ; $9191: 39 00 4c 20   Data
            .hex 43 00 39 20   ; $9195: 43 00 39 20   Data
            .hex 4c 00 43 20   ; $9199: 4c 00 43 20   Data
            .hex 39 00 4c 00   ; $919d: 39 00 4c 00   Data
            .hex 43 00 39 00   ; $91a1: 43 00 39 00   Data
            .hex 4c 00 43 00   ; $91a5: 4c 00 43 00   Data
            .hex 39 00 00 70   ; $91a9: 39 00 00 70   Data
            .hex 20 5e 00 54   ; $91ad: 20 5e 00 54   Data
            .hex 20 70 00 46   ; $91b1: 20 70 00 46   Data
            .hex 20 46 00 01   ; $91b5: 20 46 00 01   Data
            .hex 40 70 20 5e   ; $91b9: 40 70 20 5e   Data
            .hex 00 54 20 70   ; $91bd: 00 54 20 70   Data
            .hex 00 46 20 46   ; $91c1: 00 46 20 46   Data
            .hex 00 01 40 70   ; $91c5: 00 01 40 70   Data
            .hex 20 5e 00 54   ; $91c9: 20 5e 00 54   Data
            .hex 20 70 00 46   ; $91cd: 20 70 00 46   Data
            .hex 20 46 00 01   ; $91d1: 20 46 00 01   Data
            .hex 40 70 20 5e   ; $91d5: 40 70 20 5e   Data
            .hex 00 54 20 70   ; $91d9: 00 54 20 70   Data
            .hex 00 46 20 46   ; $91dd: 00 46 20 46   Data
            .hex 00 01 40 4b   ; $91e1: 00 01 40 4b   Data
            .hex 20 42 00 38   ; $91e5: 20 42 00 38   Data
            .hex 20 4b 00 42   ; $91e9: 20 4b 00 42   Data
            .hex 20 38 00 4b   ; $91ed: 20 38 00 4b   Data
            .hex 20 42 00 38   ; $91f1: 20 42 00 38   Data
            .hex 20 4b 00 42   ; $91f5: 20 4b 00 42   Data
            .hex 20 38 00 4b   ; $91f9: 20 38 00 4b   Data
            .hex 20 42 00 38   ; $91fd: 20 42 00 38   Data
            .hex 40 4b 20 42   ; $9201: 40 4b 20 42   Data
            .hex 00 38 20 4b   ; $9205: 00 38 20 4b   Data
            .hex 00 42 20 38   ; $9209: 00 42 20 38   Data
            .hex 00 4b 20 42   ; $920d: 00 4b 20 42   Data
            .hex 00 38 20 4b   ; $9211: 00 38 20 4b   Data
            .hex 00 42 20 38   ; $9215: 00 42 20 38   Data
            .hex 00 4b 00 42   ; $9219: 00 4b 00 42   Data
            .hex 00 38 00 4b   ; $921d: 00 38 00 4b   Data
            .hex 00 42 00 38   ; $9221: 00 42 00 38   Data
            .hex 00 00 3b 62   ; $9225: 00 00 3b 62   Data
            .hex 01 60 01 10   ; $9229: 01 60 01 10   Data
            .hex 1d 61 01 60   ; $922d: 1d 61 01 60   Data
            .hex 01 10 3b 62   ; $9231: 01 10 3b 62   Data
            .hex 01 60 01 10   ; $9235: 01 60 01 10   Data
            .hex 1d 61 01 60   ; $9239: 1d 61 01 60   Data
            .hex 01 10 3b 62   ; $923d: 01 10 3b 62   Data
            .hex 01 60 01 10   ; $9241: 01 60 01 10   Data
            .hex 1d 61 01 60   ; $9245: 1d 61 01 60   Data
            .hex 01 10 3b 62   ; $9249: 01 10 3b 62   Data
            .hex 01 60 01 10   ; $924d: 01 60 01 10   Data
            .hex 1d 61 01 60   ; $9251: 1d 61 01 60   Data
            .hex 01 10 3b 62   ; $9255: 01 10 3b 62   Data
            .hex 01 60 01 10   ; $9259: 01 60 01 10   Data
            .hex 1d 61 01 60   ; $925d: 1d 61 01 60   Data
            .hex 01 10 3b 62   ; $9261: 01 10 3b 62   Data
            .hex 01 60 01 10   ; $9265: 01 60 01 10   Data
            .hex 1d 61 01 60   ; $9269: 1d 61 01 60   Data
            .hex 01 10 3b 62   ; $926d: 01 10 3b 62   Data
            .hex 01 60 01 10   ; $9271: 01 60 01 10   Data
            .hex 1d 61 01 60   ; $9275: 1d 61 01 60   Data
            .hex 01 10 3b 62   ; $9279: 01 10 3b 62   Data
            .hex 01 60 01 10   ; $927d: 01 60 01 10   Data
            .hex 1d 61 01 60   ; $9281: 1d 61 01 60   Data
            .hex 01 10 c5 61   ; $9285: 01 10 c5 61   Data
            .hex 01 60 01 10   ; $9289: 01 60 01 10   Data
            .hex e3 60 01 60   ; $928d: e3 60 01 60   Data
            .hex 01 10 c5 61   ; $9291: 01 10 c5 61   Data
            .hex 01 60 01 10   ; $9295: 01 60 01 10   Data
            .hex e3 60 01 60   ; $9299: e3 60 01 60   Data
            .hex 01 10 c5 61   ; $929d: 01 10 c5 61   Data
            .hex 01 60 01 10   ; $92a1: 01 60 01 10   Data
            .hex e3 60 01 60   ; $92a5: e3 60 01 60   Data
            .hex 01 10 c5 61   ; $92a9: 01 10 c5 61   Data
            .hex 01 60 01 10   ; $92ad: 01 60 01 10   Data
            .hex e3 60 01 60   ; $92b1: e3 60 01 60   Data
            .hex 01 10 c5 61   ; $92b5: 01 10 c5 61   Data
            .hex 01 60 01 10   ; $92b9: 01 60 01 10   Data
            .hex e3 60 01 60   ; $92bd: e3 60 01 60   Data
            .hex 01 10 c5 61   ; $92c1: 01 10 c5 61   Data
            .hex 01 60 01 10   ; $92c5: 01 60 01 10   Data
            .hex e3 60 01 60   ; $92c9: e3 60 01 60   Data
            .hex 01 10 c5 61   ; $92cd: 01 10 c5 61   Data
            .hex 01 60 01 10   ; $92d1: 01 60 01 10   Data
            .hex e3 60 01 60   ; $92d5: e3 60 01 60   Data
            .hex 01 10 c5 61   ; $92d9: 01 10 c5 61   Data
            .hex 01 60 01 10   ; $92dd: 01 60 01 10   Data
            .hex e3 60 01 60   ; $92e1: e3 60 01 60   Data
            .hex 01 10 00      ; $92e5: 01 10 00      Data

;-------------------------------------------------------------------------------
            jsr __8017         ; $92e8: 20 17 80
            jsr __81fe         ; $92eb: 20 fe 81
            .db <__92f6, >__92f6
            jsr __8205         ; $92f0: 20 05 82
            .db <__9308, >__9308
            rts                ; $92f5: 60

;-------------------------------------------------------------------------------
__92f6:     .hex 00 fe 06 00   ; $92f6: 00 fe 06 00   Data
            .hex 9c 00 1a 93   ; $92fa: 9c 00 1a 93   Data
            .hex 1a 93 1a 93   ; $92fe: 1a 93 1a 93   Data
            .hex 1a 93 23 93   ; $9302: 1a 93 23 93   Data
            .hex 00 00         ; $9306: 00 00         Data
__9308:     .hex 00 fe 06 00   ; $9308: 00 fe 06 00   Data
            .hex 9c 00 34 93   ; $930c: 9c 00 34 93   Data
            .hex 36 93 36 93   ; $9310: 36 93 36 93   Data
            .hex 36 93 3f 93   ; $9314: 36 93 3f 93   Data
            .hex 00 00 43 30   ; $9318: 00 00 43 30   Data
            .hex 32 30 43 30   ; $931c: 32 30 43 30   Data
            .hex 32 30 00 5d   ; $9320: 32 30 00 5d   Data
            .hex 32 e0 31 68   ; $9324: 32 e0 31 68   Data
            .hex 31 0d 31 ca   ; $9328: 31 0d 31 ca   Data
            .hex 30 97 30 78   ; $932c: 30 97 30 78   Data
            .hex 30 5a 30 00   ; $9330: 30 5a 30 00   Data
            .hex 01 10 3c 30   ; $9334: 01 10 3c 30   Data
            .hex 2d 30 3c 30   ; $9338: 2d 30 3c 30   Data
            .hex 2d 30 00 1b   ; $933c: 2d 30 00 1b   Data
            .hex 32 94 31 2e   ; $9340: 32 94 31 2e   Data
            .hex 31 f0 30 b4   ; $9344: 31 f0 30 b4   Data
            .hex 30 87 30 65   ; $9348: 30 87 30 65   Data
            .hex 30 4c 30 00   ; $934c: 30 4c 30 00   Data

;-------------------------------------------------------------------------------
            jsr __8017         ; $9350: 20 17 80
            jsr __81fe         ; $9353: 20 fe 81
            .db <__9363, >__9363
            jsr __8205         ; $9358: 20 05 82
            .db <__936d, >__936d
            jsr __820c         ; $935d: 20 0c 82
            .db <__9377, >__9377
            rts                ; $9362: 60

;-------------------------------------------------------------------------------
__9363:     .hex 00 fe 01 00   ; $9363: 00 fe 01 00   Data
            .hex 9a 00 81 93   ; $9367: 9a 00 81 93   Data
            .hex 00 00         ; $936b: 00 00         Data
__936d:     .hex 00 fe 01 00   ; $936d: 00 fe 01 00   Data
            .hex 9a 00 9c 93   ; $9371: 9a 00 9c 93   Data
            .hex 00 00         ; $9375: 00 00         Data
__9377:     .hex 00 fe 01 00   ; $9377: 00 fe 01 00   Data
            .hex 98 00 b7 93   ; $937b: 98 00 b7 93   Data
            .hex 00 00 01 c0   ; $937f: 00 00 01 c0   Data
            .hex be 90 ca c0   ; $9383: be 90 ca c0   Data
            .hex be 90 be c0   ; $9387: be 90 be c0   Data
            .hex b4 90 aa 90   ; $938b: b4 90 aa 90   Data
            .hex 97 90 8f 90   ; $938f: 97 90 8f 90   Data
            .hex 01 80 01 c0   ; $9393: 01 80 01 c0   Data
            .hex 1d 91 01 10   ; $9397: 1d 91 01 10   Data
            .hex 00 01 c0 bd   ; $939b: 00 01 c0 bd   Data
            .hex 90 cb c0 bd   ; $939f: 90 cb c0 bd   Data
            .hex 90 bd c0 b3   ; $93a3: 90 bd c0 b3   Data
            .hex 90 aa 90 96   ; $93a7: 90 aa 90 96   Data
            .hex 90 8e 90 01   ; $93ab: 90 8e 90 01   Data
            .hex 80 01 c0 1c   ; $93af: 80 01 c0 1c   Data
            .hex 91 01 10 00   ; $93b3: 91 01 10 00   Data
            .hex 7d 91 01 c0   ; $93b7: 7d 91 01 c0   Data
            .hex 94 91 01 c0   ; $93bb: 94 91 01 c0   Data
            .hex ac 91 01 c0   ; $93bf: ac 91 01 c0   Data
            .hex c5 91 01 c0   ; $93c3: c5 91 01 c0   Data
            .hex 3b 92 01 c0   ; $93c7: 3b 92 01 c0   Data
            .hex 01 c0 3b 92   ; $93cb: 01 c0 3b 92   Data
            .hex 01 10 00 20   ; $93cf: 01 10 00 20   Data
            .hex 17 80 20 05   ; $93d3: 17 80 20 05   Data
            .hex 82 e0 93 20   ; $93d7: 82 e0 93 20   Data
            .hex 0c 82 f2 93   ; $93db: 0c 82 f2 93   Data
            .hex 60 00 fe 05   ; $93df: 60 00 fe 05   Data
            .hex 00 9c 00 1c   ; $93e3: 00 9c 00 1c   Data
            .hex 94 3d 94 5e   ; $93e7: 94 3d 94 5e   Data
            .hex 94 3d 94 00   ; $93eb: 94 3d 94 00   Data
            .hex ff e6 93 00   ; $93ef: ff e6 93 00   Data
            .hex fe 05 00 98   ; $93f3: fe 05 00 98   Data
            .hex 00 7f 94 7f   ; $93f7: 00 7f 94 7f   Data
            .hex 94 7f 94 7f   ; $93fb: 94 7f 94 7f   Data
            .hex 94 88 94 88   ; $93ff: 94 88 94 88   Data
            .hex 94 88 94 88   ; $9403: 94 88 94 88   Data
            .hex 94 91 94 91   ; $9407: 94 91 94 91   Data
            .hex 94 91 94 91   ; $940b: 94 91 94 91   Data
            .hex 94 88 94 88   ; $940f: 94 88 94 88   Data
            .hex 94 88 94 88   ; $9413: 94 88 94 88   Data
            .hex 94 00 ff f8   ; $9417: 94 00 ff f8   Data
            .hex 93 d6 10 6b   ; $941b: 93 d6 10 6b   Data
            .hex 10 aa 10 55   ; $941f: 10 aa 10 55   Data
            .hex 10 8f 10 47   ; $9423: 10 8f 10 47   Data
            .hex 10 6b 10 35   ; $9427: 10 6b 10 35   Data
            .hex 10 6b 10 35   ; $942b: 10 6b 10 35   Data
            .hex 10 8f 10 47   ; $942f: 10 8f 10 47   Data
            .hex 10 aa 10 55   ; $9433: 10 aa 10 55   Data
            .hex 10 d6 10 6b   ; $9437: 10 d6 10 6b   Data
            .hex 10 00 be 10   ; $943b: 10 00 be 10   Data
            .hex 5f 10 a0 10   ; $943f: 5f 10 a0 10   Data
            .hex 50 10 7f 10   ; $9443: 50 10 7f 10   Data
            .hex 40 10 5f 10   ; $9447: 40 10 5f 10   Data
            .hex 30 10 5f 10   ; $944b: 30 10 5f 10   Data
            .hex 30 10 7f 10   ; $944f: 30 10 7f 10   Data
            .hex 40 10 a0 10   ; $9453: 40 10 a0 10   Data
            .hex 50 10 be 10   ; $9457: 50 10 be 10   Data
            .hex 5f 10 00 aa   ; $945b: 5f 10 00 aa   Data
            .hex 10 55 10 8f   ; $945f: 10 55 10 8f   Data
            .hex 10 47 10 71   ; $9463: 10 47 10 71   Data
            .hex 10 39 10 55   ; $9467: 10 39 10 55   Data
            .hex 10 2a 10 55   ; $946b: 10 2a 10 55   Data
            .hex 10 2a 10 71   ; $946f: 10 2a 10 71   Data
            .hex 10 39 10 8f   ; $9473: 10 39 10 8f   Data
            .hex 10 47 10 aa   ; $9477: 10 47 10 aa   Data
            .hex 10 55 10 00   ; $947b: 10 55 10 00   Data
            .hex ac f1 01 10   ; $947f: ac f1 01 10   Data
            .hex d6 f0 01 10   ; $9483: d6 f0 01 10   Data
            .hex 00 7d f1 01   ; $9487: 00 7d f1 01   Data
            .hex 10 be f0 01   ; $948b: 10 be f0 01   Data
            .hex 10 00 53 f1   ; $948f: 10 00 53 f1   Data
            .hex 01 10 aa f0   ; $9493: 01 10 aa f0   Data
            .hex 01 10 00 a9   ; $9497: 01 10 00 a9   Data
            .hex 01 8d a0 04   ; $949b: 01 8d a0 04   Data
            .hex 20 17 80 20   ; $949f: 20 17 80 20   Data
            .hex fe 81 b2 94   ; $94a3: fe 81 b2 94   Data
            .hex 20 05 82 bc   ; $94a7: 20 05 82 bc   Data
            .hex 94 20 0c 82   ; $94ab: 94 20 0c 82   Data
            .hex c8 94 60 00   ; $94af: c8 94 60 00   Data
            .hex fe 07 00 9e   ; $94b3: fe 07 00 9e   Data
            .hex 00 d4 94 00   ; $94b7: 00 d4 94 00   Data
            .hex 00 00 fe 07   ; $94bb: 00 00 fe 07   Data
            .hex 00 9e 00 e1   ; $94bf: 00 9e 00 e1   Data
            .hex 94 00 ff a3   ; $94c3: 94 00 ff a3   Data
            .hex 8e 00 fe 07   ; $94c7: 8e 00 fe 07   Data
            .hex 00 be 00 d4   ; $94cb: 00 be 00 d4   Data
            .hex 94 00 ff af   ; $94cf: 94 00 ff af   Data
            .hex 8e fd 61 01   ; $94d3: 8e fd 61 01   Data
            .hex 30 fd 11 1b   ; $94d7: 30 fd 11 1b   Data
            .hex 12 81 62 5d   ; $94db: 12 81 62 5d   Data
            .hex 62 00 f9 61   ; $94df: 62 00 f9 61   Data
            .hex 01 30 f9 11   ; $94e3: 01 30 f9 11   Data
            .hex 17 12 7d 62   ; $94e7: 17 12 7d 62   Data
            .hex 59 62 00      ; $94eb: 59 62 00      Data

;-------------------------------------------------------------------------------
            jsr __81fe         ; $94ee: 20 fe 81
            .db <__94f4, >__94f4
            rts                ; $94f3: 60

;-------------------------------------------------------------------------------
__94f4:     .hex 00 fe 03 00   ; $94f4: 00 fe 03 00   Data
            .hex b6 84 aa 95   ; $94f8: b6 84 aa 95   Data
            .hex 00 b6 8d ad   ; $94fc: 00 b6 8d ad   Data
            .hex 95 00 b2 8e   ; $9500: 95 00 b2 8e   Data
            .hex b0 95 00 92   ; $9504: b0 95 00 92   Data
            .hex bd b3 95 00   ; $9508: bd b3 95 00   Data
            .hex 00            ; $950c: 00            Data

;-------------------------------------------------------------------------------
            jsr __81fe         ; $950d: 20 fe 81
            .db <__9513, >__9513
            rts                ; $9512: 60

;-------------------------------------------------------------------------------
__9513:     .hex 00 fe 01 00   ; $9513: 00 fe 01 00   Data
            .hex b2 94 b6 95   ; $9517: b2 94 b6 95   Data
            .hex 00 b2 9b b9   ; $951b: 00 b2 9b b9   Data
            .hex 95 00 b2 9c   ; $951f: 95 00 b2 9c   Data
            .hex ad 95 00 b2   ; $9523: ad 95 00 b2   Data
            .hex 9b bc 95 00   ; $9527: 9b bc 95 00   Data
            .hex 00            ; $952b: 00            Data

;-------------------------------------------------------------------------------
            jsr __81fe         ; $952c: 20 fe 81
            .db <__9532, >__9532
            rts                ; $9531: 60

;-------------------------------------------------------------------------------
__9532:     .hex 00 fe 01 00   ; $9532: 00 fe 01 00   Data
            .hex 53 93 bf 95   ; $9536: 53 93 bf 95   Data
            .hex 00 53 9c c2   ; $953a: 00 53 9c c2   Data
            .hex 95 00 53 92   ; $953e: 95 00 53 92   Data
            .hex c5 95 00 53   ; $9542: c5 95 00 53   Data
            .hex 9b c8 95 00   ; $9546: 9b c8 95 00   Data
            .hex 53 9c cb 95   ; $954a: 53 9c cb 95   Data
            .hex 00 53 93 ce   ; $954e: 00 53 93 ce   Data
            .hex 95 00 53 9c   ; $9552: 95 00 53 9c   Data
            .hex ce 95 00 53   ; $9556: ce 95 00 53   Data
            .hex 93 d1 95 00   ; $955a: 93 d1 95 00   Data
            .hex 53 9c d1 95   ; $955e: 53 9c d1 95   Data
            .hex 00 53 93 d4   ; $9562: 00 53 93 d4   Data
            .hex 95 00 53 9c   ; $9566: 95 00 53 9c   Data
            .hex d4 95 00 53   ; $956a: d4 95 00 53   Data
            .hex 93 d7 95 00   ; $956e: 93 d7 95 00   Data
            .hex 53 9c d7 95   ; $9572: 53 9c d7 95   Data
            .hex 00 53 94 da   ; $9576: 00 53 94 da   Data
            .hex 95 00 53 9c   ; $957a: 95 00 53 9c   Data
            .hex da 95 00 53   ; $957e: da 95 00 53   Data
            .hex 94 dd 95 00   ; $9582: 94 dd 95 00   Data
            .hex 53 9c dd 95   ; $9586: 53 9c dd 95   Data
            .hex 00 53 94 e0   ; $958a: 00 53 94 e0   Data
            .hex 95 00 53 9d   ; $958e: 95 00 53 9d   Data
            .hex e0 95 00 53   ; $9592: e0 95 00 53   Data
            .hex 94 e3 95 00   ; $9596: 94 e3 95 00   Data
            .hex 53 9d e3 95   ; $959a: 53 9d e3 95   Data
            .hex 00 53 94 e6   ; $959e: 00 53 94 e6   Data
            .hex 95 00 53 9d   ; $95a2: 95 00 53 9d   Data
            .hex e9 95 00 00   ; $95a6: e9 95 00 00   Data
            .hex 7f 10 00 82   ; $95aa: 7f 10 00 82   Data
            .hex 10 00 80 10   ; $95ae: 10 00 80 10   Data
            .hex 00 80 20 00   ; $95b2: 00 80 20 00   Data
            .hex 81 10 00 84   ; $95b6: 81 10 00 84   Data
            .hex 10 00 81 20   ; $95ba: 10 00 81 20   Data
            .hex 00 0d 01 00   ; $95be: 00 0d 01 00   Data
            .hex 1d 31 00 0d   ; $95c2: 1d 31 00 0d   Data
            .hex 31 00 fe 30   ; $95c6: 31 00 fe 30   Data
            .hex 00 fe 00 00   ; $95ca: 00 fe 00 00   Data
            .hex f0 30 00 e3   ; $95ce: f0 30 00 e3   Data
            .hex 30 00 d6 30   ; $95d2: 30 00 d6 30   Data
            .hex 00 ca 30 00   ; $95d6: 00 ca 30 00   Data
            .hex be 30 00 b4   ; $95da: be 30 00 b4   Data
            .hex 30 00 aa 30   ; $95de: 30 00 aa 30   Data
            .hex 00 a0 30 00   ; $95e2: 00 a0 30 00   Data
            .hex 97 30 00 97   ; $95e6: 97 30 00 97   Data
            .hex 10 00         ; $95ea: 10 00         Data

;-------------------------------------------------------------------------------
            jsr __81fe         ; $95ec: 20 fe 81
            .db <__95f2, >__95f2
            rts                ; $95f1: 60

;-------------------------------------------------------------------------------
__95f2:     .hex 00 fe 03 00   ; $95f2: 00 fe 03 00   Data
            .hex f8 5b fc 95   ; $95f6: f8 5b fc 95   Data
            .hex 00 00 78 30   ; $95fa: 00 00 78 30   Data
            .hex 6b 30 5f 30   ; $95fe: 6b 30 5f 30   Data
            .hex 5a 30 50 30   ; $9602: 5a 30 50 30   Data
            .hex 47 30 3f 30   ; $9606: 47 30 3f 30   Data
            .hex 3c a0 01 10   ; $960a: 3c a0 01 10   Data
            .hex 00 20 fe 81   ; $960e: 00 20 fe 81   Data
            .hex 15 96 60 00   ; $9612: 15 96 60 00   Data
            .hex fe 01 00 73   ; $9616: fe 01 00 73   Data
            .hex 9e 1f 96 00   ; $961a: 9e 1f 96 00   Data
            .hex 00 c5 31 01   ; $961e: 00 c5 31 01   Data
            .hex 30 68 31 01   ; $9622: 30 68 31 01   Data
            .hex 30 1d 31 01   ; $9626: 30 1d 31 01   Data
            .hex 30 f0 30 01   ; $962a: 30 f0 30 01   Data
            .hex 30 be 30 01   ; $962e: 30 be 30 01   Data
            .hex 30 97 30 01   ; $9632: 30 97 30 01   Data
            .hex 30 7f 30 01   ; $9636: 30 7f 30 01   Data
            .hex 30 65 30 01   ; $963a: 30 65 30 01   Data
            .hex 30 50 30 01   ; $963e: 30 50 30 01   Data
            .hex 30 3f 30 01   ; $9642: 30 3f 30 01   Data
            .hex 30 35 30 01   ; $9646: 30 35 30 01   Data
            .hex 30 00         ; $964a: 30 00         Data

;-------------------------------------------------------------------------------
            jsr __81fe         ; $964c: 20 fe 81
            .db <__9652, >__9652
            rts                ; $9651: 60

;-------------------------------------------------------------------------------
__9652:     .hex 00 fe 02 00   ; $9652: 00 fe 02 00   Data
            .hex b1 ab 5c 96   ; $9656: b1 ab 5c 96   Data
            .hex 00 00 fd 11   ; $965a: 00 00 fd 11   Data
            .hex e0 11 c5 11   ; $965e: e0 11 c5 11   Data
            .hex ac 11 94 11   ; $9662: ac 11 94 11   Data
            .hex 7d 11 3b 12   ; $9666: 7d 11 3b 12   Data
            .hex 1b 12 fd 11   ; $966a: 1b 12 fd 11   Data
            .hex e0 11 c5 11   ; $966e: e0 11 c5 11   Data
            .hex ac 11 94 11   ; $9672: ac 11 94 11   Data
            .hex 7d 11 68 11   ; $9676: 7d 11 68 11   Data
            .hex 53 11 40 11   ; $967a: 53 11 40 11   Data
            .hex 2e 11 1d 11   ; $967e: 2e 11 1d 11   Data
            .hex 0d 11 fe 10   ; $9682: 0d 11 fe 10   Data
            .hex f0 10 e3 10   ; $9686: f0 10 e3 10   Data
            .hex d6 10 ca 10   ; $968a: d6 10 ca 10   Data
            .hex be 10 b4 10   ; $968e: be 10 b4 10   Data
            .hex aa 10 a0 10   ; $9692: aa 10 a0 10   Data
            .hex 97 10 8f 10   ; $9696: 97 10 8f 10   Data
            .hex 87 10 7f 20   ; $969a: 87 10 7f 20   Data
            .hex 00            ; $969e: 00            Data

;-------------------------------------------------------------------------------
            jsr __81fe         ; $969f: 20 fe 81
            .db <__96a5, >__96a5
            rts                ; $96a4: 60

;-------------------------------------------------------------------------------
__96a5:     .hex 00 fe 01 00   ; $96a5: 00 fe 01 00   Data
            .hex b3 aa bd 96   ; $96a9: b3 aa bd 96   Data
            .hex c0 96 bd 96   ; $96ad: c0 96 bd 96   Data
            .hex 00 b3 fb c0   ; $96b1: 00 b3 fb c0   Data
            .hex 96 00 98 f8   ; $96b5: 96 00 98 f8   Data
            .hex c3 96 00 00   ; $96b9: c3 96 00 00   Data
            .hex 1e 10 00 1f   ; $96bd: 1e 10 00 1f   Data
            .hex 10 00 1e b0   ; $96c1: 10 00 1e b0   Data
            .hex 01 10 00      ; $96c5: 01 10 00      Data

;-------------------------------------------------------------------------------
            jsr __81fe         ; $96c8: 20 fe 81
            .db <__96ce, >__96ce
            rts                ; $96cd: 60

;-------------------------------------------------------------------------------
__96ce:     .hex 00 fe 01 00   ; $96ce: 00 fe 01 00   Data
            .hex bf 88 d8 96   ; $96d2: bf 88 d8 96   Data
            .hex 00 00 6b 20   ; $96d6: 00 00 6b 20   Data
            .hex 55 20 6b 20   ; $96da: 55 20 6b 20   Data
            .hex 47 20 55 d0   ; $96de: 47 20 55 d0   Data
            .hex 01 10 00      ; $96e2: 01 10 00      Data

;-------------------------------------------------------------------------------
            jsr __81fe         ; $96e5: 20 fe 81
            .db <__96f1, >__96f1
            rts                ; $96ea: 60

;-------------------------------------------------------------------------------
            jsr __81fe         ; $96eb: 20 fe 81
            .db <__9700, >__9700
            rts                ; $96f0: 60

;-------------------------------------------------------------------------------
__96f1:     .hex 00 fe 02 00   ; $96f1: 00 fe 02 00   Data
            .hex 92 93 0f 97   ; $96f5: 92 93 0f 97   Data
            .hex 00 b2 8c 0f   ; $96f9: 00 b2 8c 0f   Data
            .hex 97 00 00      ; $96fd: 97 00 00      Data
__9700:     .hex 00 fe 04 00   ; $9700: 00 fe 04 00   Data
            .hex b2 94 15 97   ; $9704: b2 94 15 97   Data
            .hex 00 b2 9c 12   ; $9708: 00 b2 9c 12   Data
            .hex 97 00 00 65   ; $970c: 97 00 00 65   Data
            .hex 30 00 75 10   ; $9710: 30 00 75 10   Data
            .hex 00 76 10 76   ; $9714: 00 76 10 76   Data
            .hex 10 00         ; $9718: 10 00         Data

;-------------------------------------------------------------------------------
            jsr __81fe         ; $971a: 20 fe 81
            .db <__9720, >__9720
            rts                ; $971f: 60

;-------------------------------------------------------------------------------
__9720:     .hex 00 fe 02 00   ; $9720: 00 fe 02 00   Data
            .hex b2 b9 2a 97   ; $9724: b2 b9 2a 97   Data
            .hex 00 00 1d 11   ; $9728: 00 00 1d 11   Data
            .hex 0d 11 fe 10   ; $972c: 0d 11 fe 10   Data
            .hex f0 10 e3 10   ; $9730: f0 10 e3 10   Data
            .hex d6 10 ca 10   ; $9734: d6 10 ca 10   Data
            .hex be 10 b4 10   ; $9738: be 10 b4 10   Data
            .hex aa 10 a0 10   ; $973c: aa 10 a0 10   Data
            .hex 97 10 8f 10   ; $9740: 97 10 8f 10   Data
            .hex 87 10 7f 10   ; $9744: 87 10 7f 10   Data
            .hex 78 10 71 10   ; $9748: 78 10 71 10   Data
            .hex 6b 10 65 10   ; $974c: 6b 10 65 10   Data
            .hex 5f 10 5a 10   ; $9750: 5f 10 5a 10   Data
            .hex 55 10 50 10   ; $9754: 55 10 50 10   Data
            .hex 4c 10 47 10   ; $9758: 4c 10 47 10   Data
            .hex 43 10 3f 10   ; $975c: 43 10 3f 10   Data
            .hex 3c 30 39 30   ; $9760: 3c 30 39 30   Data
            .hex 35 30 32 30   ; $9764: 35 30 32 30   Data
            .hex 30 30 00      ; $9768: 30 30 00      Data

;-------------------------------------------------------------------------------
            jsr __81fe         ; $976b: 20 fe 81
            .db <__9771, >__9771
            rts                ; $9770: 60

;-------------------------------------------------------------------------------
__9771:     .hex 00 fe 01 00   ; $9771: 00 fe 01 00   Data
            .hex bf 88 7b 97   ; $9775: bf 88 7b 97   Data
            .hex 00 00 7f 20   ; $9779: 00 00 7f 20   Data
            .hex 8f a0 01 10   ; $977d: 8f a0 01 10   Data
            .hex 00 20 fe 81   ; $9781: 00 20 fe 81   Data
            .hex 98 97 20 13   ; $9785: 98 97 20 13   Data
            .hex 82 ac 97 60   ; $9789: 82 ac 97 60   Data
            .hex 20 fe 81 bb   ; $978d: 20 fe 81 bb   Data
            .hex 97 20 13 82   ; $9791: 97 20 13 82   Data
            .hex cf 97 60 00   ; $9795: cf 97 60 00   Data
            .hex fe 03 00 f3   ; $9799: fe 03 00 f3   Data
            .hex 9a de 97 00   ; $979d: 9a de 97 00   Data
            .hex b8 f3 e3 97   ; $97a1: b8 f3 e3 97   Data
            .hex 00 b8 f1 0e   ; $97a5: 00 b8 f1 0e   Data
            .hex 98 00 00 00   ; $97a9: 98 00 00 00   Data
            .hex fe 03 00 3f   ; $97ad: fe 03 00 3f   Data
            .hex 00 11 98 00   ; $97b1: 00 11 98 00   Data
            .hex 3a 00 20 98   ; $97b5: 3a 00 20 98   Data
            .hex 00 00 00 fe   ; $97b9: 00 00 00 fe   Data
            .hex 02 00 b3 92   ; $97bd: 02 00 b3 92   Data
            .hex de 97 00 b8   ; $97c1: de 97 00 b8   Data
            .hex fb e3 97 00   ; $97c5: fb e3 97 00   Data
            .hex f8 d4 0e 98   ; $97c9: f8 d4 0e 98   Data
            .hex 00 00 00 fe   ; $97cd: 00 00 00 fe   Data
            .hex 02 00 3d 00   ; $97d1: 02 00 3d 00   Data
            .hex 11 98 00 3b   ; $97d5: 11 98 00 3b   Data
            .hex 00 20 98 00   ; $97d9: 00 20 98 00   Data
            .hex 00 af 16 76   ; $97dd: 00 af 16 76   Data
            .hex 14 00 3b 12   ; $97e1: 14 00 3b 12   Data
            .hex 5d 12 81 12   ; $97e5: 5d 12 81 12   Data
            .hex a7 12 cf 12   ; $97e9: a7 12 cf 12   Data
            .hex fa 12 27 13   ; $97ed: fa 12 27 13   Data
            .hex 57 13 8a 13   ; $97f1: 57 13 8a 13   Data
            .hex c0 13 f9 13   ; $97f5: c0 13 f9 13   Data
            .hex 36 14 76 14   ; $97f9: 36 14 76 14   Data
            .hex ba 14 01 15   ; $97fd: ba 14 01 15   Data
            .hex 4e 15 9e 15   ; $9801: 4e 15 9e 15   Data
            .hex f4 15 4e 15   ; $9805: f4 15 4e 15   Data
            .hex af 16 af 16   ; $9809: af 16 af 16   Data
            .hex 00 af 46 00   ; $980d: 00 af 46 00   Data
            .hex 1c 1f 1b 1f   ; $9811: 1c 1f 1b 1f   Data
            .hex 1a 1e 1a 1f   ; $9815: 1a 1e 1a 1f   Data
            .hex 1c 1f 1e 1f   ; $9819: 1c 1f 1e 1f   Data
            .hex 2e 3f 00 1e   ; $981d: 2e 3f 00 1e   Data
            .hex 1f 1e 3f 00   ; $9821: 1f 1e 3f 00   Data
            .hex 20 13 82 2b   ; $9825: 20 13 82 2b   Data
            .hex 98 60 00 fe   ; $9829: 98 60 00 fe   Data
            .hex 00 00 19 00   ; $982d: 00 00 19 00   Data
            .hex 35 98 00 00   ; $9831: 35 98 00 00   Data
            .hex 3d 17 3f 07   ; $9835: 3d 17 3f 07   Data
            .hex 7f 1a 00 20   ; $9839: 7f 1a 00 20   Data
            .hex fe 81 47 98   ; $983d: fe 81 47 98   Data
            .hex 20 13 82 51   ; $9841: 20 13 82 51   Data
            .hex 98 60 00 fe   ; $9845: 98 60 00 fe   Data
            .hex 01 00 79 88   ; $9849: 01 00 79 88   Data
            .hex 5e 98 00 00   ; $984d: 5e 98 00 00   Data
            .hex 00 fe 00 00   ; $9851: 00 fe 00 00   Data
            .hex 3f 00 5b 98   ; $9855: 3f 00 5b 98   Data
            .hex 00 00 66 83   ; $9859: 00 00 66 83   Data
            .hex 00 55 10 aa   ; $985d: 00 55 10 aa   Data
            .hex 10 55 c0 01   ; $9861: 10 55 c0 01   Data
            .hex 10 00 20 fe   ; $9865: 10 00 20 fe   Data
            .hex 81 6d 98 60   ; $9869: 81 6d 98 60   Data
            .hex 00 fe 02 00   ; $986d: 00 fe 02 00   Data
            .hex 98 7f 77 98   ; $9871: 98 7f 77 98   Data
            .hex 00 00 ac 11   ; $9875: 00 00 ac 11   Data
            .hex d6 10 6b 30   ; $9879: d6 10 6b 30   Data
            .hex d6 50 00      ; $987d: d6 50 00      Data

;-------------------------------------------------------------------------------
            jsr __81fe         ; $9880: 20 fe 81
            .db <__988b, >__988b
            jsr __8213         ; $9885: 20 13 82
            .db <__9895, >__9895
            rts                ; $988a: 60

;-------------------------------------------------------------------------------
__988b:     .hex 00 fe 01 00   ; $988b: 00 fe 01 00   Data
            .hex f0 98 9f 98   ; $988f: f0 98 9f 98   Data
            .hex 00 00         ; $9893: 00 00         Data
__9895:     .hex 00 fe 00 00   ; $9895: 00 fe 00 00   Data
            .hex 1c 00 a4 98   ; $9899: 1c 00 a4 98   Data
            .hex 00 00 c0 43   ; $989d: 00 00 c0 43   Data
            .hex 01 10 00 79   ; $98a1: 01 10 00 79   Data
            .hex 00 20 17 80   ; $98a5: 00 20 17 80   Data
            .hex 20 fe 81 b4   ; $98a9: 20 fe 81 b4   Data
            .hex 98 20 05 82   ; $98ad: 98 20 05 82   Data
            .hex be 98 60 00   ; $98b1: be 98 60 00   Data
            .hex fe 01 00 9f   ; $98b5: fe 01 00 9f   Data
            .hex 68 c8 98 00   ; $98b9: 68 c8 98 00   Data
            .hex 00 00 fe 01   ; $98bd: 00 00 fe 01   Data
            .hex 00 9f 68 d3   ; $98c1: 00 9f 68 d3   Data
            .hex 98 00 00 3f   ; $98c5: 98 00 00 3f   Data
            .hex 20 50 20 3f   ; $98c9: 20 50 20 3f   Data
            .hex 20 50 d0 01   ; $98cd: 20 50 d0 01   Data
            .hex 10 00 01 10   ; $98d1: 10 00 01 10   Data
            .hex 40 20 51 20   ; $98d5: 40 20 51 20   Data
            .hex 40 20 51 d0   ; $98d9: 40 20 51 d0   Data
            .hex 01 10 00 20   ; $98dd: 01 10 00 20   Data
            .hex fe 81 e6 98   ; $98e1: fe 81 e6 98   Data
            .hex 60 00 fe 09   ; $98e5: 60 00 fe 09   Data
            .hex 00 9f 68 f0   ; $98e9: 00 9f 68 f0   Data
            .hex 98 00 00 8f   ; $98ed: 98 00 00 8f   Data
            .hex 30 00         ; $98f1: 30 00         Data
