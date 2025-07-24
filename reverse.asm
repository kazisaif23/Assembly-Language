.MODEL SMALL
.STACK 100H
.DATA
    string_lentgh DB 20, ?, 20 DUP('$') 
    Text DB "ENTER A STRING: $"
    RESULT DB 10, 13, "REVERSED STRING: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, text
    INT 21H
    
    LEA DX, string_lentgh
    MOV AH, 0AH
    INT 21H
     
    MOV CL, [string_lentgh+1]
    MOV CH, 0                
    LEA SI, string_lentgh+2           
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