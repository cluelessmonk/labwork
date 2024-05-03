ORG 0x0000

START:
    MOV A, #24     ; Load the number to be checked into accumulator A (you can replace this with any desired number)

    ANL A, #1      ; Perform bitwise AND operation with 1
    ; After the operation, accumulator A will contain 0 if the number is even, and 1 if the number is odd

    JZ EVEN        ; Jump to EVEN label if accumulator A is zero (number is even)
    ; If the number is odd, execution continues to ODD label

ODD:
    ; Code for odd number handling
    ; For example: Print "Odd number"
    ; ...

    SJMP END       ; Jump to END label to end the program

EVEN:
    ; Code for even number handling
    ; For example: Print "Even number"
    ; ...

END:
    END

