; BPM constants
.EQU 		BPM_126 = 11
.EQU 		BPM_106 = 13
.EQU 		BPM_78 = 18
.EQU		BPM_63 = 20
; DELAY constants
.EQU 	 	INNER_LOOP = 0xFF
.EQU 	 	MIDDLE_LOOP = 0xFF
; PORT Definitions
.EQU 	 	SPEAKER_PORT = 0x69
.EQU 	 	LOWER_SWITCHES = 0x21

; NOTE Defintions
.EQU		THIRS	= 0x01
.EQU 		SIXT 	= 0X02
.EQU 		EIGHTH 	= 0X04
.EQU 		QUARTER	= 0X08
.EQU 	 	HALF 	= 0X10
.EQU 	 	WHOLE 	= 0X20
.EQU 		REST 	= 0
.EQU 		LOC  	= 1
.EQU 		LOCS 	= 2
.EQU 		LOD  	= 3
.EQU 	 	LODS 	= 4
.EQU 		LOE  	= 5
.EQU 		LOF  	= 6
.EQU 		LOFS 	= 7
.EQU 		LOG  	= 8
.EQU 		LOGS 	= 9
.EQU 		LOA  	= 10
.EQU 	 	LOAS 	= 11
.EQU 		LOB  	= 12
.EQU 		MIDC 	= 13
.EQU 		MIDCS 	= 14
.EQU 		MIDD  	= 15
.EQU 	 	MIDDS 	= 16
.EQU 		MIDE  	= 17
.EQU 		MIDF  	= 18
.EQU 		MIDFS 	= 19
.EQU 		MIDG  	= 20
.EQU 		MIDGS 	= 21
.EQU 		MIDA  	= 22
.EQU 	 	MIDAS 	= 23
.EQU 		MIDB  	= 24
.EQU 		HIC 	= 25
.EQU 		HICS	= 26
.EQU 		HID 	= 27
.EQU 	 	HIDS	= 28
.EQU 		HIE 	= 29
.EQU 		HIF 	= 30
.EQU 		HIFS	= 31
.EQU 		HIG 	= 32
.EQU 		HIGS	= 33
.EQU 		HIA 	= 34
.EQU 	 	HIAS	= 35
.EQU 		HIB 	= 36
.EQU		HIXC	= 37
.EQU		HIXD	= 39
.EQU		HIXE 	= 41
.EQU		HIXF	= 42
.EQU		HIXG	= 44
.EQU		HIXA	= 46
.EQU		HIXB	= 48	
.EQU		HIXXC	= 49
; R1, R2, R3 used for delay loop
; R4 used for note selection
; R5 used for song selection
; R30 used for BPM control
; R31 used for note length selectio

main: 		IN 		R5, LOWER_SWITCHES 	; Read song number from switches
			OUT		R5, 0x81
			CMP		R5, 1
			BREQ	Seven_NA
			CMP		R5, 2
			BREQ	Real_Slim
			CMP		R5, 3
			BREQ	Power
			CMP		R5, 4
			BREQ Imp_March
			CMP		R5, 5
			BREQ	Stairway
			MOV		R4, REST
			OUT		R4, SPEAKER_PORT
			BRN 		main 			; Repeat indefinitely
;The White Stripes  Seven Nation Army  126 BPM
Seven_NA:	MOV 		R30, BPM_126 		; Sets base loop to .12s => 126bpm
		MOV		R4, MIDE		; Choose note
		MOV		R31, QUARTER 		; Choose duration
		CALL 		play_note 		; Play note
		MOV		R31, EIGHTH
		CALL 		play_note
		MOV		R4, REST	
		MOV		R31, SIXT
		CALL 		play_note
		MOV		R4, MIDE	
		MOV		R31, EIGHTH
		CALL 		play_note
		MOV		R4, MIDG	
		MOV		R31, EIGHTH
		CALL 		play_note
		
		MOV		R4, MIDG	
		MOV		R31, SIXT
		CALL 		play_note
		MOV		R4, MIDE	
		MOV		R31, SIXT
		CALL 		play_note
		MOV		R4, REST	
		MOV		R31, EIGHTH
		CALL 		play_note
		MOV		R4, MIDD	
		MOV		R31, EIGHTH
		CALL 		play_note
		MOV		R4, MIDC	
		MOV		R31, HALF
		CALL 		play_note
		MOV		R4, LOB		 	
		MOV		R31, HALF
		CALL 		play_note	
