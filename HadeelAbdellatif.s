;Hadeel Abdellatif 1190451 Section 2
;Rotate right method: Rotate right ASCII code of each character two bits.
	
    AREA Final_Project_Data,DATA,READONLY 
MYSTR1 DCB "HADEEL",0 ; string


    AREA Final_Project_Code,CODE,READONLY
    LDR R0,=MYSTR1 ; pointer to MYSTR1
	LDR	R3,=0x40000000
	LDR	R5,=0x40000FBB
	ENTRY   ; to start the code

;encryption 

loop                     ;Loop
      LDRB  R1,[R0]      ;R1 = the first address in MYSTR1
	  CMP   R1,#0        ;Compair if R1 == 0 
      BEQ   done         ;If R1 == 0 then finish the loop 
	  MOV   R1,R1,ROR #2 ;Rotate right R1 for 2 bits
	  STR   R1,[R3]      ;Store the result in MYSTR2
	  ADD   R0,R0,#1     ;Add 1 to the first address to go to the second address in MYSTR1
	  ADD   R3,R3,#4     ;Add 1 to the first address in R3 to go to the secound address
	  B   loop           ;To repet the loop
done 
                    ;To finish the loop
	  LDR  R1,=0x40000000      ;R1 = the first address in R3

;decryption

loop1                     ;Loop
      LDR	R3,[R1]       ;R3 = the first address in R1
	  CMP   R3,#0         ;Compair if R3 == 0 
      BEQ   done1         ;If R3 == 0 then finish the loop 
	  MOV   R3,R3,ROR #30 ;Rotate left R3 2 bits
	  STRB  R3,[R5]       ;Store the result in R5
	  ADD   R1,R1,#4      ;Add 4 to R1
	  ADD   R5,R5,#1      ;Add 1 to the first address to go to the second address in R5
	  B   loop1           ;To repet the loop
done1                     ;To finish the loop
HERE	 B 		HERE 

    END
		# OrgaProject
