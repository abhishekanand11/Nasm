
global _start
_start:
section .text

%macro read 2
mov eax,4
mov ebx,1
mov ecx,%1
mov edx,%2
int 80h

mov eax,3
mov ebx,0
mov ecx,t1
mov edx,1
int 80h


mov eax,3
mov ebx,0
mov ecx,t2
mov edx,1
int 80h

mov eax,3
mov ebx,0
mov ecx,crap
mov edx,1
int 80h


mov eax,[t1]
mov ebx,[t2]


sub eax,30h
sub ebx,30h
mov edx,0
mov ecx,10
mul ecx
add eax,ebx

%endmacro
%macro found 1
mov ecx,0
mov eax,%1
mov edx,0
mov cx,10
div cx

add dx,30h
mov [n1],dx
mov edx,0
div cx
add dx,30h
mov [n2],dx
mov edx,0
div cx
add dx,30h
mov [n3],dx
mov edx,0
div cx
add dx,30h
mov [n4],dx

mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,len2
int 80h


mov eax,4
mov ebx,1
mov ecx,n2
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,n1
mov edx,1
int 80h
%endmacro


read msg,len
mov [c],eax
mov [d],eax
mov eax,0
mov [i],eax
mov esi,data9


l1:
mov ecx,[c]
cmp ecx,0
je l1end
dec ecx
mov [c],ecx 
read msg4,len4
mov [temp],eax
mov ebx,esi
mov ecx,[i]
add ebx,ecx
mov edx,[temp]
mov [ebx],edx
mov eax,[i]
add eax,4
mov [i],eax
jmp l1
l1end:
mov eax,0
mov [i],eax

sort:

mov eax,[d]
mov [c],eax
mov [e],eax

l2:
mov ecx,[c]
cmp ecx,1
je l2end
dec ecx
mov [c],ecx   
mov eax,0
mov [i],eax
mov eax,[e]
mov [d],eax
l4:
mov ecx,[d]
cmp ecx,1
je l4end
dec ecx
mov [d],ecx

   
mov eax,esi
mov ebx,[i]
add eax,ebx
mov ecx,[eax+4]
cmp [eax],ecx
jg cont
mov ebx,[eax]
mov ecx,[eax+4]
mov [eax],ecx
mov [eax+4],ebx

cont:
mov eax,[i]
add eax,4
mov [i],eax
jmp l4
l4end:
jmp l2

l2end:

mov eax,0
mov [i],eax

l3:
mov ecx,[e]
cmp ecx,0
je exitend
dec ecx
mov [e],ecx   
mov ebx,esi
mov ecx,[i]
add ebx,ecx
found [ebx]
mov eax,[i]
add eax,4
mov [i],eax
jmp l3




exitend:
mov eax,1
mov ebx,0
int 80h

section .bss
t1: resb 4
t2: resb 4
p1: resb 4
p2: resb 4
n1: resb 4
n2: resb 4
n3: resb 4
n4: resb 4
num: resb 8
crap: resb 4
temp: resb 4
c: resb 4
i: resb 4
d: resb 4
e: resb 4
data9: resb 50


section .data
msg: db 10,"enter array size between 00 and 99:",10,13
len: equ $-msg
msg2: db 10
len2: equ $-msg2
msg4: db "enter next num:",10
len4: equ $-msg4
