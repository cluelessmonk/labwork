ORG 0000h
LJMP MAIN
ORG 40h
MAIN:  MOV R0,#12    ; number to be checked whether zero or one
       MOV R1,#08    ; number of bits to be checked
       MOV A,R0
LOOP:  RLC A         ; left rotating it to check each bit of number
       JC LABEL1     ; if the bit is one jumping to one's counter
       INC R2        ; incrementing the counter for zero bit
       SJMP LABEL2
LABEL1:INC R3        ;incrementing the counter for zero bit
LABEL2:DJNZ R1,LOOP  ; checking the counter of bits
       END