;;;;;;;;;;;;;;;; 2nd Stanza ;;;;;;;;;;;;;;;;;;;;;
		MOV		R4, MIDE		; Choose note
		MOV		R31, QUARTER 		; Choose duration
		CALL 		play_note 		; Play note
		MOV		R31, EIGHTH
		CALL 		play_note
		
		MOV		R4, REST	
		MOV		R31, SIXT
		CALL 		play_note
		
		MOV		R4, MIDE	
		MOV		R31, EIGHTH
		CALL 		play_note

		MOV		R4, MIDG	
		MOV		R31, EIGHTH
		CALL 		play_note
		MOV		R4, MIDG	
		MOV		R31, SIXT
		CALL 		play_note

		MOV		R4, MIDE	
		MOV		R31, SIXT
		CALL 		play_note
		
		MOV		R4, REST
		MOV		R31, EIGHTH
		CALL		play_note
		
		MOV		R4, MIDD	
		MOV		R31, EIGHTH
		CALL 		play_note
		
		MOV		R4, MIDC	
		MOV		R31, EIGHTH
		CALL 		play_note	
		MOV		R4, MIDC	
		MOV		R31, SIXT
		CALL 		play_note
		
		MOV		R4, MIDD	
		MOV		R31, EIGHTH
		CALL 		play_note
		MOV		R4, MIDD	
		MOV		R31, SIXT
		CALL 		play_note
		
		MOV		R4, MIDC	
		MOV		R31, EIGHTH
		CALL 		play_note
		
		MOV		R4, LOB	
		MOV		R31, QUARTER
		CALL 		play_note
		
		MOV		R4, REST	
		MOV		R31, QUARTER
		CALL 		play_note
		
		BRN main

			
;Eminem � The Real Slim Shady � 105 BPM	

Real_Slim:	MOV 		R30, BPM_106 		; Sets base loop to .12s => 126bpm
				
			MOV		R4, MIDC		; Choose note
			MOV		R31, EIGHTH 		; Choose duration
			CALL 		play_note 		; Play note

			MOV		R4, MIDDS		
			MOV		R31, EIGHTH 	
			CALL 		play_note 	
	
			MOV		R4, MIDG	
			MOV		R31, EIGHTH 	
			CALL 		play_note 		
			
			MOV		R4, MIDAS		
			MOV		R31, EIGHTH 		
			CALL 		play_note 		
			
			MOV		R4, HIC		
			MOV		R31, EIGHTH 		
			CALL 		play_note 		
	
			MOV		R4, REST		
			MOV		R31, QUARTER 		
			CALL 		play_note 
				
			MOV		R4, MIDGS		
			MOV		R31, EIGHTH 		
			CALL 		play_note 
	
;;;;;;;;;;;;;;;;;;;;;;;;2nd Stanza;;;;;;;;;;;;;;;;;;;;;;;;;;;;;				
			MOV		R4, MIDG	
			MOV		R31, EIGHTH 	
			CALL 		play_note
	
			MOV		R4, REST	
			MOV		R31, QUARTER 	
			CALL 		play_note
	
			MOV		R4, MIDGS	
			MOV		R31, EIGHTH 	
			CALL 		play_note
	
			MOV		R4, MIDG	
			MOV		R31, SIXT 	
			CALL 		play_note
		
			MOV		R4, MIDGS	
			MOV		R31, THIRS 	;32nd note 	
			CALL 		play_note
	
			MOV		R4, MIDG	
			MOV		R31, THIRS 	;32nd note 	
			CALL 		play_note
	
			MOV		R4, MIDF
			MOV		R31, EIGHTH	
			CALL 		play_note
	
			MOV		R4, MIDDS	
			MOV		R31, EIGHTH 	
			CALL 		play_note
	
			MOV		R4, LOB	
			MOV		R31, EIGHTH 	
			CALL 		play_note
			
			BRN main


;Kanye West � POWER � 78 BPM

Power:		MOV		R10, 0
			MOV 		R30, BPM_78 		; Sets base loop to .12s => 126bpm
				
