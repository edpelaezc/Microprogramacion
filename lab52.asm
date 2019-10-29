.model small            ; Modelo para ejecutables
.data

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




mov cl,1
leer:
Mov DL,120d       ; El resultado se asigna al registro DL para imprimirlo en pantalla
Mov AH,02h       ; Se asigna el valor para impresi?n de caracteres en pantalla a la parte alta del acumulador
Int 21h  
mov ah,01h ; instrucción para digitar un caracter
int 16h
cmp al,0dh ;0dh es el código hexadecimal del Enter, compara si el la tecla presionada fue un Enter.
jne aumentar_cx
je salir
regreso:
loop leer ;Si no fue Enter salta a la etiqueta leer de nuestro programa
jmp salir
aumentar_cx:
add cl,1
jmp regreso

salir:
Mov AH,4CH      ; Se asigna el c?digo para finalizaci?n de programa
int 21h         ; Si invoca a la interrupci?n del DOS 21h para finalizar
End programa
