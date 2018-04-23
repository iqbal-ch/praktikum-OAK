extern printf
extern fflush
extern scanf
 
section .data 
    toin db "%d %d",0
    toprint db "%d",10,0

           
section .bss 
    num1 resd 1
    num2 resd 1
         
section .text 
    global main
     
main :
    push num2 
    push num1
    push toin
    call scanf
    add esp, 12
 
    mov eax,[num1]
    mov ebx,[num2]
    mul ebx
     
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
