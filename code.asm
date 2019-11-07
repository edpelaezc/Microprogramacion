.386
.model flat, stdcall
option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data

        Number1 dword 0
        Number2 dword 0
        UserInput1 db 10 DUP(0)
        UserInput2 db 10 DUP(0)
        Message1 db "Ingrese el primer numero: ", 0
        Message2 db "Ingrese el segundo numero : ", 0
        SumString db 10 DUP(0)
        SubString db 10 DUP(0)
        Message3 db "El resultado de la suma es : ", 0
        Message4 db "El resultado de la resta es : ", 0
		Message5 db "A es mayor que B ", 0
		Message6 db "B es mayor que A ", 0
		Message7 db "LOS NUMEROS SON IGUALES ", 0
        NumSum dword 0
        NumSub dword 0



.code

start:
        ; Take the user inputs first

        invoke StdOut, addr Message1
        invoke StdIn, addr UserInput1, 10
        invoke StdOut, addr Message2
        invoke StdIn, addr UserInput2, 10                

        invoke StripLF, addr UserInput1
        invoke StripLF, addr UserInput2

        ; convertir string a numero

        invoke atodw, addr UserInput1
        mov Number1, eax

        invoke atodw, addr UserInput2
        mov Number2, eax

        ; suma
        mov eax, Number1
        add eax, Number2
        mov NumSum, eax

        ; resta
        mov ebx, Number1
        sub ebx, Number2
        mov NumSub, ebx

        ; convertir numero a string para mostrar en consola
        invoke dwtoa, NumSum, addr SumString
        invoke dwtoa, NumSub, addr SubString

        ; mostrar cadenas
        invoke StdOut, addr Message3
        invoke StdOut, addr SumString		
        invoke StdOut, addr Message4
        invoke StdOut, addr SubString      

		mov eax, Number1
		mov ebx, Number2
		.if eax > ebx
			invoke StdOut, addr Message5
		.elseif eax < ebx 
			invoke StdOut, addr Message6
		.else 
			invoke StdOut, addr Message7
		.endif
			
        
        invoke ExitProcess, 0
        
end start