P_loop:			MOV		R4, LOAS		; Choose note
			MOV		R31, SIXT 		; Choose duration
			CALL 		play_note 		; Play note

			MOV		R4, MIDC		
			MOV		R31, SIXT 	
			CALL 		play_note
			
			MOV		R4, REST		
			MOV		R31, EIGHTH 	
			CALL 		play_note
			MOV		R4, REST		
			MOV		R31, QUARTER 	
			CALL 		play_note
			
			MOV		R4, MIDG		
			MOV		R31, QUARTER 	
			CALL 		play_note
		
			MOV		R4, MIDF		
			MOV		R31, QUARTER 	
			CALL 		play_note
			
			ADD		R10, 1
			MOV		R11, 3
			CMP		R10, R11
			BRNE	P_loop

;;;;;;;;;;;;;;;;;;;;;2nd stanza;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			
			MOV		R4, HIC		
			MOV		R31, SIXT 	
			CALL 		play_note

			MOV		R4, MIDG		
			MOV		R31, SIXT	
			CALL 		play_note

			MOV		R4, MIDF		
			MOV		R31, SIXT 	
			CALL 		play_note

			MOV		R4, MIDDS		
			MOV		R31, SIXT 	
			CALL 		play_note

			MOV		R4, MIDF		
			MOV		R31, SIXT 	
			CALL 		play_note

			MOV		R4, MIDG		
			MOV		R31, SIXT	
			CALL 		play_note

			MOV		R4, REST		
			MOV		R31, EIGHTH	
			CALL 		play_note

			MOV		R4, MIDAS		
			MOV		R31, SIXT	
			CALL 		play_note
		
			MOV		R4, MIDG		
			MOV		R31, SIXT	
			CALL 		play_note
			
			MOV		R4, MIDF		
			MOV		R31, SIXT	
			CALL 		play_note
		
			MOV		R4, MIDDS		
			MOV		R31, SIXT	
			CALL 		play_note
		
			MOV		R4, MIDF		
			MOV		R31, SIXT	
			CALL 		play_note
		
			MOV		R4, MIDDS		
			MOV		R31, SIXT	
			CALL 		play_note
		
			MOV		R4, MIDC		
			MOV		R31, SIXT	
			CALL 		play_note
			
			MOV		R4, LOAS		
			MOV		R31, SIXT	
			CALL 		play_note
		
			BRN main	


;John Williams - The Imperial March - 104 BPM

Imp_March:		MOV		R10, 0 
			MOV		R30, BPM_106

Imp_Loop:	MOV		R4, LOG		; Choose note
			MOV		R31, QUARTER 		; Choose duration
			CALL 		play_note 		; Play note
			
			MOV		R4, REST		
			MOV		R31, SIXT 
			CALL 		play_note

			MOV		R4, LOG		
			MOV		R31, QUARTER 
			CALL 		play_note
			
			MOV		R4, REST		
			MOV		R31, SIXT 
			CALL 		play_note 

			MOV		R4, LOG		
			MOV		R31, QUARTER 
			CALL 		play_note 

			MOV		R4, LODS		
			MOV		R31, SIXT 
			CALL 		play_note
			MOV		R4, LODS		
			MOV		R31, EIGHTH 
			CALL 		play_note 

			MOV		R4, LOAS		
			MOV		R31, EIGHTH
			CALL 		play_note

			MOV		R4, LOG		
			MOV		R31, QUARTER 
			CALL 		play_note

			MOV		R4, LODS	
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, LODS		
			MOV		R31, SIXT 
			CALL 		play_note

			MOV		R4, LOAS
			MOV		R31, EIGHTH 
			CALL 		play_note

			MOV		R4, LOG		
			MOV		R31, HALF 
			CALL 		play_note
			
			
			MOV		R4, REST	

			MOV		R31, SIXT 

			CALL 		play_note

			ADD		R10, 1
			MOV		R11, 2
			CMP		R10, R11
			BRNE	Imp_Loop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;2nd Stanza;;;;;;;;;;;;;;;;;;;;;;;;

			MOV		R4, MIDG		
			MOV		R31, QUARTER 
			CALL 		play_note

			MOV		R4, LOG		
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, LOG		
			MOV		R31, SIXT
			CALL 		play_note
			
			MOV		R4, REST		
			MOV		R31, SIXT
			CALL 		play_note
		
			MOV		R4, LOG		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDG	
			MOV		R31, QUARTER 
			CALL 		play_note
		
			MOV		R4, MIDFS	
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, MIDFS	
			MOV		R31, SIXT 
			CALL 		play_note
		
			MOV		R4, MIDF		
			MOV		R31, SIXT 
			CALL 		play_note

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;3rd Stanza;;;;;;;;;;;;;;;;;;;;;;;			
			MOV		R4, MIDE		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDDS		
			MOV		R31, SIXT 
			CALL 		play_note
		
			MOV		R4, MIDE		
			MOV		R31, EIGHTH 
			CALL 		play_note
		
			MOV		R4, REST	
			MOV		R31, EIGHTH 
			CALL 		play_note
		
			MOV		R4, LOGS	
			MOV		R31, EIGHTH 
			CALL 		play_note
		
			MOV		R4, MIDCS		
			MOV		R31, QUARTER 
			CALL 		play_note
		
			MOV		R4, MIDC	
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, MIDC		
			MOV		R31, SIXT 
			CALL 		play_note
		
			MOV		R4, LOB		
			MOV		R31, SIXT 
			CALL 		play_note

