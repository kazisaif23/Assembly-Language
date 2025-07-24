.MODEL SMALL
.STACK 100H
.DATA
    TEXT DB "UPPER LETTERS ARE: $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Print heading text
    MOV AH, 09H
    LEA DX, TEXT
    INT 21H

    ; Print uppercase letters
    MOV CL, 26       ; Counter for 26 uppercase letters
    MOV DL, 65       ; ASCII value of 'A'

PRINT_UPPER:
    MOV AH, 02H      ; Function to display character
    INT 21H

    INC DL           ; Move to next character
    DEC CL           ; Decrease counter
    JNZ PRINT_UPPER  ; Repeat until all letters printed

    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
