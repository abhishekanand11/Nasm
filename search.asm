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
je printing
dec byte[dum]
movzx ecx, byte[dum]
cmp ecx, 0
jne loop2





mov eax,4
mov ebx,1
mov ecx,not
mov edx,size4
int 80h


jmp exit

printing:
add byte[dum],30h
mov eax,4
mov ebx,1
mov ecx,dum
mov edx,1
int 80h


exit:

mov eax,1
mov ebx,0
int 80h


section .data
msg1: db "Enter how many no : "
size1: equ $-msg1


msg2: db "Enter integer : "
size2: equ $-msg2

msg3: db "enter num to be found: "
size3: equ $-msg3

not: db "given number not found" ,10
size4: equ $-not 

section .bss
data1: resb 1
data2: resb 1

sum: resb 1


temp: resb 1

temp3: resb 1
dum: resb 1
num: resb 1