;;;;;;;;;;;;;;;;;4th stanza;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
			MOV		R4, LOAS		
			MOV		R31, SIXT
			CALL 		play_note
		
			MOV		R4, LOA		
			MOV		R31, SIXT
			CALL 		play_note
		
			MOV		R4, LOAS		
			MOV		R31, SIXT
			CALL 		play_note
		
			MOV		R4, REST		
			MOV		R31, EIGHTH 
			CALL 		play_note
		
			MOV		R4, LODS		
			MOV		R31, EIGHTH 
			CALL 		play_note
		
			MOV		R4, LOFS		
			MOV		R31, QUARTER 
			CALL 		play_note
		
			MOV		R4, LODS	
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, LODS	
			MOV		R31, SIXT 
			CALL 		play_note
		
			MOV		R4, LOFS	
			MOV		R31, SIXT 
			CALL 		play_note

;;;;;;;;;;;;;;;;;;;;;;5th Stanza;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			MOV		R4, LOAS		
			MOV		R31, QUARTER
			CALL 		play_note
		
			MOV		R4, LOG		
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, LOG		
			MOV		R31, SIXT 
			CALL 		play_note
		
			MOV		R4, LOAS		
			MOV		R31, SIXT 
			CALL 		play_note
		
			MOV		R4, MIDD		
			MOV		R31, HALF 
			CALL 		play_note

;;;;;;;;;;;;;;;;;;;;;;;;;;;6th Stanza;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
			MOV		R4, MIDG		
			MOV		R31, QUARTER 
			CALL 		play_note

			MOV		R4, LOG		
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, LOG		
			MOV		R31, SIXT
			CALL 		play_note
			
			MOV		R4, REST		
			MOV		R31, SIXT
			CALL 		play_note
		
			MOV		R4, LOG		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDG	
			MOV		R31, QUARTER 
			CALL 		play_note
		
			MOV		R4, MIDFS	
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, MIDFS	
			MOV		R31, SIXT 
			CALL 		play_note
		
			MOV		R4, MIDF		
			MOV		R31, SIXT 
			CALL 		play_note

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;7th Stanza;;;;;;;;;;;;;;;;;;;;;;;			
			MOV		R4, MIDE		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDDS		
			MOV		R31, SIXT 
			CALL 		play_note
		
			MOV		R4, MIDE		
			MOV		R31, EIGHTH 
			CALL 		play_note
		
			MOV		R4, REST	
			MOV		R31, EIGHTH 
			CALL 		play_note
		
			MOV		R4, LOGS	
			MOV		R31, EIGHTH 
			CALL 		play_note
		
			MOV		R4, MIDCS		
			MOV		R31, QUARTER 
			CALL 		play_note
		
			MOV		R4, MIDC	
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, MIDC		
			MOV		R31, SIXT 
			CALL 		play_note
		
			MOV		R4, LOB		
			MOV		R31, SIXT				;;;;MAYBE A MESS UP 
			CALL 		play_note
		
