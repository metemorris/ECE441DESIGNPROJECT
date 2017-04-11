*-----------------------------------------------------------
* Title      : Design Project v1
* Written by : Mete Morris
* Date       : 03.11.2017
* Description: Prints out prompt, does help(not finished) and exit
* To-Do      : exit prompt when null character read
*-----------------------------------------------------------
    ORG    $1000
*COMMAND LINE PROMPT*  
PROMPT:   
    DC.B 'MONITOR441> '
    DC.B 0

NOPROMPT:
    DC.B 'WRONG ENTRY. TYPE HELP FOR HELP'
    DC.B 0


*MENU OPTIONS LOOKUP*
HELPPROMPT:
    DC.B 'HELP'
    DC.B 0    
MDSPPROMPT:
    DC.B 'MDSP '
SORTWPROMPT:
    DC.B 'SORTW'
    DC.B 0
MMPROMPT:
    DC.B 'MM '
MSPROMPT:
    DC.B 'MS '
BFPROMPT:
    DC.B 'BF'
    DC.B 0
BMOVPROMPT:
    DC.B 'BMOV'
    DC.B 0
BTSTPROMPT:
    DC.B 'BTST'
    DC.B 0
BSCHPROMPT:
    DC.B 'BSCH'
    DC.B 0
GOPROMPT:
    DC.B 'GO'
    DC.B 0
DFPROMPT:
    DC.B 'DF'
    DC.B 0
EXITPROMPT:
    DC.B 'EXIT'
    DC.B 0
    
    
*EXTRA COMMAND LINE THINGS*
SEMICOLONSEP:
    DC.B ' : '
    DC.B 0
SPACE:
    DC.B ' '
    DC.B 0
    
LINEPROMPT 
    DC.B ' -> '
    DC.B 0
DOT
    DC.B '.'


*HELP LINE TO BE PRINTED OUT*  
HELP:
    DC.B 'HELP'
    DC.B $A  ;NEW LINE
    DC.B 'DISPLAYS ALL AVAILABE COMMANDS AND USAGE DESCRIPTION '
    DC.B $D  ;CARRIAGE RETURN
    DC.B $A
    DC.B $A
    DC.B 'MDSP'
    DC.B $D  
    DC.B $A
    DC.B $9 ;TAB
    DC.B 'The MDSP(MemoryDisplay)command outputs the address and memory'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'contents from <address1> to <address2>. '
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'The MDSP(Memory Display) command ALSO outputs the address and'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'memory contents from <address1> to <address1+16bytes>.' 
    DC.B $D  
    DC.B $A
    DC.B $A
    DC.B 'SORTW'
    DC.B $D  
    DC.B $A
    DC.B $9 
    DC.B 'The SORT command sorts a block of memory. The starting address and the'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'ending address <address2> of the memory block are specified in the command.'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'The order(A or D) specifies whether the list is sorted in Ascending'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'or Descending order.(The size of the data to be sorted is a word)'
    
    
    DC.B $D  
    DC.B $A
    DC.B $A
    DC.B 'MM'
    DC.B $D  
    DC.B $A
    DC.B $9 
    DC.B 'MM(MEMORY MODIFY)is used to display memory and,	as required, modify'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'data or enter new data. The size (byte, word, long word) controls the'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'number of bytes displayed for each address.'    
    
    DC.B $D  
    DC.B $A
    DC.B $A
    DC.B 'MS'
    DC.B $D  
    DC.B $A
    DC.B $9 
    DC.B 'The MS (Memory Set) command alters memmory by setting data into the'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'address specified. The data can take the form of ASCII string or'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'hexadecimal data.'

    DC.B $D  
    DC.B $A
    DC.B $A
    DC.B 'BF'
    DC.B $D  
    DC.B $A
    DC.B $9 
    DC.B 'The Block Fill (BF) command fills memory starting with the word'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'boundary <address1> through <address2>. Both <address1> and <address2> must'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'be even	addresses. This command only fills with a word-size (2 bytes) data'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'pattern. If an entire word-size data pattern is not entered, the pattern is '
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'right justified and leading zeros are inserted.'

    DC.B $D  
    DC.B $A
    DC.B $A
    DC.B 'BMOV'
    DC.B $D  
    DC.B $A
    DC.B $9 
    DC.B 'The Block Move (BMOV) command is used to move (duplicate) blocks of'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'memory from one area to another.'

    DC.B $D  
    DC.B $A
    DC.B $A
    DC.B 'BTST'
    DC.B $D  
    DC.B $A
    DC.B $9 
    DC.B 'The Block Test (BT) command is a destructive test of a block of'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'memory beginning at <address1> through <address2>. If this test'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'runs to completion without detecting errors, and display a message'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'that no error was detected. If memory problems are found, a message is'    
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'displayed indicating	the address, the data stored, and the data read'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'of the failing memory.'

 
 
    DC.B $D  
    DC.B $A
    DC.B $A
    DC.B 'BSCH'
    DC.B $D  
    DC.B $A
    DC.B $9 
    DC.B 'The BSCH (Block	Search)	command	is used	to search a literal string in'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'a memory block starting at <address1> through <address2> both inclusive.'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'In BSCH command, if search finds matching data, the data and address(es)'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'must be displayed.' 


    DC.B $D  
    DC.B $A
    DC.B $A
    DC.B 'GO'
    DC.B $D  
    DC.B $A
    DC.B $9 
    DC.B 'The GO command is used to start execution from a given address.'

    DC.B $D  
    DC.B $A
    DC.B $A
    DC.B 'DF'
    DC.B $D  
    DC.B $A
    DC.B $9 
    DC.B 'The Display Formatted Registers(DF) command is used to display'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'the MC68000 processor registers. This command should display current'
    DC.B $D  
    DC.B $A
    DC.B $9
    DC.B 'PC, SR,	US, SS and D, A	registers.'
    
    DC.B $D  
    DC.B $A
    DC.B $A
    DC.B 'EXIT'
    DC.B $D  
    DC.B $A
    DC.B $9 
    DC.B 'The EXIT command terminates/exits your MONITOR program'

 
    DC.B 0


    
    ORG    $2000
    
