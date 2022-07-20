opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 3 "D:\pic_youtube_tutorials\adc_temp.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "D:\pic_youtube_tutorials\adc_temp.c"
	dw 0x3F7A ;#
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_command
	FNCALL	_main,_lcd_string_data
	FNCALL	_main,___awtoft
	FNCALL	_main,___ftdiv
	FNCALL	_main,___ftmul
	FNCALL	_main,___fttol
	FNCALL	_main,___awdiv
	FNCALL	_main,___awmod
	FNCALL	_main,_lcd_data
	FNCALL	_lcd_init,_lcd_command
	FNCALL	_lcd_string_data,_lcd_data
	FNCALL	___awtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNROOT	_main
	FNCALL	intlevel1,_adcc
	global	intlevel1
	FNROOT	intlevel1
	global	_adc1
	global	_temperature
	global	_adc
	global	_b
	global	_c
	global	_e
	global	_f
	global	_a
	global	_d
	global	_ADCON0
psect	text328,local,class=CODE,delta=2
global __ptext328
__ptext328:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTC
_PORTC	set	7
	global	_ADIF
_ADIF	set	102
	global	_GIE
_GIE	set	95
	global	_GO_nDONE
_GO_nDONE	set	250
	global	_PEIE
_PEIE	set	94
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_RD2
_RD2	set	66
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_ADIE
_ADIE	set	1126
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_1:	
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	112	;'p'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	117	;'u'
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_2:	
	retlw	100	;'d'
	retlw	101	;'e'
	retlw	103	;'g'
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	67	;'C'
	retlw	0
psect	strings
	file	"adc_temp_sensor.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_a:
       ds      2

_d:
       ds      2

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_adc1:
       ds      3

_temperature:
       ds      3

_adc:
       ds      2

_b:
       ds      2

_c:
       ds      2

_e:
       ds      2

_f:
       ds      2

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+010h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_adcc
?_adcc:	; 0 bytes @ 0x0
	global	??_adcc
??_adcc:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	4
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x4
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x4
	global	??___awtoft
??___awtoft:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	___awtoft@sign
___awtoft@sign:	; 1 bytes @ 0x4
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x4
	ds	1
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x5
	ds	1
	global	??_lcd_string_data
??_lcd_string_data:	; 0 bytes @ 0x6
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x6
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	?___fttol
?___fttol:	; 4 bytes @ 0x0
	global	lcd_data@DATA
lcd_data@DATA:	; 1 bytes @ 0x0
	global	lcd_command@COMMAND
lcd_command@COMMAND:	; 1 bytes @ 0x0
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	ds	1
	global	?_lcd_string_data
?_lcd_string_data:	; 0 bytes @ 0x1
	global	lcd_string_data@string_length
lcd_string_data@string_length:	; 1 bytes @ 0x1
	ds	1
	global	lcd_string_data@string
lcd_string_data@string:	; 1 bytes @ 0x2
	ds	1
	global	lcd_string_data@i
lcd_string_data@i:	; 1 bytes @ 0x3
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
	global	??___fttol
??___fttol:	; 0 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x5
	ds	2
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x7
	ds	1
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0x8
	global	?___awtoft
?___awtoft:	; 3 bytes @ 0x8
	global	___awtoft@c
___awtoft@c:	; 2 bytes @ 0x8
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0x8
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x8
	ds	3
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0xB
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0xB
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0xB
	ds	1
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0xC
	ds	1
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0xD
	global	?___awmod
?___awmod:	; 2 bytes @ 0xD
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0xD
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0xD
	ds	1
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0xE
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0xE
	ds	1
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0xF
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0xF
	ds	2
	global	??___ftdiv
??___ftdiv:	; 0 bytes @ 0x11
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x11
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x11
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x12
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x12
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x13
	ds	1
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0x14
	ds	1
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x15
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0x15
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x16
	ds	2
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0x18
	ds	1
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0x19
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x1A
	ds	2
