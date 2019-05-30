; BPM constants
.EQU 		BPM_126 = 23

; DELAY constants
.EQU 	 	INNER_LOOP = 0xFF
.EQU 	 	MIDDLE_LOOP = 0xFF

; PORT Definitions
.EQU 	 	SPEAKER_PORT = 0x69
.EQU 	 	LOWER_SWITCHES = 0x21

; NOTE Defintions
.EQU 		SIXT 	= 0X01
.EQU 		EIGHTH 	= 0X02
.EQU 		QUARTER	= 0X04
.EQU 	 	HALF 	= 0X08
.EQU 	 	WHOLE 	= 0X10

.EQU 		REST 	= 0
.EQU 		LOC  	= 1
.EQU 		LOC# 	= 2
.EQU 		LOD  	= 3
.EQU 	 	LOD# 	= 4
.EQU 		LOE  	= 5
.EQU 		LOF  	= 6
.EQU 		LOF# 	= 7
.EQU 		LOG  	= 8
.EQU 		LOG# 	= 9
.EQU 		LOA  	= 10
.EQU 	 	LOA# 	= 11
.EQU 		LOB  	= 12
.EQU 		MIDC 	= 13
.EQU 		MIDC# 	= 14
.EQU 		MIDD  	= 15
.EQU 	 	MIDD# 	= 16
.EQU 		MIDE  	= 17
.EQU 		MIDF  	= 18
.EQU 		MIDF# 	= 19
.EQU 		MIDG  	= 20
.EQU 		MIDG# 	= 21
.EQU 		MIDA  	= 22
.EQU 	 	MIDA# 	= 23
.EQU 		MIDB  	= 24
.EQU 		HIC 	= 25
.EQU 		HIC#	= 26
.EQU 		HID 	= 27
.EQU 	 	HID#	= 28
.EQU 		HIE 	= 29
.EQU 		HIF 	= 30
.EQU 		HIF#	= 31
.EQU 		HIG 	= 32
.EQU 		HIG#	= 33
.EQU 		HIA 	= 34
.EQU 	 	HIA#	= 35
.EQU 		HIB 	= 36


; R1, R2, R3 used for delay loop
; R4 used for note selection
; R5 used for song selection
; R30 used for BPM control
; R31 used for note length selection


main: 		IN 		R5, LOWER_SWITCHES 	; Read song number from switches
		CALL 		Seven_NA 		; Will be replaced with conditional branches to select correct song 
		BRN 		main 			; Repeat indefinitely

;Seven nation army

;The White Stripes  Seven Nation Army  126 BPM

Seven_NA:	MOV 		R30, BPM_126 		; Sets base loop to .12s => 126bpm
		MOV		R4, MIDE		; Choose note
		MOV		R31, SIXT 		; Choose duration
		CALL 		play_note 		; Play note
		CALL 		play_note
		CALL 		play_note 		; (Repeated 3 times to play 3/16 note) [should we define 3/16 const?]

		MOV		R4, MIDE	
		MOV		R31, EIGHTH
		CALL 		play_note

		MOV		R4, MIDG	
		MOV		R31, EIGHTH
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


		RET



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
