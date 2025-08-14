.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "Enter first decimal digit: $"
    MSG2 DB 10,13, "Enter second decimal digit: $"
    MSG3 DB 10,13, "Sum = $"
    
.CODE
MAIN PROC
    MOV AX, @DATA 
    MOV DS, AX
    
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H
 
    MOV AH, 01H     
    INT 21H 
    MOV BL, AL
    SUB BL,30h      
          

    MOV AH, 09H
    LEA DX, MSG2
    INT 21H

    MOV AH, 01H
    INT 21H  
    MOV Bh, AL
    SUB BH, 30H
            
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
