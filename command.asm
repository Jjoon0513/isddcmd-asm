section .data
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


	; ------------ 명령 리스트 ------------
	cmd_list dd cmd0, cmd1

	; ------------ 설명 텍스트 길이 ------------
	cmd0_desc_len equ $ - cmd0_desc
	cmd1_desc_len equ $ - cmd1_desc

