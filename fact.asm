global _start
_start:
section .text
mov byte[t2],0
%macro read 2
mov eax,4
mov ebx,1
mov ecx,%1
mov edx,%2
int 80h
%%reads:
mov eax,3
mov ebx,0
mov ecx,t1
mov edx,1
int 80h
mov ebx,[t1]
mov eax,[t2]
cmp ebx,30h
jb %%endread
cmp ebx,39h
ja %%endread
mov ebx,[t1]
mov eax,[t2]
sub ebx,30h
mov edx,0
mov ecx,10
mul ecx
add eax,ebx
mov [t2],eax
jmp %%reads
%%endread:
%endmacro

%macro result 2
mov eax,4
mov ebx,1
mov ecx,%1
mov edx,%2
int 80h
%endmacro
jmp strt
printf:

mov ecx,[p]
mov byte[q],0
mov ecx,0
mov eax,[temp]
mov [prnt], eax
l2:
mov edx,[p]
cmp edx,0
jz endl2
mov edx,0

jz endl2
mov ecx,10
div ecx


mov [prnt], eax
add edx,30h
push edx

add byte[q],1
sub byte[p],1
cmp eax,0
jz endl2
jmp l2
endl2:
l3:
mov edx,[q]
cmp edx,0
je endl3
pop ecx
mov [t1],ecx
mov ecx,t1
mov eax,4
mov ebx,1
mov edx,1
int 80h
sub byte[q],1
jmp l3
endl3:
ret


strt:
printfact:
read msg, len
mov byte[p],10
call fact
result msg4,len4
call printf
combinatn:
mov byte[p],10
read msg, len
call fact
result msg4,len4
call printf
jmp exit
fact:
mov ecx,[r]
mov eax,1
l1:
cmp ecx,0
jz done
mul ecx
loop l1
done:
mov [temp],eax
ret
exit:
mov eax,1
mov ebx,0
int 80h





section .bss
t1: resb 4
t2: resb 4
prnt: resb 4
n1: resb 4
n2: resb 4
n3: resb 4
n4: resb 4
num: resb 8
crap: resb 4
temp: resb 4
p: resb 4
q: resb 4
c: resb 4
i: resb 4
d: resb 4
e: resb 4
r: resb 4
data9: resb 50


section .data
msg: db 10,"enter number to calculate fact betwn 00 and 12.",10,13
len: equ $-msg
msg1: db 10,"NOT Found",10
len1: equ $-msg1
msg2: db 10
len2: equ $-msg2
msg3: db 10,"enter number to search.",10,13
len3: equ $-msg3
msg4: db "Factorial is:",10
len4: equ $-msg4