;;Data sizes: Strings 22, constant 0, data 0, bss 20, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      10
;; BANK0           80     28      44
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___ftdiv	float  size(1) Largest target is 0
;;
;; ?___awtoft	float  size(1) Largest target is 0
;;
;; lcd_string_data@string	PTR unsigned char  size(1) Largest target is 13
;;		 -> STR_2(CODE[9]), STR_1(CODE[13]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_command
;;   _main->___awmod
;;   _main->_lcd_data
;;   _lcd_init->_lcd_command
;;   _lcd_string_data->_lcd_data
;;   ___ftdiv->___awtoft
;;
;; Critical Paths under _adcc in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->___ftdiv
;;   _lcd_init->_lcd_command
;;   _lcd_string_data->_lcd_data
;;   ___awtoft->___ftpack
;;   ___ftmul->___ftpack
;;   ___ftdiv->___awtoft
;;   ___awmod->___fttol
;;   ___awdiv->___fttol
;;
;; Critical Paths under _adcc in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _adcc in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _adcc in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _adcc in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0    3198
;;                                             26 BANK0      2     2      0
;;                           _lcd_init
;;                        _lcd_command
;;                    _lcd_string_data
;;                           ___awtoft
;;                            ___ftdiv
;;                            ___ftmul
;;                            ___fttol
;;                            ___awdiv
;;                            ___awmod
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0      31
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (1) _lcd_string_data                                      3     2      1     161
;;                                              1 BANK0      3     2      1
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) ___awtoft                                             4     1      3     445
;;                                              4 COMMON     1     1      0
;;                                              8 BANK0      3     0      3
;;                           ___ftpack
;; ---------------------------------------------------------------------------------
;; (1) ___ftmul                                             15     9      6     800
;;                                              8 BANK0     15     9      6
;;                           ___ftpack
;; ---------------------------------------------------------------------------------
;; (1) ___ftdiv                                             15     9      6     732
;;                                             11 BANK0     15     9      6
;;                           ___ftpack
;;                           ___awtoft (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _lcd_command                                          3     3      0      31
;;                                              4 COMMON     2     2      0
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _lcd_data                                             3     3      0      31
;;                                              4 COMMON     2     2      0
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) ___awmod                                              6     2      4     296
;;                                              4 COMMON     2     2      0
;;                                             13 BANK0      4     0      4
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___awdiv                                              8     4      4     300
;;                                             13 BANK0      8     4      4
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___fttol                                             13     9      4     371
;;                                              0 BANK0     13     9      4
;; ---------------------------------------------------------------------------------
;; (2) ___ftpack                                             8     3      5     312
;;                                              0 BANK0      8     3      5
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _adcc                                                 4     4      0       0
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _lcd_command
;;   _lcd_command
;;   _lcd_string_data
;;     _lcd_data
;;   ___awtoft
;;     ___ftpack
;;   ___ftdiv
;;     ___ftpack
;;     ___awtoft (ARG)
;;       ___ftpack
;;   ___ftmul
;;     ___ftpack
;;   ___fttol
;;   ___awdiv
;;     ___fttol (ARG)
;;   ___awmod
;;     ___fttol (ARG)
;;   _lcd_data
;;
;; _adcc (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      6       A       1       71.4%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      36       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     1C      2C       5       55.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      38      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 56 in file "D:\pic_youtube_tutorials\adc_temp.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_init
;;		_lcd_command
;;		_lcd_string_data
;;		___awtoft
;;		___ftdiv
;;		___ftmul
;;		___fttol
;;		___awdiv
;;		___awmod
;;		_lcd_data
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\pic_youtube_tutorials\adc_temp.c"
	line	56
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	57
	
l2868:	
;adc_temp.c: 57: GIE =1;
	bsf	(95/8),(95)&7
	line	58
;adc_temp.c: 58: PEIE = 1;
	bsf	(94/8),(94)&7
	line	59
;adc_temp.c: 59: ADIE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1126/8)^080h,(1126)&7
	line	61
	
l2870:	
;adc_temp.c: 61: TRISC = 0x00;
	clrf	(135)^080h	;volatile
	line	62
;adc_temp.c: 62: TRISD = 0x00;
	clrf	(136)^080h	;volatile
	line	63
	
l2872:	
;adc_temp.c: 63: lcd_init();
	fcall	_lcd_init
	line	65
	
l2874:	
;adc_temp.c: 65: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	66
	
l2876:	
;adc_temp.c: 66: lcd_string_data("Temperature:",12);
	movlw	(0Ch)
	movwf	(?_lcd_string_data)
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_string_data
	line	68
	
l2878:	
;adc_temp.c: 68: ADCON0 = 0x41;
	movlw	(041h)
	movwf	(31)	;volatile
	line	69
	