;;;;;;;;;;;;;;;;;8th stanza;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
			MOV		R4, LOAS		
			MOV		R31, SIXT
			CALL 		play_note
		
			MOV		R4, LOA		
			MOV		R31, SIXT
			CALL 		play_note
		
			MOV		R4, LOAS		
			MOV		R31, SIXT
			CALL 		play_note
		
			MOV		R4, REST		
			MOV		R31, EIGHTH 
			CALL 		play_note
		
			MOV		R4, LODS		
			MOV		R31, EIGHTH 
			CALL 		play_note
		
			MOV		R4, LOFS		
			MOV		R31, QUARTER 
			CALL 		play_note
		
			MOV		R4, LODS	
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, LODS	
			MOV		R31, SIXT 
			CALL 		play_note
		
			MOV		R4, LOAS	
			MOV		R31, SIXT 
			CALL 		play_note

;;;;;;;;;;;;;;;;;;;;;;9th Stanza;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
			MOV		R4, LOG		
			MOV		R31, QUARTER
			CALL 		play_note
		
			MOV		R4, LODS	
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, LODS		
			MOV		R31, SIXT 
			CALL 		play_note
		
			MOV		R4, LOAS		
			MOV		R31, SIXT 
			CALL 		play_note
		
			MOV		R4, LOG		
			MOV		R31, HALF 
			CALL 		play_note	

			MOV		R4, REST	

			MOV		R31, HALF 

			CALL 		play_note
		
			BRN main

; Play Note Subroutine
; Descr: Outputs note to Speaker port, calls delay subroutine for proper time
; Parameters: 
; 	- R4: Note to be played
; Affected:
; 	- R1, R2, R3 (in delay subroutine)
play_note: 	OUT 		R4, SPEAKER_PORT 	; Output note to speaker driver
		CALL 		delay 			; delay for note duration
		RET


; Delay subroutine
; Descr: Delays for time specified by R31
; 	- R31 = 0x0E => 0.0734s delay
; 	- R31 = 0x60 => 0.503s delay
; 	- R31 = 23   => 0.120s delay => 126 bpm
; Parameters:
; 	- R31: outer for-loop count
; 	- R30: base for-loop count
; Affected:
; 	- R1, R2, R3, R31
; TODO:
; 	- Make subroutine to calculate length of 1/16 note, then make base delay be equal to that time

delay: 		MOV 		R1, R30  ;set base for loop count
outside_one: 	SUB 		R1, 0x01
              	MOV 		R2, MIDDLE_LOOP	;set middle for loop count
middle_one:   	SUB 		R2, 0x01
              	MOV 		R3, INNER_LOOP 	;set inside for loop count
inside_one:   	SUB 		R3, 0x01
		BRNE 		inside_one
              	OR 		R2, 0x00 		;load flags for middle for counter
              	BRNE 		middle_one
              	OR 		R1, 0x00           	;load flags for outsde for counter value
              	BRNE 		outside_one	; end of base delay loop	
				       	
		SUB 		R31, 0x01 	      	 
		BRNE 		delay 		; repeat the base delay loop R31 times
		
      	RET


;LED ZEPPELIN!!! -Stairway to Heaven Solo - 63 BPM


Stairway:	MOV		R30, BPM_63
			MOV		R10, 0
			MOV		R12, 0 

			
			MOV		R4, HID		; Choose note
			MOV		R31, HALF 		; Choose duration
			CALL 		play_note 		; Play note		
			
			MOV		R4, HIA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIG		
			MOV		R31, SIXT 
			CALL 		play_note

			MOV		R4, HIE		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HID		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HID		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIC		
			MOV		R31, SIXT 
			CALL 		play_note
;;;;;;;;;;;;;;;;;;;;;;;2nd stanza;;;;;;;;;;;;;
			
			MOV		R4, MIDA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDG		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDF	
			MOV		R31, HALF 
			CALL 		play_note

			MOV		R4, HIG		
			MOV		R31, EIGHTH
			CALL 		play_note

			MOV		R4, HIXC		
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, REST		
			MOV		R31, SIXT 
			CALL 		play_note

			MOV		R4, HIXC		
			MOV		R31, EIGHTH
			CALL 		play_note
			MOV		R4, REST		
			MOV		R31, SIXT 
			CALL 		play_note
