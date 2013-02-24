section .data
  msg1: db "Enter the string : "
  size1: equ $-msg1
  msg2: db "The size of the string is : "
  size2: equ $-msg2
  msg3: db " is not pallindrome "
  size3: equ $-msg3
  msg4: db 10
  size4: equ $-msg4

section .bss
  string: resb 50
  temp: resb 1
  len:  resb 1
  d0: resb 1
  d1: resb 1


section .text
  global _start

_start:
  
  mov eax, 4
  mov ebx, 1
  mov ecx, msg1
  mov edx, size1
  int 80h

  mov ebx, string
  mov byte[len], 0

reading:
  push ebx

  mov eax, 3
  mov ebx, 0
  mov ecx, temp
  mov edx, 1
  int 80h
  
  pop ebx
  mov al, byte[temp]
  mov byte[ebx], al
  
  inc byte[len]
  inc ebx

  ;NASM change the ascii code of enter 13 to 10
  cmp byte[temp], 10
  jne reading


endreading:
  dec ebx
  mov byte[ebx],0
  dec byte[len]




;Printing the string....
  mov eax, 4
  mov ebx, 1
  mov ecx, string
  movzx edx, byte[len]
  int 80h

  

  mov eax, 4
  mov ebx, 1
  mov ecx, msg4
  mov edx, size4
  int 80h
 


  mov eax, 4
  mov ebx, 1
  mov ecx, msg2
  mov edx, size2
  int 80h
 
  
	mov al,byte[len]
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

  mov eax, 4
  mov ebx, 1
  mov ecx, msg4
  mov edx, size4
  int 80h



exit:
  mov eax, 1
  mov ebx, 0
  int 80h