l2880:	
;adc_temp.c: 69: ADCON1 = 0x8E;
	movlw	(08Eh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	75
	
l2882:	
;adc_temp.c: 74: {
;adc_temp.c: 75: GO_nDONE =1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(250/8),(250)&7
	line	76
	
l2884:	
;adc_temp.c: 76: _delay((unsigned long)((10)*(16000000/4000.0)));
	opt asmopt_off
movlw	52
movwf	((??_main+0)+0+1),f
	movlw	241
movwf	((??_main+0)+0),f
u1187:
	decfsz	((??_main+0)+0),f
	goto	u1187
	decfsz	((??_main+0)+0+1),f
	goto	u1187
	nop2
opt asmopt_on

	line	78
	
l2886:	
;adc_temp.c: 78: adc1 = adc/2.046;
	movlw	0xf2
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftdiv)
	movlw	0x2
	movwf	(?___ftdiv+1)
	movlw	0x40
	movwf	(?___ftdiv+2)
	movf	(_adc+1),w
	movwf	(?___awtoft+1)
	movf	(_adc),w
	movwf	(?___awtoft)
	fcall	___awtoft
	movf	(0+(?___awtoft)),w
	movwf	0+(?___ftdiv)+03h
	movf	(1+(?___awtoft)),w
	movwf	1+(?___ftdiv)+03h
	movf	(2+(?___awtoft)),w
	movwf	2+(?___ftdiv)+03h
	fcall	___ftdiv
	movf	(0+(?___ftdiv)),w
	movwf	(_adc1)
	movf	(1+(?___ftdiv)),w
	movwf	(_adc1+1)
	movf	(2+(?___ftdiv)),w
	movwf	(_adc1+2)
	line	79
	
l2888:	
;adc_temp.c: 79: temperature = adc1 * 100;
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0xc8
	movwf	(?___ftmul+1)
	movlw	0x42
	movwf	(?___ftmul+2)
	movf	(_adc1),w
	movwf	0+(?___ftmul)+03h
	movf	(_adc1+1),w
	movwf	1+(?___ftmul)+03h
	movf	(_adc1+2),w
	movwf	2+(?___ftmul)+03h
	fcall	___ftmul
	movf	(0+(?___ftmul)),w
	movwf	(_temperature)
	movf	(1+(?___ftmul)),w
	movwf	(_temperature+1)
	movf	(2+(?___ftmul)),w
	movwf	(_temperature+2)
	line	80
	
l2890:	
;adc_temp.c: 80: lcd_command(0xC0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	82
	
l2892:	
;adc_temp.c: 82: a = (int) temperature/10;
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_temperature),w
	movwf	(?___fttol)
	movf	(_temperature+1),w
	movwf	(?___fttol+1)
	movf	(_temperature+2),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	1+(((0+(?___fttol)))),w
	movwf	1+(?___awdiv)+02h
	movf	0+(((0+(?___fttol)))),w
	movwf	0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(_a+1)
	movf	(0+(?___awdiv)),w
	movwf	(_a)
	line	83
	
l2894:	
;adc_temp.c: 83: b = (int) temperature %10;
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_temperature),w
	movwf	(?___fttol)
	movf	(_temperature+1),w
	movwf	(?___fttol+1)
	movf	(_temperature+2),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	1+(((0+(?___fttol)))),w
	movwf	1+(?___awmod)+02h
	movf	0+(((0+(?___fttol)))),w
	movwf	0+(?___awmod)+02h
	fcall	___awmod
	movf	(1+(?___awmod)),w
	movwf	(_b+1)
	movf	(0+(?___awmod)),w
	movwf	(_b)
	line	84
	
l2896:	
;adc_temp.c: 84: c = a%10;
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_a+1),w
	movwf	1+(?___awmod)+02h
	movf	(_a),w
	movwf	0+(?___awmod)+02h
	fcall	___awmod
	movf	(1+(?___awmod)),w
	movwf	(_c+1)
	movf	(0+(?___awmod)),w
	movwf	(_c)
	line	85
	
l2898:	
;adc_temp.c: 85: d = a/10;
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_a+1),w
	movwf	1+(?___awdiv)+02h
	movf	(_a),w
	movwf	0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(_d+1)
	movf	(0+(?___awdiv)),w
	movwf	(_d)
	line	86
	
l2900:	
;adc_temp.c: 86: e = d%10;
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_d+1),w
	movwf	1+(?___awmod)+02h
	movf	(_d),w
	movwf	0+(?___awmod)+02h
	fcall	___awmod
	movf	(1+(?___awmod)),w
	movwf	(_e+1)
	movf	(0+(?___awmod)),w
	movwf	(_e)
	line	87
	
l2902:	
;adc_temp.c: 87: f = d/10;
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_d+1),w
	movwf	1+(?___awdiv)+02h
	movf	(_d),w
	movwf	0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(_f+1)
	movf	(0+(?___awdiv)),w
	movwf	(_f)
	line	88
	
