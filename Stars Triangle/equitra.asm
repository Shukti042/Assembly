.MODEL SMALL
.STACK 100H
.DATA
INPUT DB ?
HALF DB ?
CT DB ?
.CODE
MAIN PROC
    MOV AH,2
    MOV DL,'N'
    INT 21H
    MOV DL,'='
    INT 21H
    MOV AH,1
    INT 21H 
    SUB AL,'0'
    MOV INPUT,AL 
    MOV AH,0
    MOV BX,2 
    MOV DX,0
    DIV BX 
    MOV HALF,AL
    MOV INPUT,AL
    INC INPUT
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    MOV CX,0 
    MOV DX,0 
    MOV CT,1
PRINT_ROW:
    MOV CX,0  
    MOV CL,HALF
    MOV DL,' '
    CMP CX,0
    JZ SKIP
PRINT_1ST:
    INT 21H
LOOP PRINT_1ST
SKIP: 
    MOV CX,0
    MOV CL,CT
    MOV DL,'*'
PRINT_2ND:
    INT 21H
LOOP PRINT_2ND
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H 
    ADD CT,2 
    DEC HALF
    DEC INPUT
    JNZ PRINT_ROW
    MOV AH,4CH
    INT 21H
MAIN ENDP    
    END MAIN
    