START:                  ; first instruction of program


pSTART   
    MOVEA.L #PROMPT,A1 
    MOVE.B #14,D0
    TRAP #15
    LEA $4000,A1
    MOVE.B #2,D0
    TRAP #15
    
    
    *COMPARING INPUT TO THE MENU ITEMS*
    MOVE.L #HELPPROMPT,A0
    CLR.L D3 ;COUNTER FOR REVERSING A1 TO USER INPUT
COMPAREHELP
    ADD.L #1,D3
    CMPM.B (A0)+,(A1)+
    BNE COMPAREMDSP
    CMPI.B #00,-1(A0)   ;CHECK IF THE BYTE JUST COMPARED WAS NULL TERMINATOR
    BNE COMPAREHELP
    BSR HELPFUNCTION 

COMPAREMDSP
    SUB.L D3,A1
    CLR.L D3
    MOVE.L #MDSPPROMPT,A0
COMPAREMDSP2
    ADD.L #1,D3
    CMPM.B (A0)+,(A1)+
    BNE COMPARESORTW
    CMPI.B #32,-1(A0)  ;COMPARING LAST PART TO SPACE TO SEE IF THE STRING ENDS WITH A SPACE
    BNE COMPAREMDSP2
    ;CHECK FOR THE ARGUMENTS
    CLR.L D4 ;FIRST ARG
    CLR.L D5 ;SECOND ARG
CMPMDSPL1
    ADD.B (A1)+,D4   ; MOVE THE MEMORY LOCATION NUMBER TO D4
    CMPI.B #0,(A1)  ;COMPARING LAST PART TO EMPTY STRNG
    BEQ MDSPFUNCTION1 ;FUNCTION FOR 1 ARG
    CMPI.B #32,(A1) ;COMPARING LAST PART TO SPACE
    BEQ CMPMDSPL2
    LSL.L #8,D4
    BSR CMPMDSPL1
CMPMDSPL2
    ADD.B (A1)+,D5   ; MOVE THE SECOND MEMORY LOCATION NUMBER TO D5
    CMPI.B #0,(A1)  ;COMPARING LAST PART TO EMPTY STRNG
    BEQ MDSPFUNCTION2 ;FUNCTION FOR 2 ARG
    LSL.L #8,D5
    BSR CMPMDSPL2
    
   
COMPARESORTW
    SUB.L D3,A1
    CLR.L D3
    MOVE.L #SORTWPROMPT,A0
COMPARESORTW2
    ADD.L #1,D3
    CMPM.B (A0)+,(A1)+
    BNE COMPAREMM
    CMPI.B #0,-1(A0)
    BNE COMPARESORTW2
    BSR SORTWFUNCTION ;CHANGE THIS WHEN YOU IMPLEMENT THE FUNCTION

