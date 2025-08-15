.MODEL SMALL
.STACK 100H
.DATA 
    ARR DB 3,1,4,2,5,7
    TEXT DB 10,13,"THE LEARGEST ELEMENT IS :$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CX,5    ; counter
    LEA SI,ARR
    MOV BL,[SI]
    
    LOOP1:
    INC SI         ;index increment
    CMP BL,[SI]
    JGE NEXT
    MOV BL,[SI]
    
    NEXT:
    DEC CX       l;counter decrement
    JNZ LOOP1
    
    MOV AH,09
    LEA DX,TEXT
    INT 21H
    MOV AH,02
    MOV DL,BL
    ADD DL,30H
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
