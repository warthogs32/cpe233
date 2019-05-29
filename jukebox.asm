; Constants for delay loop
.EQU INNER_LOOP = 0xFF
.EQU MIDDLE_LOOP = 0xFF


MOV   	      R31, 0x19 ;0.0996s


;Delay subroutine
; R31 = 0x0E => 0.0734s delay
; R31 = 0x60 => 0.503 delay
; Parameters R31: outer for loop count
; Affected R1, R2, R3

delay:	      MOV R1, R31  ;set outside for loop count
outside_one:  SUB R1, 0x01
              MOV R2, MIDDLE_LOOP	 ;set middle for loop count
middle_one:   SUB R2, 0x01
              MOV R3, INNER_LOOP 	 ;set inside for loop count
inside_one:   SUB R3, 0x01
              BRNE inside_one
              OR R2, 0x00           ;load flags for middle for counter
              BRNE middle_one
              OR R1, 0x00           ;load flags for outsde for counter value
              BRNE outside_one		
	      RET