COMPAREMM
    SUB.L D3,A1
    CLR.L D3
    MOVE.L #MMPROMPT,A0
COMPAREMM2
    ADD.L #1,D3
    CMPM.B (A0)+,(A1)+
    BNE COMPAREMS
    CMPI.B #32,-1(A0)  ;COMPARING LAST PART TO SPACE TO SEE IF THE STRING ENDS WITH A SPACE
    BNE COMPAREMM2
   ;CHECK FOR THE ARGUMENTS
    CLR.L D4 ;FIRST ARG
    CLR.L D5 ;SECOND ARG
CMPMML1
    ADD.B (A1)+,D4   ; MOVE THE MEMORY LOCATION NUMBER TO D4
    CMPI.B #0,(A1)  ;COMPARING LAST PART TO EMPTY STRNG
    BEQ FAIL ;FAILS IF NO MEM IS GIVEN
    CMPI.B #32,(A1) ;COMPARING LAST PART TO SPACE
    BEQ CMPMML2
    LSL.L #8,D4
    BSR CMPMML1
CMPMML2
    ADD.B 1(A1),D5   ; MOVE THE SECOND MEMORY LOCATION AFTER SPACE TO D5
    CMP.B #'B',D5  ;COMPARING LAST PART TO B,W OR L
    BEQ MMFUNCTION ;FUNCTION 
    CMP.B #'W',D5 
    BEQ MMFUNCTION ;FUNCTION
    CMP.B #'L',D5  
    BEQ MMFUNCTION ;FUNCTION
    ;D4 GIVES THE ADDRESS D5 GIVES THE MODE
    BRA FAIL ;IF END IS NOT EQUAL FAIL AND EXIT


COMPAREMS ;SEND 3 ARGUMENTS, D4 IS MEMLOC, D5 IS DATA, D6 IS ASCII OR HEX
    SUB.L D3,A1
    CLR.L D3
    MOVE.L #MSPROMPT,A0
COMPAREMS2
    ADD.L #1,D3
    CMPM.B (A0)+,(A1)+
    BNE COMPAREBF
    CMPI.B #32,-1(A0)  ;COMPARING LAST PART TO SPACE TO SEE IF THE STRING ENDS WITH A SPACE
    BNE COMPAREMS2
   ;CHECK FOR THE ARGUMENTS
    CLR.L D4 ;FIRST ARG
    CLR.L D5 ;SECOND ARG
    CLR.L D6 ;THIRD ARG
CMPMSL1
    ADD.B (A1)+,D4   ; MOVE THE MEMORY LOCATION NUMBER TO D4
    CMPI.B #0,(A1)  ;COMPARING LAST PART TO EMPTY STRNG
    BEQ FAIL ;FAILS IF NO MEM IS GIVEN
    CMPI.B #32,(A1) ;COMPARING LAST PART TO SPACE
    BEQ CMPMSL2
    LSL.L #8,D4
    BRA CMPMSL1
CMPMSL2
    ADD.B (A1)+,D5   ; MOVE THE MEMORY LOCATION NUMBER TO D5
    CMPI.B #0,(A1)  ;COMPARING LAST PART TO EMPTY STRNG
    BEQ FAIL ;FAILS IF NO MEM IS GIVEN
    CMPI.B #32,(A1) ;COMPARING LAST PART TO SPACE
    BEQ CMPMSL3
    LSL.L #8,D5
    BRA CMPMSL2
CMPMSL3
    ADD.B 1(A1),D6   ; MOVE THE SECOND MEMORY LOCATION AFTER SPACE TO D5
    CMP.B #'H',D6  ;COMPARING LAST PART TO B,W OR L
    BEQ MSFUNCTION ;FUNCTION 
    CMP.B #'A',D6 
    BEQ MSFUNCTION ;FUNCTION
    ;D4 GIVES THE ADDRESS D5 GIVES THE MODE
    BRA FAIL ;IF END IS NOT EQUAL FAIL AND EXIT


COMPAREBF
    SUB.L D3,A1
    CLR.L D3
    MOVE.L #BFPROMPT,A0
COMPAREBF2
    ADD.L #1,D3
    CMPM.B (A0)+,(A1)+
    BNE COMPAREBMOV
    CMPI.B #0,-1(A0)
    BNE COMPAREBF2
    BSR BFFUNCTION ;CHANGE THIS WHEN YOU IMPLEMENT THE FUNCTION

