.model small            ; Modelo para ejecutables
.data
num1 DB 1
num2 DB 1
numero DB 1
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

mov ah,01h ; instrucción para digitar un caracter
int 21h
sub al,30h

mov num1,al

mov ah,01h ; instrucción para digitar un caracter
int 21h
sub al,30h

mov num2,al

Mov DL,13d       ; El resultado se asigna al registro DL para imprimirlo en pantalla
Mov AH,02h       ; Se asigna el valor para impresi?n de caracteres en pantalla a la parte alta del acumulador
Int 21h 

xor ax,ax

Mov AX,0000h    ; Se inicializa el acumulador

mov al,num1


mov bl,10d
mul bl

add al,num2

mov numero,al
mov cl,al

leer:

mov al,numero
div cl
cmp ah,0

je imprimirdigito
jne prueba
regreso:

loop leer ;Si no fue Enter salta a la etiqueta leer de nuestro programa

jmp salir

prueba:

xor ax,ax
xor bx,bx
jmp regreso

imprimirdigito:

xor bx,bx
mov bl,cl
add bl,30h

Mov DL,bl       ; El resultado se asigna al registro DL para imprimirlo en pantalla
Mov AH,02h       ; Se asigna el valor para impresi?n de caracteres en pantalla a la parte alta del acumulador
Int 21h 

Mov DL,44d       ; El resultado se asigna al registro DL para imprimirlo en pantalla
Mov AH,02h       ; Se asigna el valor para impresi?n de caracteres en pantalla a la parte alta del acumulador
Int 21h 
xor ax,ax
xor bx,bx

jmp regreso


salir:
Mov AH,4CH      ; Se asigna el c?digo para finalizaci?n de programa
int 21h         ; Si invoca a la interrupci?n del DOS 21h para finalizar
End programa
