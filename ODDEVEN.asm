.MODEL
.STACK 100H
.DATA
    VAL1 DB ?
    VAL2 DB 2
    MSG1 DB "THE NUMBER IS ODD","$"
    MSG2 DB "THE NUMBER IS EVEN","$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    ;INPUT 
    MOV AH,01
    INT 21H
    MOV VAL1,AL
    MOV AX,0
    MOV AL,VAL1
    SUB AL,30H
    
    ;DIVIDED BY 2
    DIV VAL2
    ;COMPARE 
    CMP AH,1
    JE ODD
    JNE EVEN
    
    ODD:
    MOV AH,09
    LEA DX,MSG1
    INT 21H
    JMP EXIT
    
    EVEN:
    MOV AH,09
    MOV DX,OFFSET MSG2
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN