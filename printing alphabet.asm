.model small
.stack 100h
.DATA
.CODE
MAIN PROC
   mov cl,26
   mov dl,65
   loop1:
   mov ah,02
   int 21h
   inc dl
   dec cl
   jnz loop1
             
 
 MOV AH,4CH
 INT 21H
    MAIN ENDP
END MAIN