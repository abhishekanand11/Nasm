section .data
  msg1: db "Enter the string : "
  size1: equ $-msg1
  msg2: db "The no of words in the given string is: "
  size2: equ $-msg2
  msg3: db 10
  size3: equ $-msg3


section .bss
  string: resb 500
  temp: resb 1
  len:  resb 1
  count: resb 1
  i: resb 1
  

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

  
  cmp byte[temp], 10
  jne reading



endreading:
  dec byte[len]




	mov byte[i], 0
	mov byte[count],0

word_check:
	mov ebx, string
	movzx ecx, byte[i]
	add ebx, ecx
	dec byte[len]
	inc byte[i]
	mov al,byte[len]
	cmp al,0
	je printing
	mov cl, byte[ebx]
	cmp cl,46
	je counter
	cmp cl,44
	je comma
	cmp cl,32
	jne word_check

counter:
	
	inc byte[count]
	jmp word_check

comma:

	inc byte[count]
	mov ebx, string
	movzx ecx, byte[i]
	add ebx, ecx
	mov cl, byte[ebx]
	cmp cl,32
	jne word_check
	inc byte[i]


printing:

	inc byte[count]
 	mov eax, 4
 	mov ebx, 1
 	mov ecx, msg2
 	mov edx, size2
 	int 80h
  

	add byte[count],30h

	mov eax,4
	mov ebx,1
	mov ecx,count
	mov edx,1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
 	mov edx, size3
 	int 80h


exit:
  mov eax, 1
  mov ebx, 0
  int 80h
