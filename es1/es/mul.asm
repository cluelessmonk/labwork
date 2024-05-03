ORG 0x0000

START:
    MOV A, #10     ; Load the first operand into accumulator A
    MOV B, #5      ; Load the second operand into accumulator B

    MUL AB         ; Multiply A by B (A = A * B)
    ; A contains the high byte of the result, B contains the low byte

    END
