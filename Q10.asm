.MODEL SMALL
.STACK 100H
.DATA
    BUFFER DB 30, ?, 30 DUP('$') 
    Text DB "ENTER A STRING: $"
    RESULT DB 10, 13, "REVERSED STRING: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, text
    INT 21H
    
    LEA DX, BUFFER
    MOV AH, 0AH
    INT 21H
    MOV CL, [BUFFER+1]
    MOV CH, 0                
    LEA SI, BUFFER+2           
    ADD SI, CX                 
    
    MOV AH, 09H
    LEA DX, RESULT
    INT 21H

PRINT_REVERSE:
    DEC SI                     
    MOV DL, [SI]              
    MOV AH, 02H
    INT 21H 
    loop PRINT_REVERSE         

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
