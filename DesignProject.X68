*-----------------------------------------------------------
* Title      : Design Project v1
* Written by : Mete Morris
* Date       : 03.11.2017
* Description: Prints out prompt, does help(not finished) and exit
* To-Do      : exit prompt when null character read
*-----------------------------------------------------------
    ORG    $1000
    
PROMPT:   
    DC.B 'MONITOR441> '
    DC.B 0

    
NOPROMPT:
    DC.B 'WRONG ENTRY. TYPE HELP FOR HELP'
    DC.B 0

HELPPROMPT:
    DC.B 'HELP'
    DC.B 0
    
EXITPROMPT:
    DC.B 'EXIT'
    DC.B 0
    
HELP:
    DC.B 'THIS IS HELP FILL THIS UP'
    DC.B 0
    ORG    $1200
    
START:                  ; first instruction of program


pSTART   
    MOVEA.L #PROMPT,A1 
    MOVE.B #14,D0
    TRAP #15
    LEA $4000,A1
    MOVE.B #2,D0
    TRAP #15
    
    
    
    MOVE.L #HELPPROMPT,A0
    CLR.L D3 ;COUNTER FOR REVERSING A1 TO USER INPUT
COMPAREHELP
    ADD.L #1,D3
    CMPM.B (A0)+,(A1)+
    BNE COMPAREEXIT
    CMPI.B #00,-1(A0)
    BNE COMPAREHELP
    BSR HELPFUNCTION 
    
COMPAREEXIT
    SUB.L D3,A1
    CLR.L D3
    MOVE.L #EXITPROMPT,A0
COMPAREEXIT2
    ADD.L #1,D3
    CMPM.B (A0)+,(A1)+
    BNE FAIL
    CMPI.B #0,-1(A0)
    BNE COMPAREEXIT2
    BSR EXITFUNCTION 
    
    
    
    
FAIL
    MOVEA.L #NOPROMPT,A1     
    MOVE.B #13,D0
    TRAP #15
    BRA pSTART
    
    

    
    
HELPFUNCTION
    MOVEA.L #HELP,A1     
    MOVE.B #13,D0
    TRAP #15
    BRA pSTART

EXITFUNCTION
    MOVE.B #9,D0
    TRAP #15





    END    START        ; last line of source
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