COMPAREBMOV
    SUB.L D3,A1
    CLR.L D3
    MOVE.L #BMOVPROMPT,A0
COMPAREBMOV2
    ADD.L #1,D3
    CMPM.B (A0)+,(A1)+
    BNE COMPAREBTST
    CMPI.B #0,-1(A0)
    BNE COMPAREBMOV2
    BSR BMOVFUNCTION ;CHANGE THIS WHEN YOU IMPLEMENT THE FUNCTION

COMPAREBTST
    SUB.L D3,A1
    CLR.L D3
    MOVE.L #BTSTPROMPT,A0
COMPAREBTST2
    ADD.L #1,D3
    CMPM.B (A0)+,(A1)+
    BNE COMPAREBSCH
    CMPI.B #0,-(A0)
    BNE COMPAREBTST2
    BSR BTSTFUNCTION ;CHANGE THIS WHEN YOU IMPLEMENT THE FUNCTION

COMPAREBSCH
    SUB.L D3,A1
    CLR.L D3
    MOVE.L #BSCHPROMPT,A0
COMPAREBSCH2
    ADD.L #1,D3
    CMPM.B (A0)+,(A1)+
    BNE COMPAREGO
    CMPI.B #0,-1(A0)
    BNE COMPAREBSCH2
    BSR BSCHFUNCTION ;CHANGE THIS WHEN YOU IMPLEMENT THE FUNCTION

COMPAREGO
    SUB.L D3,A1
    CLR.L D3
    MOVE.L #GOPROMPT,A0
COMPAREGO2
    ADD.L #1,D3
    CMPM.B (A0)+,(A1)+
    BNE COMPAREDF
    CMPI.B #0,-1(A0)
    BNE COMPAREGO2
    BSR GOFUNCTION ;CHANGE THIS WHEN YOU IMPLEMENT THE FUNCTION

COMPAREDF
    SUB.L D3,A1
    CLR.L D3
    MOVE.L #DFPROMPT,A0
COMPAREDF2
    ADD.L #1,D3
    CMPM.B (A0)+,(A1)+
    BNE COMPAREEXIT
    CMPI.B #0,-1(A0)
    BNE COMPAREDF2
    BSR DFFUNCTION ;CHANGE THIS WHEN YOU IMPLEMENT THE FUNCTION

    
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
    
    
    
*WHEN INPUT DOESNT FIT THE CRITERIA*    
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
    
MDSPFUNCTION1 ;argument passed as D4, PRINT FROM D4 TO D5
    ;MOVE.L #$2000,D4
    BSR ASCIITOHEX
    ;DISPLAY EVERYTHIGN FROM D4 FOR NOW 2000 TO 2016\
    MOVE.L D4,A3
    ADD.L #$10,A3 ;ENDING 
    MOVE.L D4,A2 ;BEGGINING
MDSPFUNCTION1L1 
    ;PRINT MEMLOC
    MOVE.L A2,D1
    BSR HEXTOASCII 
     
    SWAP D1
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    SWAP D1
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15

    
    ;PRINT SEMICOLON
    MOVEA.L #SEMICOLONSEP,A1     
    MOVE.B #14,D0
    TRAP #15
    
    ;PRINT CONTENT
    CLR.L D1
    MOVE.B (A2)+,D1
    BSR HEXTOASCII 
     
    
    ROR #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ROR #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ;PRINT empty space
    MOVEA.L #SPACE,A1     
    MOVE.B #13,D0
    TRAP #15
    
    
    CMPA.L A2,A3
    BGT MDSPFUNCTION1L1
    

    
    BRA pSTART

MDSPFUNCTION2 ;argument passed as D4, PRINT FROM D4 TO D5
    BSR ASCIITOHEX
    ;DISPLAY EVERYTHIGN FROM D4 TO D5\
    MOVE.L D4,A2 ;BEGGINING
    MOVE.L D5,D4
    BSR ASCIITOHEX
    MOVE.L D4,A3 ;ENDING
    ADD.L #1,A3
