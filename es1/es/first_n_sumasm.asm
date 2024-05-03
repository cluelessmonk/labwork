ORG 0x0000

START:
    MOV R0, #1      ; Initialize loop counter to 1
    MOV R1, #10     ; Set n to 10 (you can replace this with any desired value)

    MOV A, #0       ; Clear accumulator A (to store the sum)

SUM_LOOP:
    ADD A, R0       ; Add the current loop counter value to the sum
    INC R0          ; Increment the loop counter
    DJNZ R1, SUM_LOOP  ; Decrement n and jump to SUM_LOOP if not zero

    ; At this point, accumulator A contains the sum of the first n numbers
    ; You can output the result using appropriate instructions, e.g., by sending it to a serial port

    END