;;;;;;;;;;;;;;;3rd stanza;;;;;;;;;;;;;;

			MOV		R4, HIXC		
			MOV		R31, QUARTER 
			CALL 		play_note
			MOV		R4, REST		
			MOV		R31, SIXT 
			CALL 		play_note

			MOV		R4, HIXC		
			MOV		R31, EIGHTH
			CALL 		play_note

			MOV		R4, HIA		
			MOV		R31, EIGHTH
			CALL 		play_note

			MOV		R4, HIE		
			MOV		R31, SIXT 
			CALL 		play_note

			MOV		R4, HIA		
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, HIA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXD		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
;;;;;;;;;;;;;;;;;;;;;;;4th Stanza			
			MOV		R4,  HIA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIG	
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIF	
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIG		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIA		
			MOV		R31, QUARTER 
			CALL 		play_note
			
			MOV		R4, HID		
			MOV		R31, EIGHTH 
			CALL 		play_note
			
			MOV		R4, HIA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIG	
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIE		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HID		
			MOV		R31, SIXT 
			CALL 		play_note
;;;;;;;;;;;;;;;;;;;;;5th Stanza;;;;;;;;;;;;;;;
			
			MOV		R4, HIC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HID		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDG		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDE		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDG		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDA		
			MOV		R31, EIGHTH
			CALL 		play_note
			
			MOV		R4, HIC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIC		
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, REST		
			MOV		R31, THIRS 
			CALL 		play_note
			
			MOV		R4, HIC		
			MOV		R31, EIGHTH 
			CALL 		play_note
;;;;;;;;;;;;;;6th Stanza;;;;;;;;;;;;;;;;;;;;;
			
			MOV		R4, MIDG		
			MOV		R31, EIGHTH
			CALL 		play_note
			
			MOV		R4, HIA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIG	
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIE		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HID		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HID		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDA	
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDG		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDG		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDF		
			MOV		R31, SIXT 
			CALL 		play_note
			MOV		R4, REST		
			MOV		R31, THIRS 
			CALL 		play_note
			
			MOV		R4, MIDF		
			MOV		R31, SIXT 
			CALL 		play_note
;;;;;;;;;;;;;;;;;7th Stanza;;;;;;;;;;;;;;;;;
			
			MOV		R4, MIDA		
			MOV		R31, EIGHTH 
			CALL 		play_note
			
			MOV		R4, HIC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIF		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HID		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HID		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIE		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIG	
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, REST	
			MOV		R31, THIRS 
			CALL 		play_note
			
			MOV		R4, HIG		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, EIGHTH 
			CALL 		play_note
;;;;;;;;;;;;;;;8th Stanza;;;;;;;;;;;;;;;;
			
			MOV		R4, HIXD		
			MOV		R31, EIGHTH
			CALL 		play_note
			MOV		R4, REST		
			MOV		R31, THIRS 
			CALL 		play_note
			
			MOV		R4, HIXD		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXD		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
			MOV		R4, REST		
			MOV		R31, THIRS 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXG		
			MOV		R31, EIGHTH    
			CALL 		play_note
			MOV		R4, HIXG		
			MOV		R31, SIXT 
			CALL 		play_note
			MOV		R4, REST		
			MOV		R31, THIRS 
			CALL 		play_note
			
			MOV		R4, HIXF		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXD		
			MOV		R31, SIXT 
			CALL 		play_note
			MOV		R4, REST		
			MOV		R31, THIRS
			CALL 		play_note
			
			MOV		R4, HIXD		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIA		
			MOV		R31, SIXT 
			CALL 		play_note
;;;;;;;;;;;;;;;9th Stanza;;;;;;;;;;;;;;;;;			
Zep_loop1:	MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
			MOV		R4, REST		
			MOV		R31, THIRS 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXD		
			MOV		R31, EIGHTH 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			ADD		R10, 1
			MOV		R11, 10
			CMP		R10, R11
			BRNE	Zep_loop1
;;;;;;;;;;;;;;11th & 12th Stanza;;;;;;;;;;;;;;;;;
			
			MOV		R4, HIXC	
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXG		
			MOV		R31, HALF
			CALL 		play_note
			
			MOV		R4, HIXE	
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXG		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXE		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXD		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXD		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXD		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXG		
			MOV		R31, SIXT 
			CALL 		play_note
