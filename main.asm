section .bss
	input_buffer resb 100		; read버퍼


section .data
	; ------------ 처음 메시지 ---------
	welcomemsg db "ISDDCMD [V0.0.1]", 0xA, "(c) ISDDcompany. All rights reserved.", 0xA
	welcomemsg_len equ $ - welcomemsg

	; ------------  명령 집합  ---------
	commands:
		cmd0 db "exit", 0 ; 프로그램을 종료합니다.
		cmd1 db ""

section .text
	global _start



init: ; 이 라벨은 처음 들어갔을때 메시지를 출력함
	mov rax, 1
	mov rdi, 1
	mov rsi, welcomemsg
	mov rdx, welcomemsg_len
	syscall

	ret


_start: ; 진입점
	call init

	mov rax, 60
	xor rdi, rdi
	syscall



; ------------- 메인 루프 -----------
main_loop:


	jmp main_loop
