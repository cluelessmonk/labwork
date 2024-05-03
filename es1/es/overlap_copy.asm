MOV R0,#50H;
MOV A,@R0;
MOV R4,A;
MOV R0,#6AH;
MOV R1,#6DH;
repeat: MOV A,@R0;
MOV @R1,A;
DEC R0;
DEC R1;
DJNZ R4,repeat;
SJMP $;
END