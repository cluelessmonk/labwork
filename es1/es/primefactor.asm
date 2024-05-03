mov r2,#3Ch
mov r1,#30h
mov r0,#02h
loop1: clr a
clr c
mov a,r2
mov b,r0
div ab
mov r3,a
clr c
mov a,b
subb a,#00h
jz join
clr a
clr c
inc r0
mov a,r3
subb a,#00h
jz exit
sjmp loop1
join: mov a,r0
mov @r1,a
inc r1
mov a,r3
mov r2,a
sjmp loop1
exit: nop
end