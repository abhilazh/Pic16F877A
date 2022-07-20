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
# 3 "D:\pic_youtube_tutorials\lcd.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "D:\pic_youtube_tutorials\lcd.c"
	dw 0x3F7A ;#
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_command
	FNCALL	_main,_lcd_string
	FNCALL	_lcd_init,_lcd_command
	FNCALL	_lcd_string,_lcd_data
	FNROOT	_main
	global	_PORTC
psect	text56,local,class=CODE,delta=2
global __ptext56
__ptext56:
_PORTC	set	7
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_RD2
_RD2	set	66
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
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
	retlw	69	;'E'
	retlw	109	;'m'
	retlw	98	;'b'
	retlw	101	;'e'
	retlw	100	;'d'
	retlw	100	;'d'
	retlw	101	;'e'
	retlw	100	;'d'
	retlw	0
psect	strings
	
STR_2:	
	retlw	83	;'S'
	retlw	121	;'y'
	retlw	115	;'s'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	115	;'s'
	retlw	0
psect	strings
	file	"lcd_display.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

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
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x0
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	2
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x2
	global	lcd_command@command
lcd_command@command:	; 1 bytes @ 0x2
	ds	1
	global	?_lcd_string
?_lcd_string:	; 0 bytes @ 0x3
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x3
	global	lcd_string@string_length
lcd_string@string_length:	; 1 bytes @ 0x3
	ds	1
	global	??_lcd_string
??_lcd_string:	; 0 bytes @ 0x4
	global	lcd_string@string
lcd_string@string:	; 1 bytes @ 0x4
	ds	1
	global	lcd_string@i
