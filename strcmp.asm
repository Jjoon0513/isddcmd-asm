global starcmp

strcmp:
        push rdi
        push rsi

strcmp_loop:
        mov al, [rdi]
        mov bl, [rsi]
        cmp al, bl
        jne strcmp_diff       ; 다르면 종료
        cmp al, 0             ; 널 문자면 종료
        je strcmp_equal
        inc rdi
        inc rsi
        jmp strcmp_loop

strcmp_diff:
        mov rax, 1            ; 다름 표시
        jmp strcmp_end

strcmp_equal:
        xor rax, rax          ; 같음 표시 (0)

strcmp_end:
        pop rsi
        pop rdi
        
        ret

