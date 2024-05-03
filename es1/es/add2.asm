ORG 0x0000

START:
    MOV A, #0x0A    ; Load the first number into accumulator A (example: 10)
    MOV B, #0x05    ; Load the second number into accumulator B (example: 5)
    
    ADD A, B        ; Add the two numbers using direct addressing mode
    MOV R2, A       ; Move the result from accumulator A to register R2

    END



