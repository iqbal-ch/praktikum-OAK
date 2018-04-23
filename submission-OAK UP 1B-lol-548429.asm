extern printf
extern fflush
extern scanf
 
section .data 
    toin db "%d",0
    print1  db "dingin", 10, 0
    print2  db "hangat", 10, 0
    print3  db "panas", 10, 0
    
           
section .bss 
    num1 resd 1
         
section .text 
    global main
     
main :
    push num1
    push toin
    call scanf
    add esp, 8
    
    mov eax, [num1]
    cmp eax, 35             
    jb .dingin              
    cmp eax, 60          
    jbe .hangat                  
    jmp .panas              

  .dingin
       push print1
       jmp .print
  .hangat
       push print2
       jmp .print
  .panas
       push print3
       jmp .print
     

  .print 
    call printf
    add esp,8
     
    push 0
    call fflush
 
exit:
    mov eax,1
    mov ebx,0
    int 0x80