MDSPFUNCTION2L1 
  ;PRINT MEMLOC
    MOVE.L A2,D1
    BSR HEXTOASCII 
     
    SWAP D1
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    SWAP D1
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15

    
    ;PRINT SEMICOLON
    MOVEA.L #SEMICOLONSEP,A1     
    MOVE.B #14,D0
    TRAP #15
    
    ;PRINT CONTENT
    CLR.L D1
    MOVE.B (A2)+,D1
    BSR HEXTOASCII 
     
    
    ROR #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ROR #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ;PRINT empty space
    MOVEA.L #SPACE,A1     
    MOVE.B #13,D0
    TRAP #15
    
    
    CMPA.L A2,A3
    BGT MDSPFUNCTION2L1
    

    
    BRA pSTART



SORTWFUNCTION ;argument passed as D4 AS MEMLOC AND d5 AS THE MODE
    MOVEA.L #SORTWPROMPT,A1     
    MOVE.B #13,D0
    TRAP #15
    BRA pSTART

;CURRENTLY ONLY FOR W, WORK ON B AND L 
MMFUNCTION ;argument passed as D4 AS MEMLOC AND d5 AS THE MODE
    BSR ASCIITOHEX
    ;DISPLAY EVERYTHIGN FROM D4 TO D5\
    MOVE.L D4,A2 ;BEGGINING
    ;IGNORING B,M,L BUSSINESS FOR NOW AND ASSUMING B
    CMP.B #'B',D5 
    BEQ MMFUNCTIONL1 ;FUNCTION 
    CMP.B #'W',D5 
    BEQ MMFUNCTIONL2 ;FUNCTION
    CMP.B #'L',D5  
    BEQ MMFUNCTIONL3 ;FUNCTION
MMFUNCTIONL1 
  ;PRINT MEMLOC
    MOVE.L A2,D1
    BSR HEXTOASCII 
     
    SWAP D1
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    SWAP D1
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15

    
    ;PRINT SEMICOLON
    MOVEA.L #SEMICOLONSEP,A1     
    MOVE.B #14,D0
    TRAP #15
    
    ;PRINT CONTENT
    CLR.L D1
    MOVE.B (A2)+,D1
    BSR HEXTOASCII 
     
    
    ROR #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ROR #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ;PRINT LINEPROMPT,
    MOVEA.L #LINEPROMPT,A1     
    MOVE.B #14,D0
    TRAP #15
    
    
    ;PROMPT FOR INPUT,CONTINUE UNLESS IT IS DOT
    LEA $5000,A1
    MOVE.B #2,D0
    TRAP #15
    
    
    *COMPARING INPUT TO THE MENU ITEMS*
    ;COMPARING TO DOT
    CMP.B #$2E,(A1) ;2E IS THE DOT
    BEQ pSTART ;if input is dot exit
    ;IF INPUT IS EMPTY MOVE ON TO THE NEXT BIT
    CMP.B #00,(A1)
    BEQ MMFUNCTIONL1
    
    ;IF INPUT ARE NEITHER READ THE ENTERED LINE CONVERT TO HEXT AND STORE
    MOVE.W (A1),D4
    BSR ASCIITOHEX
    MOVE.B D4,-1(A2)
    BRA MMFUNCTIONL1

MMFUNCTIONL2 ;FOR WORD OPERATION MM
    ;PRINT MEMLOC
    MOVE.L A2,D1
    BSR HEXTOASCII 
     
    SWAP D1
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    SWAP D1
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15

    
    ;PRINT SEMICOLON
    MOVEA.L #SEMICOLONSEP,A1     
    MOVE.B #14,D0
    TRAP #15
    
    ;PRINT CONTENT
    CLR.L D1
    MOVE.W (A2)+,D1
    BSR HEXTOASCII 
     
    
    SWAP D1
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    SWAP D1
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ;PRINT LINEPROMPT,
    MOVEA.L #LINEPROMPT,A1     
    MOVE.B #14,D0
    TRAP #15
    
    ;PROMPT FOR INPUT,CONTINUE UNLESS IT IS DOT
    LEA $5000,A1
    MOVE.B #2,D0
    TRAP #15
    
    *COMPARING INPUT TO THE MENU ITEMS*
    ;COMPARING TO DOT
    CMP.B #$2E,(A1) ;2E IS THE DOT
    BEQ pSTART ;if input is dot exit
    ;IF INPUT IS EMPTY MOVE ON TO THE NEXT BIT
    CMP.B #00,(A1)
    BEQ MMFUNCTIONL2
    
    ;IF INPUT ARE NEITHER READ THE ENTERED LINE CONVERT TO HEXT AND STORE
    MOVE.L (A1),D4
    BSR ASCIITOHEX
    MOVE.W D4,-2(A2)
    BRA MMFUNCTIONL2



