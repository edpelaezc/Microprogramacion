.MODEL SMALL
.STACK 
.DATA
    cadena1 db  "Ingrese el numero A: $";ingrese n1
    cadena2 db  "Ingrese el numero B: $";ingrese n2
    num1 DB ? 
    num2 DB ?     
    aux DB ?     
    diez db 10 
    unidad db ?
    decena db ?
    iteracion db ? 
    i db 1 
    cociente db 0    
    residuo db ? 
    divisor db ? 
    dividendo db ? 
    cadenaM DB 'RESULTADO MULTIPLICACION: $'; 
    cadenaC DB 'COCIENTE: $'; 
    cadenaD DB 'RESIDUO: $';
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
    mov dividendo, al

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
    mov divisor, al
    
    ; imprimir un salto de linea antes de mostrar un resultado
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H
    XOR AX, AX 
    
    ; MULTIPLICACION CON SUMAS SUCESIVAS
    ;MOV CL, NUM2
    MOV BL, NUM1
    MOV AUX, BL
    MOV BL, NUM2
    MOV iteracion, BL
MULTIPLICACION: 
    ADD AL, AUX 
    MOV BL, iteracion
    SUB BL, i   
    MOV iteracion, bl 
    CMP iteracion, 0          
    JZ MOSTRAR
    JMP MULTIPLICACION     
    
MOSTRAR:    
    MOV NUM1, AL 
    ; imprimir un salto de linea antes de mostrar un resultado
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H
    XOR AX, AX 

    mov ah, 09
    lea dx, cadenaM
    int 21h
    XOR AX, AX 
     
    MOV AL, NUM1
    ;IMPRIMIR MULTIPLICACION 
    DIV diez
    MOV unidad, AL
    MOV decena, AH
    
    MOV DL, unidad
    ADD DL, 30H
    MOV AH, 02
    INT 21H
    
    MOV DL, decena
    ADD DL, 30H
    MOV AH, 02
    INT 21H
    
    XOR AX, AX
    
    ; imprimir un salto de linea antes de mostrar un resultado
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H
    XOR AX, AX 

    ;DIVISION CON RESTAS SUCESIVAS
    mov al, dividendo 
    mov bl, divisor
DIVISION: 
    cmp al, bl
    jb MOSTRARD
    sub al, bl    
    inc cl        
    jmp DIVISION

MOSTRARD: 
    mov residuo, al       
    mov cociente, cl
    inc cociente  
    xor ax, ax 
    xor cx, cx   
    ; imprimir un salto de linea antes de mostrar un resultado
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H
    XOR AX, AX 

    MOV DX, OFFSET cadenaD
    MOV AH, 09h 
    INT 21h 

    XOR AX, AX
    
    mov dl, residuo
    add dl, 30h 
    mov ah, 02 
    int 21h 
    
    ; imprimir un salto de linea antes de mostrar un resultado
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H
    XOR AX, AX 
    
    MOV DX, OFFSET cadenaC
    MOV AH, 09h 
    INT 21h 

    XOR AX, AX
    
    mov dl, cociente
    add dl, 30h 
    mov ah, 02 
    int 21h    


FIN: 
    MOV AH, 4CH 
    INT 21H 
    
    
END PROGRAMA    
