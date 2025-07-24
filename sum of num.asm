.MODEL SMALL
.STACK 100H
.DATA 
    TEXT DB "ENTER TWO NUMBERS: $"
    TEXT1 DB 10,13,"THE SUM IS : $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    MOV AH,09
    LEA DX,TEXT
    INT 21H  
    
    MOV AH,01 ;INPUT
    INT 21H 
    MOV BL,AL
    INT 21H 
    MOV BH,AL
    
    SUB BL,30H
    SUB BH,30H
    
    MOV AH,09
    LEA DX,TEXT1
    INT 21H
    
    ADD BL,BH
    ADD BL,30H  
    
    MOV AH,02
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN