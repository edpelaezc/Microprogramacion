.model small            ; Modelo para ejecutables
.data

resultado DB 'resultado$' ; $siginifica el final de la cadena db se utiliza para declarar una variable que ocupa un registro entero  
cociente DB 'cociente$'
residuo DB 'residuo$'
a DB 1
b DB 1


.code                   ; Inicia el segmento de c?digo
.stack
programa:               ; Etiqueta para el inicio del programa
       

 Mov AX,@DATA    ; Se obtiene la direcci?n de inicio del segmento de datos
        Mov DS,AX   
        Mov AX,0000h    ; Se inicializa el acumulador
        Mov BX,0000h    ; Se inicializa el registro BX
        Mov CX,0000h    ; Se inicializa el registro BX
        
        MOV AX,0600H ; Peticion para limpiar pantalla
MOV BH,89H ; Color de letra ==9 "Azul Claro"
; Fondo ==8 "Gris"
MOV CX,0000H ; Se posiciona el cursor en Ren=0 Col=0
MOV DX,184FH ; Cursor al final de la pantalla Ren=24(18)
; Col=79(4F)
INT 10H ; INTERRUPCION AL BIOS
        
        Mov AX,0000h    ; Se inicializa el acumulador
        Mov BX,0000h    ; Se inicializa el registro BX
        Mov CX,0000h    ; Se inicializa el registro BX
        
        
        mov ah, 01h ; leer entrada del usuario
        int 21h ;resulado queda en al
        mov a,al
        
        
        mov ah, 01h ; leer entrada del usuario
        int 21h ;resulado queda en al
        mov b,al      
        
        sub a,30h 
        sub b,30h 
        xor cx,cx
        
        mov cl,b      
        multiplicar:
        add bl,a 
        loop multiplicar
        imprimir:
        mov ah,02
        mov dl,bl
        add dl,30h
        int 21h        
         salir:
        Mov AH,4CH      ; Se asigna el c?digo para finalizaci?n de programa
        int 21h         ; Si invoca a la interrupci?n del DOS 21h para finalizar
        
        
        
End programa
        