l2904:	
;adc_temp.c: 88: lcd_command(0xC0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	89
	
l2906:	
;adc_temp.c: 89: lcd_data(f+0x30);
	movf	(_f),w
	addlw	030h
	fcall	_lcd_data
	line	90
	
l2908:	
;adc_temp.c: 90: lcd_data(e+0x30);
	movf	(_e),w
	addlw	030h
	fcall	_lcd_data
	line	91
	
l2910:	
;adc_temp.c: 91: lcd_data('.');
	movlw	(02Eh)
	fcall	_lcd_data
	line	92
	
l2912:	
;adc_temp.c: 92: lcd_data(c+0x30);
	movf	(_c),w
	addlw	030h
	fcall	_lcd_data
	line	93
	
l2914:	
;adc_temp.c: 93: lcd_data(b+0x30);
	movf	(_b),w
	addlw	030h
	fcall	_lcd_data
	line	94
	
l2916:	
;adc_temp.c: 94: lcd_string_data("degree C",8);
	movlw	(08h)
	movwf	(?_lcd_string_data)
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_lcd_string_data
	goto	l2882
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	96
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_init
psect	text329,local,class=CODE,delta=2
global __ptext329
__ptext329:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 39 in file "D:\pic_youtube_tutorials\adc_temp.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text329
	file	"D:\pic_youtube_tutorials\adc_temp.c"
	line	39
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 5
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	40
	
l2866:	
;adc_temp.c: 40: lcd_command(0x38);
	movlw	(038h)
	fcall	_lcd_command
	line	41
;adc_temp.c: 41: lcd_command(0x06);
	movlw	(06h)
	fcall	_lcd_command
	line	42
;adc_temp.c: 42: lcd_command(0x0C);
	movlw	(0Ch)
	fcall	_lcd_command
	line	43
;adc_temp.c: 43: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	44
	
l717:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_string_data
psect	text330,local,class=CODE,delta=2
global __ptext330
__ptext330:

;; *************** function _lcd_string_data *****************
;; Defined at:
;;		line 22 in file "D:\pic_youtube_tutorials\adc_temp.c"
;; Parameters:    Size  Location     Type
;;  string          1    wreg     PTR unsigned char 
;;		 -> STR_2(9), STR_1(13), 
;;  string_lengt    1    1[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  string          1    2[BANK0 ] PTR unsigned char 
;;		 -> STR_2(9), STR_1(13), 
;;  i               1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text330
	file	"D:\pic_youtube_tutorials\adc_temp.c"
	line	22
	global	__size_of_lcd_string_data
	__size_of_lcd_string_data	equ	__end_of_lcd_string_data-_lcd_string_data
	
_lcd_string_data:	
	opt	stack 5
; Regs used in _lcd_string_data: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_string_data@string stored from wreg
	line	24
	movwf	(lcd_string_data@string)
	
l2858:	
;adc_temp.c: 23: unsigned char i;
;adc_temp.c: 24: for(i = 0; i<string_length; i++)
	clrf	(lcd_string_data@i)
	goto	l2864
	line	26
	
l2860:	
;adc_temp.c: 25: {
;adc_temp.c: 26: lcd_data(string[i]);
	movf	(lcd_string_data@i),w
	addwf	(lcd_string_data@string),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	24
	
l2862:	
	incf	(lcd_string_data@i),f
	
l2864:	
	movf	(lcd_string_data@string_length),w
	subwf	(lcd_string_data@i),w
	skipc
	goto	u1171
	goto	u1170
u1171:
	goto	l2860
u1170:
	line	28
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_string_data
	__end_of_lcd_string_data:
;; =============== function _lcd_string_data ends ============

	signat	_lcd_string_data,8312
	global	___awtoft
psect	text331,local,class=CODE,delta=2
global __ptext331
__ptext331:

;; *************** function ___awtoft *****************
;; Defined at:
;;		line 33 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2    8[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  3    8[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       3       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text331
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awtoft.c"
	line	33
	global	__size_of___awtoft
	__size_of___awtoft	equ	__end_of___awtoft-___awtoft
	
___awtoft:	
	opt	stack 5
; Regs used in ___awtoft: [wreg+status,2+status,0+pclath+cstack]
	line	36
	
l2846:	
	clrf	(___awtoft@sign)
	line	37
	
l2848:	
	btfss	(___awtoft@c+1),7
	goto	u1161
	goto	u1160
u1161:
	goto	l2854
u1160:
	line	38
	
l2850:	
	comf	(___awtoft@c),f
	comf	(___awtoft@c+1),f
	incf	(___awtoft@c),f
	skipnz
	incf	(___awtoft@c+1),f
	line	39
	
l2852:	
	clrf	(___awtoft@sign)
	incf	(___awtoft@sign),f
	line	41
	
l2854:	
	movf	(___awtoft@c),w
	movwf	(?___ftpack)
	movf	(___awtoft@c+1),w
	movwf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	0+(?___ftpack)+03h
	movf	(___awtoft@sign),w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___awtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___awtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___awtoft+2)
	line	42
	
l1547:	
	return
	opt stack 0
GLOBAL	__end_of___awtoft
	__end_of___awtoft:
;; =============== function ___awtoft ends ============

	signat	___awtoft,4219
	global	___ftmul
psect	text332,local,class=CODE,delta=2
global __ptext332
__ptext332:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[BANK0 ] float 
;;  f2              3   11[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   18[BANK0 ] unsigned um
;;  sign            1   22[BANK0 ] unsigned char 
;;  cntr            1   21[BANK0 ] unsigned char 
;;  exp             1   17[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3    8[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      15       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text332
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 5
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l2790:	
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(___ftmul@exp)
	movf	((___ftmul@exp)),f
	skipz
	goto	u1081
	goto	u1080
u1081:
	goto	l2796
u1080:
	line	57
	
l2792:	
	clrf	(?___ftmul)
	clrf	(?___ftmul+1)
	clrf	(?___ftmul+2)
	goto	l1509
	line	58
	
l2796:	
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(___ftmul@sign)
	movf	((___ftmul@sign)),f
	skipz
	goto	u1091
	goto	u1090
u1091:
	goto	l2802
u1090:
	line	59
	
l2798:	
	clrf	(?___ftmul)
	clrf	(?___ftmul+1)
	clrf	(?___ftmul+2)
	goto	l1509
	line	60
	
l2802:	
	movf	(___ftmul@sign),w
	addlw	07Bh
	addwf	(___ftmul@exp),f
	line	61
	
l2804:	
	movf	0+(((___ftmul@f1))+2),w
	movwf	(___ftmul@sign)
	line	62
	
l2806:	
	movf	0+(((___ftmul@f2))+2),w
	xorwf	(___ftmul@sign),f
	line	63
	
l2808:	
	movlw	(080h)
	andwf	(___ftmul@sign),f
	line	64
	
l2810:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l2812:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l2814:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l2816:	
	clrf	(___ftmul@f3_as_product)
	clrf	(___ftmul@f3_as_product+1)
	clrf	(___ftmul@f3_as_product+2)
	line	69
	
l2818:	
	movlw	(07h)
	movwf	(___ftmul@cntr)
	line	71
	
l2820:	
	btfss	(___ftmul@f1),(0)&7
	goto	u1101
	goto	u1100
u1101:
	goto	l2824
u1100:
	line	72
	
l2822:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u1111
	addwf	(___ftmul@f3_as_product+1),f
u1111:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u1112
	addwf	(___ftmul@f3_as_product+2),f
u1112:

	line	73
	
l2824:	
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	line	74
	
l2826:	
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	line	75
	
l2828:	
	decfsz	(___ftmul@cntr),f
	goto	u1121
	goto	u1120
u1121:
	goto	l2820
u1120:
	line	76
	
l2830:	
	movlw	(09h)
	movwf	(___ftmul@cntr)
	line	78
	
l2832:	
	btfss	(___ftmul@f1),(0)&7
	goto	u1131
	goto	u1130
u1131:
	goto	l2836
u1130:
	line	79
	
l2834:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u1141
	addwf	(___ftmul@f3_as_product+1),f
u1141:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u1142
	addwf	(___ftmul@f3_as_product+2),f
u1142:

	line	80
	
l2836:	
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	line	81
	
l2838:	
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	line	82
	
l2840:	
	decfsz	(___ftmul@cntr),f
	goto	u1151
	goto	u1150
u1151:
	goto	l2832
u1150:
	line	83
	
l2842:	
	movf	(___ftmul@f3_as_product),w
	movwf	(?___ftpack)
	movf	(___ftmul@f3_as_product+1),w
	movwf	(?___ftpack+1)
	movf	(___ftmul@f3_as_product+2),w
	movwf	(?___ftpack+2)
	movf	(___ftmul@exp),w
	movwf	0+(?___ftpack)+03h
	movf	(___ftmul@sign),w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	line	84
	
l1509:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	___ftdiv
psect	text333,local,class=CODE,delta=2
global __ptext333
__ptext333:

;; *************** function ___ftdiv *****************
;; Defined at:
;;		line 50 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\ftdiv.c"
;; Parameters:    Size  Location     Type
;;  f2              3   11[BANK0 ] float 
;;  f1              3   14[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3              3   21[BANK0 ] float 
;;  sign            1   25[BANK0 ] unsigned char 
;;  exp             1   24[BANK0 ] unsigned char 
;;  cntr            1   20[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   11[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      15       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text333
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\ftdiv.c"
	line	50
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
	opt	stack 5
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	55
	
l2746:	
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(___ftdiv@exp)
	movf	((___ftdiv@exp)),f
	skipz
	goto	u1041
	goto	u1040
u1041:
	goto	l2752
u1040:
	line	56
	
l2748:	
	clrf	(?___ftdiv)
	clrf	(?___ftdiv+1)
	clrf	(?___ftdiv+2)
	goto	l1499
	line	57
	
l2752:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(___ftdiv@sign)
	movf	((___ftdiv@sign)),f
	skipz
	goto	u1051
	goto	u1050
u1051:
	goto	l1500
u1050:
	line	58
	
l2754:	
	clrf	(?___ftdiv)
	clrf	(?___ftdiv+1)
	clrf	(?___ftdiv+2)
	goto	l1499
	
l1500:	
	line	59
	clrf	(___ftdiv@f3)
	clrf	(___ftdiv@f3+1)
	clrf	(___ftdiv@f3+2)
	line	60
	
l2758:	
	movlw	(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	61
	
l2760:	
	movf	0+(((___ftdiv@f1))+2),w
	movwf	(___ftdiv@sign)
	line	62
	
l2762:	
	movf	0+(((___ftdiv@f2))+2),w
	xorwf	(___ftdiv@sign),f
	line	63
	
l2764:	
	movlw	(080h)
	andwf	(___ftdiv@sign),f
	line	64
	
l2766:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	65
	
l2768:	
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	66
	
l2770:	
	bsf	(___ftdiv@f2)+(15/8),(15)&7
	line	67
	
l2772:	
	movlw	0FFh
	andwf	(___ftdiv@f2),f
	movlw	0FFh
	andwf	(___ftdiv@f2+1),f
	movlw	0
	andwf	(___ftdiv@f2+2),f
	line	68
	
l2774:	
	movlw	(018h)
	movwf	(___ftdiv@cntr)
	line	70
	
l2776:	
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	line	71
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u1065
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u1065
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u1065:
	skipc
	goto	u1061
	goto	u1060
u1061:
	goto	l2782
u1060:
	line	72
	
l2778:	
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),f
	movf	(___ftdiv@f2+1),w
	skipc
	incfsz	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),f
	movf	(___ftdiv@f2+2),w
	skipc
	incf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),f
	line	73
	
l2780:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	line	75
	
l2782:	
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	line	76
	
l2784:	
	decfsz	(___ftdiv@cntr),f
	goto	u1071
	goto	u1070
u1071:
	goto	l2776
u1070:
	line	77
	
l2786:	
	movf	(___ftdiv@f3),w
	movwf	(?___ftpack)
	movf	(___ftdiv@f3+1),w
	movwf	(?___ftpack+1)
	movf	(___ftdiv@f3+2),w
	movwf	(?___ftpack+2)
	movf	(___ftdiv@exp),w
	movwf	0+(?___ftpack)+03h
	movf	(___ftdiv@sign),w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___ftdiv)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftdiv+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftdiv+2)
	line	78
	
l1499:	
	return
	opt stack 0
GLOBAL	__end_of___ftdiv
	__end_of___ftdiv:
;; =============== function ___ftdiv ends ============

	signat	___ftdiv,8315
	global	_lcd_command
psect	text334,local,class=CODE,delta=2
global __ptext334
__ptext334:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 30 in file "D:\pic_youtube_tutorials\adc_temp.c"
;; Parameters:    Size  Location     Type
;;  COMMAND         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  COMMAND         1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       1       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text334
	file	"D:\pic_youtube_tutorials\adc_temp.c"
	line	30
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 6
; Regs used in _lcd_command: [wreg]
;lcd_command@COMMAND stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(lcd_command@COMMAND)
	line	31
	
l2736:	
;adc_temp.c: 31: PORTC = COMMAND;
	movf	(lcd_command@COMMAND),w
	movwf	(7)	;volatile
	line	32
	
l2738:	
;adc_temp.c: 32: RD0 = 0;
	bcf	(64/8),(64)&7
	line	33
	
l2740:	
;adc_temp.c: 33: RD1 =0;
	bcf	(65/8),(65)&7
	line	34
	
l2742:	
;adc_temp.c: 34: RD2 = 1;
	bsf	(66/8),(66)&7
	line	35
;adc_temp.c: 35: _delay((unsigned long)((10)*(16000000/4000.0)));
	opt asmopt_off
movlw	52
movwf	((??_lcd_command+0)+0+1),f
	movlw	241
movwf	((??_lcd_command+0)+0),f
u1197:
	decfsz	((??_lcd_command+0)+0),f
	goto	u1197
	decfsz	((??_lcd_command+0)+0+1),f
	goto	u1197
	nop2
opt asmopt_on

	line	36
	
l2744:	
;adc_temp.c: 36: RD2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	37
	
l714:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_lcd_data
psect	text335,local,class=CODE,delta=2
global __ptext335
__ptext335:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 13 in file "D:\pic_youtube_tutorials\adc_temp.c"
;; Parameters:    Size  Location     Type
;;  DATA            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  DATA            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       1       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_string_data
;;		_main
;; This function uses a non-reentrant model
;;
psect	text335
	file	"D:\pic_youtube_tutorials\adc_temp.c"
	line	13
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 6
; Regs used in _lcd_data: [wreg]
;lcd_data@DATA stored from wreg
	movwf	(lcd_data@DATA)
	line	14
	
l2726:	
;adc_temp.c: 14: PORTC = DATA;
	movf	(lcd_data@DATA),w
	movwf	(7)	;volatile
	line	15
	
l2728:	
;adc_temp.c: 15: RD0 = 1;
	bsf	(64/8),(64)&7
	line	16
	
l2730:	
;adc_temp.c: 16: RD1 = 0;
	bcf	(65/8),(65)&7
	line	17
	
l2732:	
;adc_temp.c: 17: RD2 = 1;
	bsf	(66/8),(66)&7
	line	18
;adc_temp.c: 18: _delay((unsigned long)((10)*(16000000/4000.0)));
	opt asmopt_off
movlw	52
movwf	((??_lcd_data+0)+0+1),f
	movlw	241
movwf	((??_lcd_data+0)+0),f
u1207:
	decfsz	((??_lcd_data+0)+0),f
	goto	u1207
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u1207
	nop2
opt asmopt_on

	line	19
	
l2734:	
;adc_temp.c: 19: RD2 =0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	20
	
l705:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	___awmod
psect	text336,local,class=CODE,delta=2
global __ptext336
__ptext336:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2   13[BANK0 ] int 
;;  dividend        2   15[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    5[COMMON] unsigned char 
;;  counter         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   13[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       4       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text336
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l2410:	
	clrf	(___awmod@sign)
	line	9
	
l2412:	
	btfss	(___awmod@dividend+1),7
	goto	u681
	goto	u680
u681:
	goto	l2418
u680:
	line	10
	
l2414:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	
l2416:	
	clrf	(___awmod@sign)
	incf	(___awmod@sign),f
	line	13
	
l2418:	
	btfss	(___awmod@divisor+1),7
	goto	u691
	goto	u690
u691:
	goto	l2422
u690:
	line	14
	
l2420:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	line	15
	
l2422:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u701
	goto	u700
u701:
	goto	l2438
u700:
	line	16
	
l2424:	
	clrf	(___awmod@counter)
	incf	(___awmod@counter),f
	line	17
	goto	l2428
	line	18
	
l2426:	
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	line	19
	incf	(___awmod@counter),f
	line	17
	
l2428:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u711
	goto	u710
u711:
	goto	l2426
u710:
	line	22
	
l2430:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u725
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u725:
	skipc
	goto	u721
	goto	u720
u721:
	goto	l2434
u720:
	line	23
	
l2432:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	line	24
	
l2434:	
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	line	25
	
l2436:	
	decfsz	(___awmod@counter),f
	goto	u731
	goto	u730
u731:
	goto	l2430
u730:
	line	27
	
l2438:	
	movf	(___awmod@sign),w
	skipz
	goto	u740
	goto	l2442
u740:
	line	28
	
l2440:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	29
	
l2442:	
	movf	(___awmod@dividend+1),w
	movwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	movwf	(?___awmod)
	line	30
	
l1628:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text337,local,class=CODE,delta=2
global __ptext337
__ptext337:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2   13[BANK0 ] int 
;;  dividend        2   15[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   19[BANK0 ] int 
;;  sign            1   18[BANK0 ] unsigned char 
;;  counter         1   17[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   13[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text337
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l2366:	
	clrf	(___awdiv@sign)
	line	10
	
l2368:	
	btfss	(___awdiv@divisor+1),7
	goto	u611
	goto	u610
u611:
	goto	l2374
u610:
	line	11
	
l2370:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	
l2372:	
	clrf	(___awdiv@sign)
	incf	(___awdiv@sign),f
	line	14
	
l2374:	
	btfss	(___awdiv@dividend+1),7
	goto	u621
	goto	u620
u621:
	goto	l2380
u620:
	line	15
	
l2376:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l2378:	
	movlw	(01h)
	xorwf	(___awdiv@sign),f
	line	18
	
l2380:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l2382:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u631
	goto	u630
u631:
	goto	l2402
u630:
	line	20
	
l2384:	
	clrf	(___awdiv@counter)
	incf	(___awdiv@counter),f
	line	21
	goto	l2388
	line	22
	
l2386:	
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	line	23
	incf	(___awdiv@counter),f
	line	21
	
l2388:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u641
	goto	u640
u641:
	goto	l2386
u640:
	line	26
	
l2390:	
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	line	27
	
l2392:	
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u655
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u655:
	skipc
	goto	u651
	goto	u650
u651:
	goto	l2398
u650:
	line	28
	
l2394:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l2396:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	31
	
l2398:	
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	line	32
	
l2400:	
	decfsz	(___awdiv@counter),f
	goto	u661
	goto	u660
u661:
	goto	l2390
u660:
	line	34
	
l2402:	
	movf	(___awdiv@sign),w
	skipz
	goto	u670
	goto	l2406
u670:
	line	35
	
l2404:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	line	36
	
l2406:	
	movf	(___awdiv@quotient+1),w
	movwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	movwf	(?___awdiv)
	line	37
	
l1560:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___fttol
psect	text338,local,class=CODE,delta=2
global __ptext338
__ptext338:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3    0[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  lval            4    8[BANK0 ] unsigned long 
;;  exp1            1   12[BANK0 ] unsigned char 
;;  sign1           1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text338
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 6
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l2688:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(___fttol@exp1)
	movf	((___fttol@exp1)),f
	skipz
	goto	u961
	goto	u960
u961:
	goto	l2692
u960:
	line	50
	
l2690:	
	clrf	(?___fttol)
	clrf	(?___fttol+1)
	clrf	(?___fttol+2)
	clrf	(?___fttol+3)
	goto	l1520
	line	51
	
l2692:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u975:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u970:
	addlw	-1
	skipz
	goto	u975
	movf	0+(??___fttol+0)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l2694:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l2696:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l2698:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l2700:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l2702:	
	btfss	(___fttol@exp1),7
	goto	u981
	goto	u980
u981:
	goto	l2712
u980:
	line	57
	
l2704:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u991
	goto	u990
u991:
	goto	l2708
u990:
	goto	l2690
	line	60
	
l2708:	
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	line	61
	
l2710:	
	incfsz	(___fttol@exp1),f
	goto	u1001
	goto	u1000
u1001:
	goto	l2708
u1000:
	goto	l2718
	line	63
	
l2712:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u1011
	goto	u1010
u1011:
	goto	l1527
u1010:
	goto	l2690
	line	66
	
l2716:	
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	line	67
	decf	(___fttol@exp1),f
	line	68
	
l1527:	
	line	65
	movf	(___fttol@exp1),f
	skipz
	goto	u1021
	goto	u1020
u1021:
	goto	l2716
u1020:
	line	70
	
l2718:	
	movf	(___fttol@sign1),w
	skipz
	goto	u1030
	goto	l2722
u1030:
	line	71
	
l2720:	
	comf	(___fttol@lval),f
	comf	(___fttol@lval+1),f
	comf	(___fttol@lval+2),f
	comf	(___fttol@lval+3),f
	incf	(___fttol@lval),f
	skipnz
	incf	(___fttol@lval+1),f
	skipnz
	incf	(___fttol@lval+2),f
	skipnz
	incf	(___fttol@lval+3),f
	line	72
	
l2722:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	line	73
	
l1520:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text339,local,class=CODE,delta=2
global __ptext339
__ptext339:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    0[BANK0 ] unsigned um
;;  exp             1    3[BANK0 ] unsigned char 
;;  sign            1    4[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       5       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftdiv
;;		___ftmul
;;		___awtoft
;; This function uses a non-reentrant model
;;
psect	text339
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 5
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l2660:	
	movf	(___ftpack@exp),w
	skipz
	goto	u890
	goto	l2664
u890:
	
l2662:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u901
	goto	u900
u901:
	goto	l2670
u900:
	line	65
	
l2664:	
	clrf	(?___ftpack)
	clrf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	goto	l1745
	line	67
	
l2668:	
	incf	(___ftpack@exp),f
	line	68
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	line	66
	
l2670:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u911
	goto	u910
u911:
	goto	l2668
u910:
	goto	l2674
	line	71
	
l2672:	
	incf	(___ftpack@exp),f
	line	72
	incf	(___ftpack@arg),f
	skipnz
	incf	(___ftpack@arg+1),f
	skipnz
	incf	(___ftpack@arg+2),f
	line	73
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	line	70
	
l2674:	
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u921
	goto	u920
u921:
	goto	l2672
u920:
	goto	l2678
	line	76
	
l2676:	
	decf	(___ftpack@exp),f
	line	77
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	line	75
	
l2678:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u931
	goto	u930
u931:
	goto	l2676
u930:
	
l1754:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u941
	goto	u940
u941:
	goto	l1755
u940:
	line	80
	
l2680:	
	bcf	(___ftpack@arg)+(15/8),(15)&7
	
l1755:	
	line	81
	clrc
	rrf	(___ftpack@exp),f
	line	82
	
l2682:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0+2)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+0)
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l2684:	
	movf	(___ftpack@sign),w
	skipz
	goto	u950
	goto	l1756
u950:
	line	84
	
l2686:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l1756:	
	line	85
	line	86
	
l1745:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	_adcc
psect	text340,local,class=CODE,delta=2
global __ptext340
__ptext340:

;; *************** function _adcc *****************
;; Defined at:
;;		line 46 in file "D:\pic_youtube_tutorials\adc_temp.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text340
	file	"D:\pic_youtube_tutorials\adc_temp.c"
	line	46
	global	__size_of_adcc
	__size_of_adcc	equ	__end_of_adcc-_adcc
	
_adcc:	
	opt	stack 5
; Regs used in _adcc: [wreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_adcc+2)
	movf	pclath,w
	movwf	(??_adcc+3)
	ljmp	_adcc
psect	text340
	line	47
	
i1l2294:	
;adc_temp.c: 47: if (ADIF == 1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(102/8),(102)&7
	goto	u45_21
	goto	u45_20
u45_21:
	goto	i1l721
u45_20:
	line	49
	
i1l2296:	
;adc_temp.c: 48: {
;adc_temp.c: 49: _delay((unsigned long)((10)*(16000000/4000.0)));
	opt asmopt_off
movlw	52
movwf	((??_adcc+0)+0+1),f
	movlw	241
movwf	((??_adcc+0)+0),f
u121_27:
	decfsz	((??_adcc+0)+0),f
	goto	u121_27
	decfsz	((??_adcc+0)+0+1),f
	goto	u121_27
	nop2
opt asmopt_on

	line	50
;adc_temp.c: 50: adc = (ADRESH<<8);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(30),w	;volatile
	movwf	(_adc+1)
	clrf	(_adc)
	line	51
;adc_temp.c: 51: adc = adc + ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	addwf	(_adc),f
	skipnc
	incf	(_adc+1),f
	line	52
	
i1l2298:	
;adc_temp.c: 52: ADIF = 0;
	bcf	(102/8),(102)&7
	line	54
	
i1l721:	
	movf	(??_adcc+3),w
	movwf	pclath
	swapf	(??_adcc+2)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_adcc
	__end_of_adcc:
;; =============== function _adcc ends ============

	signat	_adcc,88
psect	text341,local,class=CODE,delta=2
global __ptext341
__ptext341:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
