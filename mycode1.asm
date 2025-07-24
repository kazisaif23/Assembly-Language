.MODEL SMALL
.STACK  100h 
.DATA
    
.CODE
MAIN PROC
    MOV AH,01 ;INPUT
    INT 21H     
    MOV BL,AL
    INT 21H
    MOV BH,AL
    INT 21H
    MOV CL,AL
    INT 21H
    MOV CH,AL
    
    MOV AH,02 ;OUTPUT
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H  
    
       
    MOV DL,BL
    INT 21H  
    MOV DL,BH
    INT 21H  
    MOV DL,CL
    INT 21H  
    MOV DL,CH
    INT 21H  
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    END MAIN
    
    
