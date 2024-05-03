MOV R0,#50H;
MOV A,@R0;
MOV R4,A;
INC R0;
MOV R1,#61H;
repeat: MOV A,@R0;
MOV B,@R1;
MOV @R1,A;
MOV @R0,B;
INC R0;
INC R1;
DJNZ R4,repeat;
SJMP $;
END