;;;;;;;;;;;;;Stanza 13;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			
			MOV		R4, HIXD
			MOV		R31, SIXT 
			CALL 		play_note
			MOV		R4, REST		
			MOV		R31, THIRS 
			CALL 		play_note
			
			MOV		R4, HIXD		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIA		
			MOV		R31, HALF 		
			CALL 		play_note
			MOV		R4, HIA		
			MOV		R31, QUARTER 
			CALL 		play_note
			
			MOV		R4, REST		
			MOV		R31, QUARTER 
			CALL 		play_note
;;;;;;;;;;Stanza 14;;;;;;;;;;;;;;;;;;;;;;;;;
			
			MOV		R4, HIXD		
			MOV		R31, EIGHTH
			CALL 		play_note
			
			MOV		R4, HIXG		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXA		
			MOV		R31, EIGHTH 
			CALL 		play_note
			
			MOV		R4, HIXG		
			MOV		R31, EIGHTH
			CALL 		play_note
			
			MOV		R4, HIXD		
			MOV		R31, EIGHTH 
			CALL 		play_note
			
			MOV		R4, HIXC
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXD		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXC		
			MOV		R31, SIXT 
			CALL 		play_note
;;;;;;;;;;;;;;;Stanza 15, 16, 17;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			
			MOV		R4, HIXD	
			MOV		R31, WHOLE
			CALL 		play_note
			
			MOV		R4, REST		
			MOV		R31, EIGHTH 
			CALL 		play_note
			
			MOV		R4, HIA		
			MOV		R31, QUARTER 
			CALL 		play_note
			MOV		R4, HIA		
			MOV		R31, EIGHTH 
			CALL 		play_note
			MOV		R4, REST		
			MOV		R31, THIRS 
			CALL 		play_note
			
			MOV		R4, HIA		
			MOV		R31, EIGHTH
			CALL 		play_note
			MOV		R4, REST		
			MOV		R31, THIRS 
			CALL 		play_note
			
			MOV		R4, HIA	
			MOV		R31, EIGHTH 
			CALL 		play_note
			
			MOV		R4, HIG		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, REST		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIG		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIA		
			MOV		R31, WHOLE 
			CALL 		play_note
;;;;;;;;;;;;;;;;Stanza 18;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			
			MOV		R4, REST	
			MOV		R31, EIGHTH 
			CALL 		play_note
			
			MOV		R4, HIE		
			MOV		R31, QUARTER 
			CALL 		play_note
			MOV		R4, HIE		
			MOV		R31, EIGHTH 
			CALL 		play_note
			
			MOV		R4, REST		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIE		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIDS		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HID		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HID		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIC		
			MOV		R31, SIXT 
			CALL 		play_note
;;;;;;;;;;;;;;;STANZA 19;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			MOV		R4, HID		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIE		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HID		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, MIDA		
			MOV		R31, HALF 
			CALL 		play_note
			MOV		R4, MIDA		
			MOV		R31, QUARTER 
			CALL 		play_note
;;;;;;;;;;;;;;;;;;;;;;STANZA 20;;;;;;;;;;;;;;;;;;;;;;;;		
			MOV		R4, REST		
			MOV		R31, EIGHTH
			CALL 		play_note
			
			MOV		R4, HIXE		
			MOV		R31, SIXT 
			CALL 		play_note
			
Zep_Loop2:	MOV		R4, HIXXC		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXA		
			MOV		R31, SIXT 
			CALL 		play_note
			
			MOV		R4, HIXE		
			MOV		R31, SIXT 
			CALL 		play_note
			
			ADD		R12, 1
			MOV		R13, 5
			CMP		R12, R13
			BRNE	Zep_loop2
			
			MOV		R4, HIXXC		
			MOV		R31, HALF 
			CALL 		play_note
			
			BRN 	main
			
			
			
			


			




;ISR:
;IN R17, BUTTONS
;CMP BUTTONS, 0x01
;BREQ RESUME
;BRN ISR
;RESUME:
;RETIE


;.CSEG
;.ORG 0x3FF
;BRN ISR
