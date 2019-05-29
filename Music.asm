.EQU		SPEAKER_PORT = 0X69

.EQU	EIGTH = 0X01
.EQU	QUARTER = 0X02
.EQU 	HALF = 0X03
.EQU 	WHOLE = 0X04

.EQU	REST = 0X01
.EQU	LOC = 0X01
.EQU	LOC# = 0X02
.EQU	LOD = 0X03
.EQU 	LOD# = 0X04
.EQU	LOE = 0X05
.EQU	LOF = 0X06
.EQU	LOF# = 0X07
.EQU	LOG = 0X08
.EQU	LOG# = 0X09
.EQU	LOA = 0X0A
.EQU 	LOA# = 0X0B
.EQU	LOB = 0X0C
.EQU	MIDC = 0x11
.EQU	MIDC# = 0x12
.EQU	MIDD = 0x13
.EQU 	MIDD# = 0X14
.EQU	MIDE = 0X15
.EQU	MIDF = 0X16
.EQU	MIDF# = 0X17
.EQU	MIDG = 0X18
.EQU	MIDG# = 0X19
.EQU	MIDA = 0X1A
.EQU 	MIDA# = 0X1B
.EQU	MIDB = 0X1C
.EQU	HIC = 0x21
.EQU	HIC# = 0x22
.EQU	HID = 0x23
.EQU 	HID# = 0X24
.EQU	HIE = 0X25
.EQU	HIF = 0X26
.EQU	HIF# = 0X27
.EQU	HIG = 0X28
.EQU	HIG# = 0X29
.EQU	HIA = 0X2A
.EQU 	HIA# = 0X2B
.EQU	HIB = 0X2C

;Seven nation army

;The White Stripes – Seven Nation Army – 126 BPM

Seven_NA:	OUT		MIDE	;3/16
			OUT		MIDE	;1/8
			OUT		MIDG	;1/8
			OUT		MIDE	;1/16
			OUT		REST	;1/8
			OUT		MIDD	;1/8
			OUT		MIDC	;1/2
			OUT		LOB; 	;1/2
			
			BRN		Seven_NA

;Eminem – The Real Slim Shady – 105 BPM			
			
Real_Slim:	OUT		MIDC	;1/8
			OUT		MIDD#	;1/8
			OUT		MIDG	;1/8
			OUT		MIDA#	;1/8
			OUT		HIC 	;1/8
			OUT		REST	;1/4
			OUT		MIDG#	;1/8
			
			OUT		MIDG	;1/8
			OUT		REST	;1/4
			OUT		MIDG#	;1/8
			OUT		MIDG	;1/16
			OUT		MIDG#	;1/32
			OUT		MIDG	;1/32
			OUT		MIDF	;1/8
			OUT		MIDD#	;1/8
			OUT		LOB		;1/8
			
			BRN		Real_Slim
			
;Kanye West – POWER – 78 BPM

Power:		OUT		LOA#	;1/16
			OUT		MIDC	;1/16
			OUT		REST	;1/8
			OUT		REST	;1/4
			OUT		MIDG	;1/4
			OUT		MIDF	;1/4
			ADD		R0, 1
			MOV		R1, 3
			CMP		R0, R1
			BRNE	Power
			
			OUT		HIC		;1/16
			OUT		MIDG	;1/16
			OUT		MIDF	;1/16
			OUT		MIDD#	;1/16
			OUT		MIDF	;1/16
			OUT		MIDG	;1/16
			OUT		Rest	;1/8 
			OUT		MIDA#	;1/16
			OUT		MIDG	;1/16
			OUT		MIDF	;1/16
			OUT		MIDD#	;1/16
			OUT		MIDF	;1/16
			OUT		MIDD#	;1/16
			OUT		MIDC	;1/16
			OUT		LOA#	;1/16
			
			BRN		Power
				
;John Williams - The Imperial March - 104 BPM

Imp_March:	OUT		LOG		;1/4
			OUT		LOG		;1/4
			OUT		LOG		;1/4
			OUT		LOD#	;3/8 
			OUT		LOA#	;1/8
			OUT		LOG		;1/4
			OUT		LOD#	;3/16 
			OUT		LOA#	;1/8
			OUT		LOG		;1/2
			ADD		R2, 1
			MOV		R3, 2
			BRNE	Imp_March
			
Star_W:		OUT		MIDG	;1/4
			OUT		LOG		;3/16
			OUT		lOG		;1/16 
			OUT		MIDG	;1/4
			OUT		MIDF#	;3/16
			OUT		MIDF	;1/16
			
			OUT		MIDE	;1/16
			OUT		MIDD#	;1/16
			OUT		MIDE	;1/8
			OUT		REST	;1/8
			OUT		LOG#	;1/8
			OUT		LOC#	;1/4
			OUT		LOC		;3/8
			OUT		LOB		;1/16
			
			OUT		LOA#	;1/16
			OUT		LOA		;1/16
			OUT		LOA#	;1/16
			OUT		REST	;1/8
			OUT		LOD#	;1/8
			OUT		LOF#	;1/4
			OUT		LOD#	;3/16
			OUT		LOF#	;1/16
			
			OUT		LOA#	;1/4
			OUT		LOG		;3/16
			OUT		LOA#	;1/16
			OUT		MIDD	;1/2
			
			OUT		MIDG	;1/4
			OUT		LOG		;3/16
			OUT		lOG		;1/16 
			OUT		MIDG	;1/4
			OUT		MIDF#	;3/16
			OUT		MIDF	;1/16
			
			OUT		MIDE	;1/16
			OUT		MIDD#	;1/16
			OUT		MIDE	;1/8
			OUT		REST	;1/8
			OUT		LOG#	;1/8
			OUT		LOC#	;1/4
			OUT		LOC		;3/8
			OUT		LOB		;1/16
			
			OUT		LOA#	;1/16
			OUT		LOA		;1/16
			OUT		LOA#	;1/16
			OUT		REST	;1/8
			OUT		LOD#	;1/8
			OUT		LOF#	;1/4
			OUT		LOD#	;3/16
			OUT		LOA#	;1/16
			
			OUT		LOG		;1/4
			OUT		LOD#	;3/16
			OUT		LOA#	;1/16
			OUT		LOG		;1/2
			