lcd_string@i:	; 1 bytes @ 0x5
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x6
;;Data sizes: Strings 17, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6       6
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_string@string	PTR const unsigned char  size(1) Largest target is 9
;;		 -> STR_2(CODE[8]), STR_1(CODE[9]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_string
;;   _lcd_init->_lcd_command
;;   _lcd_string->_lcd_data
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     105
;;                           _lcd_init
;;                        _lcd_command
;;                         _lcd_string
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0      15
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (1) _lcd_string                                           3     2      1      75
;;                                              3 COMMON     3     2      1
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_command                                          3     3      0      15
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _lcd_data                                             3     3      0      15
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _lcd_command
;;   _lcd_command
;;   _lcd_string
;;     _lcd_data
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      6       6       1       42.9%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 46 in file "D:\pic_youtube_tutorials\lcd.c"
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
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_init
;;		_lcd_command
;;		_lcd_string
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\pic_youtube_tutorials\lcd.c"
	line	46
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	47
	
l1782:	
;lcd.c: 47: TRISC = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(135)^080h	;volatile
	line	48
;lcd.c: 48: TRISD = 0x00;
	clrf	(136)^080h	;volatile
	line	49
	
l1784:	
;lcd.c: 49: lcd_init();
	fcall	_lcd_init
	line	52
	
l1786:	
;lcd.c: 51: {
;lcd.c: 52: lcd_command(0x83);
	movlw	(083h)
	fcall	_lcd_command
	line	53
	
l1788:	
;lcd.c: 53: lcd_string("Embedded",8);
	movlw	(08h)
	movwf	(?_lcd_string)
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_string
	line	54
	
l1790:	
;lcd.c: 54: lcd_command(0xC3);
	movlw	(0C3h)
	fcall	_lcd_command
	line	55
	
l1792:	
;lcd.c: 55: lcd_string("Systems",7);
	movlw	(07h)
	movwf	(?_lcd_string)
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_lcd_string
	goto	l1786
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	63
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_init
psect	text57,local,class=CODE,delta=2
global __ptext57
__ptext57:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 38 in file "D:\pic_youtube_tutorials\lcd.c"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text57
	file	"D:\pic_youtube_tutorials\lcd.c"
	line	38
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 6
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	39
	
l1780:	
;lcd.c: 39: lcd_command(0x38);
	movlw	(038h)
	fcall	_lcd_command
	line	40
;lcd.c: 40: lcd_command(0x06);
	movlw	(06h)
	fcall	_lcd_command
	line	41
;lcd.c: 41: lcd_command(0x0C);
	movlw	(0Ch)
	fcall	_lcd_command
	line	42
;lcd.c: 42: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	44
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_string
psect	text58,local,class=CODE,delta=2
global __ptext58
__ptext58:

;; *************** function _lcd_string *****************
;; Defined at:
;;		line 30 in file "D:\pic_youtube_tutorials\lcd.c"
;; Parameters:    Size  Location     Type
;;  string          1    wreg     PTR const unsigned char 
;;		 -> STR_2(8), STR_1(9), 
;;  string_lengt    1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  string          1    4[COMMON] PTR const unsigned char 
;;		 -> STR_2(8), STR_1(9), 
;;  i               1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text58
	file	"D:\pic_youtube_tutorials\lcd.c"
	line	30
	global	__size_of_lcd_string
	__size_of_lcd_string	equ	__end_of_lcd_string-_lcd_string
	
_lcd_string:	
	opt	stack 6
; Regs used in _lcd_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_string@string stored from wreg
	line	32
	movwf	(lcd_string@string)
	
l1772:	
;lcd.c: 31: unsigned char i;
;lcd.c: 32: for(i =0; i<string_length; i++)
	clrf	(lcd_string@i)
	goto	l1778
	line	34
	
l1774:	
;lcd.c: 33: {
;lcd.c: 34: lcd_data(string[i]);
	movf	(lcd_string@i),w
	addwf	(lcd_string@string),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	32
	
l1776:	
	incf	(lcd_string@i),f
	
l1778:	
	movf	(lcd_string@string_length),w
	subwf	(lcd_string@i),w
	skipc
	goto	u11
	goto	u10
u11:
	goto	l1774
u10:
	line	36
	
l696:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_string
	__end_of_lcd_string:
;; =============== function _lcd_string ends ============

	signat	_lcd_string,8312
	global	_lcd_command
psect	text59,local,class=CODE,delta=2
global __ptext59
__ptext59:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 20 in file "D:\pic_youtube_tutorials\lcd.c"
;; Parameters:    Size  Location     Type
;;  command         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  command         1    2[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text59
	file	"D:\pic_youtube_tutorials\lcd.c"
	line	20
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 7
; Regs used in _lcd_command: [wreg]
;lcd_command@command stored from wreg
	movwf	(lcd_command@command)
	line	21
	
l1762:	
;lcd.c: 21: PORTC = command;
	movf	(lcd_command@command),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(7)	;volatile
	line	22
	
l1764:	
;lcd.c: 22: RD0 = 0;
	bcf	(64/8),(64)&7
	line	23
	
l1766:	
;lcd.c: 23: RD1 =0;
	bcf	(65/8),(65)&7
	line	24
	
l1768:	
;lcd.c: 24: RD2 = 1;
	bsf	(66/8),(66)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((5)*(16000000/4000.0)));
	opt asmopt_off
movlw	26
movwf	((??_lcd_command+0)+0+1),f
	movlw	248
movwf	((??_lcd_command+0)+0),f
u27:
	decfsz	((??_lcd_command+0)+0),f
	goto	u27
	decfsz	((??_lcd_command+0)+0+1),f
	goto	u27
	clrwdt
opt asmopt_on

	line	26
	
l1770:	
;lcd.c: 26: RD2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	28
	
l690:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_lcd_data
psect	text60,local,class=CODE,delta=2
global __ptext60
__ptext60:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 11 in file "D:\pic_youtube_tutorials\lcd.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    2[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_string
;; This function uses a non-reentrant model
;;
psect	text60
	file	"D:\pic_youtube_tutorials\lcd.c"
	line	11
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 6
; Regs used in _lcd_data: [wreg]
;lcd_data@data stored from wreg
	movwf	(lcd_data@data)
	line	12
	
l1752:	
;lcd.c: 12: PORTC = data;
	movf	(lcd_data@data),w
	movwf	(7)	;volatile
	line	13
	
l1754:	
;lcd.c: 13: RD0 = 1;
	bsf	(64/8),(64)&7
	line	14
	
l1756:	
;lcd.c: 14: RD1 =0;
	bcf	(65/8),(65)&7
	line	15
	
l1758:	
;lcd.c: 15: RD2 = 1;
	bsf	(66/8),(66)&7
	line	16
;lcd.c: 16: _delay((unsigned long)((5)*(16000000/4000.0)));
	opt asmopt_off
movlw	26
movwf	((??_lcd_data+0)+0+1),f
	movlw	248
movwf	((??_lcd_data+0)+0),f
u37:
	decfsz	((??_lcd_data+0)+0),f
	goto	u37
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u37
	clrwdt
opt asmopt_on

	line	17
	
l1760:	
;lcd.c: 17: RD2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	18
	
l687:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
psect	text61,local,class=CODE,delta=2
global __ptext61
__ptext61:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
