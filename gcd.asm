.MODEL SMALL
.STACK 100H
.DATA 
RESULT DB ?,?,?,?,?,?,?
FINAL DB ?,?,?,?,?,?,?
N DW ?
G DW 0
.CODE
MAIN PROC 
   MOV AX,@DATA
   MOV DS,AX  
   MOV AX,8
   MOV BX,12
   GCD:
   MOV DX,0
   DIV BX
   CMP DX,0
   JE END_GCD 
   MOV AX,BX
   MOV BX,DX
   JMP GCD
   END_GCD:
   MOV AX,BX
   MOV SI,0
   WHILE_LOOP:
   MOV DX,0 
   MOV BX,10
   DIV BX  
   ADD DX,'0'
   MOV RESULT+SI,DL 
   ADD SI,1 
   CMP AX,0
   JNZ WHILE_LOOP
   END_LOOP:
   MOV RESULT+SI,'$'
   MOV FINAL+SI,'$'
   MOV CX,SI
   MOV DI,SI
   SUB DI,1
   MOV SI,0 
   REVERSE:
   MOV BL,RESULT+DI
   MOV FINAL+SI,BL
   SUB DI,1
   ADD SI,1
   LOOP REVERSE
   MOV AH,2
   MOV DL,0DH
   INT 21H
   MOV DL,0AH
   INT 21H
   MOV AH,9
   LEA DX,FINAL
   INT 21H
   ;RETURN TO DOS
   MOV AH,4CH
   INT 21H
MAIN ENDP    
    END MAIN