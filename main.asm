section .bss
	input_buffer resb 100		; read버퍼


section .data
	; ------------ 처음 메시지 ---------
	welcomemsg db "ISDDCMD [V0.0.1]", 0xA, "(c) ISDDcompany. All rights reserved.", 0xA
	welcomemsg_len equ $ - welcomemsg

	; ------------  명령 집합  ---------
	; 명령
	commands:
		cmd0 db "exit", 0 ; 프로그램을 종료합니다.
		cmd1 db "echo", 0 ; echo

		
	; 설명
	descriptions:
		cmd0_desc db 0x1B ,"[32m", "exit", 0x1B, "[0m" , 0xA
			  db "프로그램을 종료합니다", 0xA
			  db 0x1B, "[32m", "힌트: 만약 명령창에서 실행되고 있었을 경우, 다시 명령창으로 돌아갑니다.", 0x1B, "[0m", 0xA 

		cmd1_desc db 0x1B , "[32m", "echo", 0x1B, "[34m", "[on|off]", 0x1B, "[0m", 0xA
			  db "명령 진입란을 켜고 끕니다.", 0xA
			  db "[34m", "[on|off]", 0x1B, "[0m", "은 명령 진입 란을 켜고 끄는것을 결정합니다.", 0xA
			  db "[34m", "[on|off]", 0x1B, "[0m", "안에", "[34m", "[on|off]", 0x1B, "[0m", "외의 다른 문자를 넣을경우 출력합니다."
			
			  db 0x1B, "[32m", "힌트: 이는 명령 스크립트를 만드는데 유용합니다.", 0x1B, "[0m", 0xA

; +-------------- TODO ---------------+
; 1. 명령집합 문자열 길이 저장
; 2. 명령 라벨 정의
; 3. 명령어 이동,
; 그외에는 나중에 생각하죠 :)
		

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

	mov rax, 0
	mov rdi, 0
	mov rsi, input_buffer
	mov rdx, 100
	syscall

	mov r8, rax

	jmp main_loop


cmds:
	.cmd0:
		mov rax, 1
		mov rdi, 1
		mov rsi, 	
