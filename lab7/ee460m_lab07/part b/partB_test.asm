20260000	;addi $6, $1, 0
31080000	;andi $8, $8, 0
3c; UNRECOGNIZED  ;lui $4, 28672
; UNRECOGNIZED  ;lui $5, 32767
34000000	;ori $8, $8, 11
1000ffff	;beq $6, $1, loop         LOOP
20000000	;addi $6, $1, 0
00000000	;sll $7, $1, 1
00000020	;add $7, $8, $7
00000008	;jr $7
08000005	;j loop
0c000019	;jal operation0           CALL TABLE
08000005	;j loop
0c00001d	;jal operation1
08000005	;j loop
0c00001f	;jal operation2
08000005	;j loop
0c000021	;jal operation3
08000005	;j loop
0c000023	;jal operation4
08000005	;j loop
0c000025	;jal operation5
08000005	;j loop
0c000027	;jal operation6
08000005	;j loop
; UNRECOGNIZED  ;mult $4,$5         OPERATION0
; UNRECOGNIZED  ;mflo $2
; UNRECOGNIZED  ;mfhi $3
00000008	;jr $31
; UNRECOGNIZED  ;add8 $2, $4, $5    OPERATION1
00000008	;jr $31
; UNRECOGNIZED  ;lui $2, 4096       OPERATION2
00000008	;jr $31
; UNRECOGNIZED  ;rbit $2, $5        OPERATION3
00000008	;jr $31
; UNRECOGNIZED  ;rev $2, $4         OPERATION4
00000008	;jr $31
; UNRECOGNIZED  ;sadd $2, $5, $5    OPERATION5
00000008	;jr $31
; UNRECOGNIZED  ;ssub $2, $4, $5    OPERATION6
03E00008	;jr $31