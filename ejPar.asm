.MODEL SMALL
.STACK 
.DATA
    NUM DB ? 
    RESIDUO DB ? 
    ESPAR DB 'EL NUMERO ES PAR$'
    NOESPAR DB 'EL NUMERO NO ES PAR$'
.CODE 
PROGRAMA: 
    MOV AX, @DATA 
    MOV DS, AX 
    
    ;LEER NUMERO 
    XOR AX, AX 
    MOV AH, 01H
    INT 21H 
    MOV NUM, AL 
    SUB NUM, 30H
    
    ;COMPARAR SI ES PAR 
    XOR AX, AX 
    MOV AL, NUM 
    MOV BL, 2 
    DIV BL 
    
    ;RESIDUO EN AH
    MOV RESIDUO, AH 
    
    ;COMPARAR
    CMP RESIDUO, 0 
    JZ IMPRIMIRESPAR  

    ; imprimir un salto de linea antes de mostrar un resultado
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H
    XOR AX, AX    
    
    MOV DX, OFFSET NOESPAR
    MOV AH, 09H
    INT 21H 
    JMP FINALIZAR 
    

IMPRIMIRESPAR: 
    ; imprimir un salto de linea antes de mostrar un resultado
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H
    XOR AX, AX 
    
    MOV DX, OFFSET ESPAR
    MOV AH, 09H 
    INT 21H 

FINALIZAR: 
    MOV AH, 4CH 
    INT 21H 
    
    
END PROGRAMA