MMFUNCTIONL3 ;FOR LONG WORD MM OPERATION
    ;PRINT MEMLOC
    MOVE.L A2,D1
    BSR HEXTOASCII 
     
    SWAP D1
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    SWAP D1
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15

    
    ;PRINT SEMICOLON
    MOVEA.L #SEMICOLONSEP,A1     
    MOVE.B #14,D0
    TRAP #15
    
    ;PRINT CONTENT
    CLR.L D1
    MOVE.W (A2)+,D1
    BSR HEXTOASCII 
     
    
    SWAP D1
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    SWAP D1
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ;PRINT SECOND WORD
    ;PRINT CONTENT
    CLR.L D1
    MOVE.W (A2)+,D1
    BSR HEXTOASCII 
     
    
    SWAP D1
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    SWAP D1
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15
    
    ROL #8,D1
    MOVE.B #6,D0
    TRAP #15

    
    
    ;PRINT LINEPROMPT,
    MOVEA.L #LINEPROMPT,A1     
    MOVE.B #14,D0
    TRAP #15
    
    ;PROMPT FOR INPUT,CONTINUE UNLESS IT IS DOT
    LEA $5000,A1
    MOVE.B #2,D0
    TRAP #15
    
    *COMPARING INPUT TO THE MENU ITEMS*
    ;COMPARING TO DOT
    CMP.B #$2E,(A1) ;2E IS THE DOT
    BEQ pSTART ;if input is dot exit
    ;IF INPUT IS EMPTY MOVE ON TO THE NEXT BIT
    CMP.B #00,(A1)
    BEQ MMFUNCTIONL3
    
    ;IF INPUT ARE NEITHER READ THE ENTERED LINE CONVERT TO HEXT AND STORE
    MOVE.L (A1)+,D4
    BSR ASCIITOHEX
    MOVE.W D4,-4(A2)
    ;PRINT SECOND WORD
    MOVE.L (A1),D4
    BSR ASCIITOHEX
    MOVE.W D4,-2(A2)
    
    BRA MMFUNCTIONL3



    

MSFUNCTION   ;D4 IS ADDRESS, D5 IS DATA, D6 IS ASCII OR HEX, WORD OPERATIONS ONLY
    BSR ASCIITOHEX
    MOVE.L D4,A2 ;MEMLOC FOR DATA TO BE STORED
    ;IGNORING B,M,L BUSSINESS FOR NOW AND ASSUMING B
    CMP.B #'H',D6 
    BEQ MSFUNCTIONL1 ;FUNCTION FOR WHEN THE NUM GIVEN IS HEX
    CMP.B #'A',D6
    BEQ MSFUNCTIONL2 ;FUNCTION FOR WHE THE NUM GIVEN IS ASCII
    
MSFUNCTIONL1
    MOVE.L D5,D4 
    BSR ASCIITOHEX
    MOVE.W D4,(A2)
    BRA pSTART
MSFUNCTIONL2
    MOVE.L D5,(A2)
    BRA pSTART
    
    
BFFUNCTION
    MOVEA.L #BFPROMPT,A1     
    MOVE.B #13,D0
    TRAP #15
    BRA pSTART

BMOVFUNCTION
    MOVEA.L #BMOVPROMPT,A1     
    MOVE.B #13,D0
    TRAP #15
    BRA pSTART

BTSTFUNCTION
    MOVEA.L #BTSTPROMPT,A1     
    MOVE.B #13,D0
    TRAP #15
    BRA pSTART

BSCHFUNCTION
    MOVEA.L #BSCHPROMPT,A1     
    MOVE.B #13,D0
    TRAP #15
    BRA pSTART

GOFUNCTION
    MOVEA.L #GOPROMPT,A1     
    MOVE.B #13,D0
    TRAP #15
    BRA pSTART

DFFUNCTION
    MOVEA.L #DFPROMPT,A1     
    MOVE.B #13,D0
    TRAP #15
    BRA pSTART

EXITFUNCTION
    MOVE.B #9,D0
    TRAP #15
    
    
********* HELPER FUNCTIONS **********

