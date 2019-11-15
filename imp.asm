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
        UserInput1 db 10 DUP(0)        
        Message1 db "Ingrese el numero: ", 0        
		Message2 db "Factorial: ", 0        
		result dword 0



calcularFactorial MACRO num
	mov ecx, num
	
	mov eax, ecx
	mov ebx, ecx
	dec ebx
	
	lp:
	mul ebx  ; eax*ecx
	
	dec ebx 
	cmp ebx, 1
	ja lp
	
	e:
	invoke dwtoa, eax, addr result  ;; Convert our product to a string
	invoke StdOut, addr result ;; Print the string
	ENDM


.code

start:
        ; Take the user inputs first

        invoke StdOut, addr Message1
        invoke StdIn, addr UserInput1, 10             

        invoke StripLF, addr UserInput1        

        ; convertir string a numero

        invoke atodw, addr UserInput1
        mov Number1, eax

		invoke StdOut, addr Message2
		calcularFactorial Number1
					        
        invoke ExitProcess, 0
        
end start
