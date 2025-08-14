.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "Enter two decimal digit: $"
    MSG3 DB 10,13, "Sum = $"
    
.CODE
MAIN PROC
    MOV AX, @DATA 
    MOV DS, AX
    
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H
    ;input
    MOV AH, 01H     
    INT 21H 
    MOV BL, AL
    SUB BL,30h   
    INT 21H  
    MOV Bh, AL
    SUB BH, 30H
    ;addition        
    ADD BL, BH   ; BL = BL + BH
    ADD BL,30H
    
    ; --- Display result ---
    MOV AH, 09H
    LEA DX, MSG3
    INT 21H
    mov ah,02
    MOV DL,BL
    INT 21H
   
    MOV AH, 4CH    
    INT 21H
MAIN ENDP
END MAIN
