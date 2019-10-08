.MODEL SMALL
.STACK 
.DATA
    cadena1 db  "Ingrese el numero A: $";ingrese n1
    cadena2 db  "Ingrese el numero B: $";ingrese n2
    num1 DB ? 
    num2 DB ?     
    IGUAL DB 'LOS NUMEROS SON IGUALES$'
    MAYOR DB 'A es mayor que B. $'
    MENOR DB 'B es mayor que A. $'
.CODE 
PROGRAMA: 
    MOV AX, @DATA 
    MOV DS, AX 
    
    XOR AX, AX

    ;solicitar del teclado numero 1
    
    mov ah, 09
    lea dx, cadena1
    int 21h
    mov ah, 01
    int 21h
    sub al, 30h
    mov num1, al

    ; imprimir un salto de linea antes de mostrar un resultado
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H
    XOR AX, AX    
    
    ;solicitar del teclado numero 2
    
    mov ah, 09
    lea dx, cadena2
    int 21h
    mov ah, 01
    int 21h
    sub al, 30h
    mov num2, al
    
            ; imprimir un salto de linea antes de mostrar un resultado
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H
    XOR AX, AX  
    
    MOV BL, NUM1
    MOV AL, NUM2
    CMP BL, AL
    JE SONIGUALES
    JG ESMAYOR
    JL ESMENOR

ESMENOR: 
    mov ah, 09 
    lea dx, MENOR
    int 21h 
    JMP FIN
        
ESMAYOR:  
    mov ah, 09 
    lea dx, MAYOR 
    int 21h 
    JMP FIN 
    
SONIGUALES:   
    mov ah, 09
    lea dx, IGUAL
    int 21h      
    JMP FIN 

    

FIN: 
    MOV AH, 4CH 
    INT 21H 
    
    
END PROGRAMA