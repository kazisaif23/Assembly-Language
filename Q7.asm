.MODEL SMALL
.STACK 100H
.DATA
ARR DB 1,2,3
TEXT DB 10,13,"THE AVERAGE IS: $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    mov ah,09
    lea dx,text
    int 21h
    
    LEA SI ,ARR
    MOV CX,3
    MOV AX,0 
   
    LOOP1:
    ADD AL,[SI]
    INC SI
    DEC CX
    JNZ LOOP1
    
    MOV BL,3
    DIV BL
    MOV DL,AL
    ADD DL,30H
    MOV AH,02
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN


