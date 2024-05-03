ORG 0x0000

START:
    MOV A, #50     ; Load the dividend into accumulator A
    MOV B, #10     ; Load the divisor into accumulator B

    DIV AB         ; Divide A by B (A = A / B, B = A % B)
    ; A contains the quotient, B contains the remainder

    END

