.MODEL SMALL
.STACK 100H
.DATA 
    TEXT DB "ENTER THE NUMBER: $"
    TEXT1 DB 10,13,"THE NUMBER IS ODD.$"
    TEXT2 DB 10,13,"THE NUMBER IS EVEN.$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS, AX

    ; Input 
    MOV AH,09
    LEA DX,TEXT
    INT 21H
    MOV AH,01
    INT 21H
    SUB AL, '0' ; Convert ASCII to numerical value
    MOV BL, AL

    ; Check odd or even
    MOV AX, BX
    MOV DX,0 ; Clear DX
    MOV CX,2 ; Divisor
    DIV CX ; Divide AX by 2

    CMP DX,0 ; Compare remainder with 0
    JE EVEN ; If zero, jump to EVEN

    ; ODD CASE
    LEA DX, TEXT1
    JMP PRINT

    EVEN:
    ; EVEN CASE
    LEA DX, TEXT2

    PRINT:
    ; Print result
    MOV AH,09
    INT 21H

    ; Return program
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN