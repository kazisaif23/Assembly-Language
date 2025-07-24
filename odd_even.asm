.MODEL
.STACK 100H
.DATA
    VAL1 DB ?
    VAL2 DB 2
    MSG1 DB " THE NUMBER IS ODD","$"
    MSG2 DB " THE NUMBER IS EVEN","$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    MOV AH,01  ;INPUT
    INT 21H
    MOV VAL1,AL ;Stores the character received from the user into a memory variable named VAL1.
    MOV AX,0   ;Clears AX by setting it to 0.
    MOV AL,VAL1   ;Loads the previously stored character (VAL1) back into AL
    SUB AL,30H  ;Converts the character from ASCII to a numeric value.
    
    ;DIVIDED BY 2       
    DIV VAL2         ;val2 is divisor and al where val1 is stored is divident
    ;COMPARE 
    CMP AH,1    ;after the div if there is any reminder, then reminder sotred is ah then compare the ah with 1
    JE ODD
    JNE EVEN
    
    ODD:
    MOV AH,09
    mov DX ,OFFSET MSG1
   ; LEA DX,MSG1
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