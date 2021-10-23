;;HW Chapter 5 Page 15 Your turn 
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

INCLUDE Irvine32.inc

.data
	
	len DWORD ?

.code
main PROC

COMMENT @
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Setting the regs to 0.
	XOR eax, eax
	XOR edx, edx
	XOR ecx, ecx																	  ;;		;;					
																					  ;;	8	;;
	; Giving number to regs															  ;;	9	;;
	MOV eax, 9																	      ;;;;;;;;;;;;
	MOV edx, 8
	MOV ecx, 2


	; PUSH ===> here we assume that we PUSHAD.
	PUSH eax
	PUSH edx

	ADD edx, 10
	ADD eax, 13
	
L2:
	POP eax
	CALL WriteInt
	LOOP L2

;	POP eax
;	CALL WriteInt
;	POP eax
;	CALL WriteInt
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@
	; Setting the Registers to 0. and the order of reg in stack is as below:
	;							; EAX . ECX . EDX . EBX . ESP . EBP . ESI . EDI
	XOR eax, eax
	XOR ecx, ecx
	XOR edx, edx
	XOR ebx, ebx
	;XOR esp, esp
	XOR ebp, ebp
	XOR esi, esi
	XOR edi, edi
	
	MOV eax, 9					; eax = 0000 0009
	MOV ecx, 8					; ecx = 0000 0008
	MOV edx, 7					; edx = 0000 0007
	MOV ebx, 6					; ebx = 0000 0006
	;MOV esp, 5					; esi = 0000 0005
	MOV ebp, 4					; edi = 0000 0004
	MOV esi, 3					; esi = 0000 0003
	MOV edi, 2					; edi = 0000 0002

	PUSHAD

	INC ecx
		
	top:
		DEC ecx

L1:
	POP eax						; eax = the last input of the stack memory
	cmp ecx, 5
	JE top
	CALL WriteInt
	LOOP L1

INVOKE ExitProcess, 0
main ENDP

END main
