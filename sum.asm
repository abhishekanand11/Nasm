section .data
    msg1 db "enter first no:"
    m1l equ $ - msg1
    msg2 db "enter second no:"
    m2l equ $ - msg2
    m3 db "sum is:"
    m3l equ $ - m3





global _start

_start:

  mov  eax,4		;sys_wite
  mov  ebx,1		;To stdout
  mov  ecx,msg1		;'Input some data: '
  mov  edx,m1l	
  int  80h		;Call kernel

  mov  eax,3		;sys_read. Read what user inputs
  mov  ebx,0		;From stdin
  mov  ecx,inp		;Save user input to buffer.
  mov edx, 1  
  int    80h

   mov  eax,3		;sys_read. Read what user inputs
  mov  ebx,0		;From stdin
  mov  ecx,inp1		;Save user input to buffer.
  mov edx,1
  int    80h


  mov  eax,4		;sys_wite
  mov  ebx,1		;To stdout
  mov  ecx,msg2		;'Input some data: '
  mov  edx,m2l	
  int  80h		;Call kernel

  mov  eax,3		;sys_read. Read what user inputs
  mov  ebx,0		;From stdin
  mov  ecx,inp2		;Save user input to buffer.
  mov edx,1
  int    80h


 mov  eax,3		;sys_read. Read what user inputs
  mov  ebx,0		;From stdin
  mov  ecx,inp1		;Save user input to buffer.
  mov edx,1
  int    80h

sub byte[inp],48
sub byte[inp2],48
mov ah ,byte[inp]
mov al,byte[inp2]

  add ah,al

mov byte[sum], ah
add byte[sum],48

  mov  eax,4		;sys_wite
  mov  ebx,1		;To stdout
  mov ecx,sum
  mov edx,1	;'Input some data: '
  int  80h		;Call kernel

  
   

  mov  eax,1
  mov  ebx,0 
  int  80h


section .bss

sum resb 1
inp resb 1
inp1 resb 1
inp2 resb 1
