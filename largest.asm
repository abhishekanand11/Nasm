section .bss
  d0: resb 1
  d1: resb 1
  array:  resb 50
  temp: resb 1
  temp2: resb 1
  temp3: resb 1
  i: resb 1
  j: resb 1
    lar:resb 1
    lar2:resb 1

section .data
msg1:db "Enter a number",0Ah
msg2:db "The largest number: "
msg4: db "the second largest number is: "
len4: equ $-msg4
msg3: db 10
len3: equ $-msg3

num:db 5

section .text
global _start
_start:

 mov al, byte[num]

  mov byte[temp], al
  mov byte[temp2], al
  mov ebx, array
  
reading:
  push ebx

  mov eax, 4
  mov ebx, 1
  mov ecx, msg1
  mov edx, 15
  int 80h
  

  mov eax, 3
  mov ebx, 0
  mov ecx, d1
  mov edx, 1
  int 80h

  mov eax, 3
  mov ebx, 0
  mov ecx, d0
  mov edx, 1
  int 80h

  mov eax, 3
  mov ebx, 0
  mov ecx, temp3
  mov edx, 1
  int 80h


  sub byte[d1], 30h
  sub byte[d0], 30h  
  mov al, byte[d1]
  mov dl, 10
  mul dl
  add al, byte[d0]

    pop ebx

  mov byte[ebx], al
  add ebx,4
  dec byte[temp]
  cmp byte[temp], 0
  jg reading

mov ebx, array
mov al, byte[ebx]
mov byte[lar], al
mov byte[temp],5

checking:

mov al, byte[ebx]
cmp byte[lar], al
jl swap

next:
add ebx,4
dec byte[temp]
cmp byte[temp], 0
jg checking

mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,19
int 80h

mov al,byte[lar]
mov bl,10
div bl
mov byte[d1],al
mov byte[d0],ah

add byte[d1],30h
add byte[d0],30h

mov eax, 4
  mov ebx, 1
  mov ecx, d1
  mov edx, 1
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, d0
  mov edx, 1
  int 80h

mov eax,4
  mov ebx,1
  mov ecx,msg3
  mov edx,len3
  int 80h



mov al, byte[num]


mov ebx, array
mov al, byte[ebx]
mov byte[lar2],0
mov byte[temp],5

checking2:

mov al, byte[ebx]
cmp byte[lar2], al
jl swap2

next2:
add ebx,4
dec byte[temp]
cmp byte[temp], 0
jg checking2

 

mov eax,4
mov ebx,1
mov ecx,msg4
mov edx,len4
int 80h

mov al,byte[lar2]
mov bl,10
div bl
mov byte[d1],al
mov byte[d0],ah

add byte[d1],30h
add byte[d0],30h

mov eax, 4
  mov ebx, 1
  mov ecx, d1
  mov edx, 1
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, d0
  mov edx, 1
  int 80h

mov eax,4
  mov ebx,1
  mov ecx,msg3
  mov edx,len3
  int 80h



exit:
mov eax,1
mov ebx,0
int 80h

swap2:
cmp byte[lar],al
je next2
mov byte[lar2],al
jmp next2


swap:
mov byte[lar],al
jmp next



