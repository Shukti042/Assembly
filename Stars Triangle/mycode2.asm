.MODEL SMALL
.STACK 100H
.DATA
VAR1 DB ?
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
    MOV BL,AL
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    MOV VAR1,1
PRINT_ROW:  
    MOV CL,VAR1
    MOV CH,0
    MOV DL,'*'
PRINT_COL:
    INT 21H
    LOOP PRINT_COL 
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H 
    INC VAR1 
    DEC BL
    JNZ PRINT_ROW
    MOV AH,4CH
    INT 21H
MAIN ENDP    
    END MAIN
    
    