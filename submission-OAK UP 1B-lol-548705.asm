extern printf
extern fflush
extern scanf
 
section .data 
    toin db "%d",0
    toprint db "%d",10,0
           
section .bss 
    num1 resd 1
         
section .text 
    global main
     
main :
    push num1
    push toin
    call scanf
    add esp, 8
 
	mov ecx,0
    mov eax,0

 .loop
    cmp ecx, [num1]           
    ja  .print 
    add eax,ecx              
    add ecx,3                 
    jmp .loop
    
.print 
    push eax
    push toprint
    call printf
    add esp,8
     
    push 0
    call fflush
 
exit:
    mov eax,1
    mov ebx,0
    int 0x80
