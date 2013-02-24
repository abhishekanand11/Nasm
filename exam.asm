section .text
global _start

 

_start:


mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, size1
int 80h


mov eax, 3
mov ebx, 0 ;Std input
mov ecx, data1
mov edx, 1
int 80h


mov eax, 3
mov ebx, 0 ;Std input
mov ecx, data2
mov edx, 1
int 80h



mov eax, 3
mov ebx, 0 ;Std input
mov ecx, temp
mov edx, 1
int 80h

 

sub byte[data1], 30h
sub byte[data2], 30h

 

mov al, byte[data1]
mov bh, 10
mul bh


add al, byte[data2]
mov byte[sum], al
mov byte[temp3], 0
mov bl, 0
movzx ecx, byte[sum]
mov byte[dum],cl


loop1: 

mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, size2
int 80h


mov eax, 3
mov ebx, 0 ;Std input
mov ecx, data1
mov edx, 1
int 80h


mov eax, 3
mov ebx, 0 ;Std input
mov ecx, data2
mov edx, 1
int 80h



mov eax, 3
mov ebx, 0 ;Std input
mov ecx, temp
mov edx, 1
int 80h

 

sub byte[data1], 30h
sub byte[data2], 30h

 

mov al, byte[data1]
mov bh, 10
mul bh


add al, byte[data2]
mov ah,0
push ax

dec byte[sum]
movzx ecx, byte[sum]
cmp ecx, 0
jne loop1

mov eax, 4
mov ebx, 1
mov ecx, msg3
mov edx, size3
int 80h


mov eax, 3
mov ebx, 0 ;Std input
mov ecx, data1
mov edx, 1
int 80h


mov eax, 3
mov ebx, 0 ;Std input
mov ecx, data2
mov edx, 1
int 80h



mov eax, 3
mov ebx, 0 ;Std input
mov ecx, temp
mov edx, 1
int 80h

 

sub byte[data1], 30h
sub byte[data2], 30h

 

mov al, byte[data1]
mov bh, 10
mul bh


add al, byte[data2]
mov byte[num], al




movzx ecx, byte[dum]

loop2:
pop ax
cmp al,byte[num]
je equall
cmp al,byte[num]
jl less
cmp al,byte[num]
jg bigger

printing:
mov eax,4
mov ebx,1
mov ecx,msg4
mov edx,size4
int 80h

add byte[equal],30h
mov eax,4
mov ebx,1
mov ecx,equal
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,msg7
mov edx,len7
int 80h


mov eax,4
mov ebx,1
mov ecx,msg6
mov edx,size6
int 80h

add byte[big],30h
mov eax,4
mov ebx,1
mov ecx,big
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,msg7
mov edx,len7
int 80h

mov eax,4
mov ebx,1
mov ecx,msg5
mov edx,size5
int 80h

add byte[small],30h
mov eax,4
mov ebx,1
mov ecx,small
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,msg7
mov edx,len7
int 80h

exit:

mov eax,1
mov ebx,0
int 80h


equall:
mov eax ,[equal]
inc eax
mov[equal],eax
dec byte[dum]
movzx ecx, byte[dum]
cmp ecx, 0
jne loop2
jmp printing

less:
movzx eax,byte[small]
inc eax
mov[small],eax
dec byte[dum]
movzx ecx, byte[dum]
cmp ecx, 0
jne loop2
jmp printing

bigger:
movzx eax,byte[big]
inc eax
mov[big],eax
dec byte[dum]
movzx ecx, byte[dum]
cmp ecx, 0
jne loop2
jmp printing


section .data
msg1: db "Enter size of array : "
size1: equ $-msg1


msg2: db "Enter integer : "
size2: equ $-msg2

msg3: db "enter a num between 0-99: "
size3: equ $-msg3

msg4: db "the number equal to given no is: "
size4: equ $-msg4

msg5: db "the number smaller than the given no is : "
size5: equ $-msg5

msg6: db "the number greater than the given no is : "
size6: equ $-msg6

msg7: db 10
len7: equ $-msg7

section .bss
data1: resb 1
data2: resb 1

sum: resb 1


temp: resb 1

temp3: resb 1
dum: resb 1
num: resb 1
equal: resb 1
small: resb 1
big: resb 1

