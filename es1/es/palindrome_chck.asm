mov 30h,#80h
mov r0,30h
mov r1,#08h
mov 31h,#00h
clr c
back: mov a,30h
rlc a
mov 30h,a
mov a,31h
rrc a
mov 31h,a
djnz r1,back
cjne a,00h,npal
mov a,#0ffh
sjmp next
npal: mov a,#00h
next : 
end