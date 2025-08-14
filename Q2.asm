.MODEL SMALL
.STACK 100h
.DATA
    msg db 10,13,"You entered: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX        
    
    MOV AH, 01h       
    INT 21h
    MOV BL, AL       

    ; Check if character is 'y' or 'Y'
    CMP BL, 'y'
    JE DISPLAY
    CMP BL, 'Y'
    JE DISPLAY

    ; If not 'y' or 'Y', terminate
    JMP EXIT
    
    DISPLAY:
    MOV AH, 09h      
    LEA DX, msg
    INT 21h

    MOV AH, 02h    
    MOV DL, BL
    INT 21h

    
    EXIT:
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN
