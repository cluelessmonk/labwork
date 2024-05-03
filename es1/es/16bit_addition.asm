ORG 0x0000

START:
    MOV R0, #0x20     ; Initialize pointer for first number (LSB) to 0
    MOV R1, #0x30    ; Initialize pointer for second number (LSB) to 1

    ; Load the first 16-bit number (stored in memory)
    MOV A, @R0        ; Load LSB of first number into accumulator A
    MOV B, @R1        ; Load LSB of second number into register B

    ADD A, B          ; Add LSBs
    MOV 40h, A         ; Store result (LSB of sum) in register R2

    INC R0            ; Move pointer to MSB of first number
    INC R1            ; Move pointer to MSB of second number

    MOV A, @R0        ; Load MSB of first number into accumulator A
    MOV B, @R1        ; Load MSB of second number into register B

    ADDC A, B         ; Add MSBs with carry
    MOV 41h, A         ; Store result (MSB of sum) in register R3

    ; Display the result of addition (16-bit sum)
    ; Your code to display the result goes here...
	
    END
