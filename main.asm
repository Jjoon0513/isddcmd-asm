

; -------------------------

section .bss
	input_buffer resb 100		; read버퍼


section .data
	; ------------ 처음 메시지 ---------
	welcomemsg db "ISDDCMD [V0.0.1]", 0xA, "(c) ISDDcompany. All rights reserved.", 0xA
	welcomemsg_len equ $ - welcomemsg



; +-------------- TODO ---------------+
; 1. 명령 라벨 정의
; 2. 명령어 이동,
; 그외에는 나중에 생각하죠 :)
		

section .text
	global _start



init: ; 이 라벨은 처음 들어갔을때 메시지를 출력함
	mov rax, 1
	mov rdi, 1
	mov rsi, welcomemsg
	mov rdx, welcomemsg_len
	syscall

	jmp main_loop


exit:
	mov rax, 60
	xor rdi, rdi
	syscall
	


_start:
	call init


	



; ------------- 메인 루프 -----------
main_loop:

	mov rax, 0
	mov rdi, 0
	mov rsi, input_buffer
	mov rdx, 100
	syscall

	mov r8, rax

	

	jmp main_loop