HEXTOASCII
*-----------------------------------------------------------
* Title      : HEX to ASCII CONVERTER
* Written by : METE MORRIS
* Date       : 
* Description: CONVERTS HEX WORD READ TO ASCII, REGISTERS MODIFIED ARE D2,D3,D4,D5 RETURNS D1
*-----------------------------------------------------------
     
     MOVEM.L D2-D5,-(SP)
     
     CLR.L D2
     CLR.L D3
     CLR.L D4
     CLR.L D5
     
     ;FIRST NO
     MOVE.B D1,D2
     BCLR #4,D2
     BCLR #5,D2
     BCLR #6,D2
     BCLR #7,D2
     
     ;SECOND NO
     LSR #4,D1
     MOVE.B D1,D3
     BCLR #4,D3
     BCLR #5,D3
     BCLR #6,D3
     BCLR #7,D3 
     
     ;THIRD NO
     LSR #4,D1
     MOVE.B D1,D4
     BCLR #4,D4
     BCLR #5,D4
     BCLR #6,D4
     BCLR #7,D4 
     
     ;FOURTH NO
     LSR #4,D1
     MOVE.B D1,D5
     BCLR #4,D5
     BCLR #5,D5
     BCLR #6,D5
     BCLR #7,D5 
    
    
    ;CONVERT FIRST NO TO ASCII
     CMP.B #9,D2
     BGT LARGER1
     ADD.L #$30,D2
     BRA SECOND
LARGER1
     ADD.L #$37,D2
     
SECOND     
    ;CONVERT SECOND NO TO ASCII
     CMP.B #9,D3
     BGT LARGER2
     ADD.L #$30,D3
     BRA THIRD
LARGER2
     ADD.L #$37,D3

THIRD     
    ;CONVERT THIRD NO TO ASCII
     CMP.B #9,D4
     BGT LARGER3
     ADD.L #$30,D4
     BRA FOURTH
LARGER3
     ADD.L #$37,D4

FOURTH    
    ;CONVERT FOURTH NO TO ASCII
     CMP.B #9,D5
     BGT LARGER4
     ADD.L #$30,D5
     BRA ADDFINISH
LARGER4
     ADD.L #$37,D5
     
    
    ;ROTATE AND ADD THE NUMBERS     
ADDFINISH
     CLR.L D1
     ADD.L D2,D1
     
     LSL #8,D3
     ADD.L D3,D1
     
     SWAP.W D4
     ADD.L D4,D1
     
     LSL #8,D5
     SWAP.W D5
     ADD.L D5,D1
     
     MOVEM.L (SP)+,D2-D5
     
     RTS    


ASCIITOHEX
*-----------------------------------------------------------
* Title      : ASCII to HEX CONVERTER
* Written by : METE MORRIS
* Date       : 
* Description: CONVERTS ASCII  LWORD READ TO HEX, REGISTERS MODIFIED ARE D3,D5,D6,D7 RETURNS RESUT IN D4
*-----------------------------------------------------------

     MOVEM.L D3/D5-D7,-(SP)
     CLR.L D3
     CLR.L D5
     CLR.L D6
     CLR.L D7
FIRSTBYTE
     MOVE.B D4,D3
     CMP #$41,D3
     BGE ALP1
     SUB.B #$30,D3
     BRA SECONDBYTE
ALP1 
     SUB.B #$37,D3    
     
SECONDBYTE
     LSR #8,D4
     MOVE.B D4,D5
     CMP #$41,D5
     BGE ALP2
     SUB.B #$30,D5
     BRA THIRDBYTE
ALP2 
     SUB.B #$37,D5    
     
THIRDBYTE
     SWAP D4
     MOVE.B D4,D6
     CMP #$41,D6
     BGE ALP3
     SUB.B #$30,D6
     BRA FOURTHBYTE
ALP3 
     SUB.B #$37,D6    
     
     
FOURTHBYTE
     LSR #8,D4
     MOVE.B D4,D7 
     CMP #$41,D7
     BGE ALP4
     SUB.B #$30,D7
     BRA FINISH2
ALP4 
     SUB.B #$37,D7   
        
    
    ;ROTATE AND ADD THE NUMBERS 
FINISH2    
     CLR.L D4
     ADD.L D3,D4
     
     LSL #4,D5
     ADD.L D5,D4
     
     LSL #8,D6
     ADD.L D6,D4
     
     LSL #8,D7
     LSL #4,D7
     ADD.L D7,D4
     
     MOVEM.L (SP)+,D3/D5-D7
     
     
     RTS





    END    START        ; last line of source






*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
