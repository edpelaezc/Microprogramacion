.model small
.stack 
.data 
	msg db 10,13,7, 'Ingrese cadena: ','$'
	normal db 10,13," Normal : " 
	PALABRA db 100 dup(' '), '$' 
	
	minuscula db 10,13,"en mayuscula: $" 
.code 
	mov ax,@data 
	mov ds,ax 

	mov ah, 09h
	lea dx, msg
	int 21h
	
	MOV AH, 3fH
	MOV BX, 00
	MOV CX, 100
	MOV DX, offset[PALABRA]
	int 21h

	mov ah, 09h
	mov dx, offset[PALABRA]
	int 21h

	lea dx,normal 
	mov ah,9 
	int 21h 

	
	lea dx,minuscula 
	mov ah,9 
	int 21h 

	call ConvMinusculas 

	mov ah,4ch 
	int 21h 


ConvMinusculas proc 
	mov si,0 
otroMinus: 
	mov al,PALABRA[si] 
	cmp al,'$' 
	jz finMinus 
	cmp al,'z' 
	jg sigueMinus 
	cmp al,'a' 
	jl sigueMinus 
	sub al,20H 
sigueMinus:
	mov dl,al 
	mov ah,2 
	int 21h 
	inc si 
	jmp otroMinus 
finMinus: ret 
ConvMinusculas endp 
end