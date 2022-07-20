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
# 3 "D:\pic_youtube_tutorials\keypad.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "D:\pic_youtube_tutorials\keypad.c"
	dw 0x3F7A ;#
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_command
	FNCALL	_main,_lcd_string
	FNCALL	_main,_keypad
	FNCALL	_keypad,_lcd_data
	FNCALL	_keypad,_lcd_command
	FNCALL	_lcd_init,_lcd_command
	FNCALL	_lcd_string,_lcd_data
	FNROOT	_main
	global	_PORTC
psect	text63,local,class=CODE,delta=2
global __ptext63
__ptext63:
_PORTC	set	7
	global	_RA0
_RA0	set	40
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_RD2
_RD2	set	66
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_TRISA0
_TRISA0	set	1064
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
	retlw	75	;'K'
	retlw	69	;'E'
	retlw	89	;'Y'
	retlw	80	;'P'
	retlw	65	;'A'
	retlw	68	;'D'
	retlw	58	;':'
	retlw	0
psect	strings
	file	"keypad.as"
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
	global	?_keypad
?_keypad:	; 0 bytes @ 0x0
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
	global	??_keypad
??_keypad:	; 0 bytes @ 0x3
	global	lcd_string@len
lcd_string@len:	; 1 bytes @ 0x3
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
;;Data sizes: Strings 8, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6       6
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_string@string	PTR unsigned char  size(1) Largest target is 8
;;		 -> STR_1(CODE[8]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_string
;;   _keypad->_lcd_data
;;   _keypad->_lcd_command
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
;; (0) _main                                                 0     0      0     135
;;                           _lcd_init
;;                        _lcd_command
;;                         _lcd_string
;;                             _keypad
;; ---------------------------------------------------------------------------------
;; (1) _keypad                                               0     0      0      30
;;                           _lcd_data
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0      15
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (1) _lcd_string                                           3     2      1      75
;;                                              3 COMMON     3     2      1
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (2) _lcd_command                                          3     3      0      15
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
;;   _keypad
;;     _lcd_data
;;     _lcd_command
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
;;		line 137 in file "D:\pic_youtube_tutorials\keypad.c"
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
;;		_keypad
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\pic_youtube_tutorials\keypad.c"
	line	137
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	138
	
l1862:	
;keypad.c: 138: TRISC = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(135)^080h	;volatile
	line	139
;keypad.c: 139: TRISD = 0x00;
	clrf	(136)^080h	;volatile
	line	140
	
l1864:	
;keypad.c: 140: TRISB = 0xF8;
	movlw	(0F8h)
	movwf	(134)^080h	;volatile
	line	142
	
l1866:	
;keypad.c: 142: TRISA0 = 1;
	bsf	(1064/8)^080h,(1064)&7
	line	143
	
l1868:	
;keypad.c: 143: lcd_init();
	fcall	_lcd_init
	line	144
	
l1870:	
;keypad.c: 144: lcd_command(0x80);
	movlw	(080h)
	fcall	_lcd_command
	line	145
	
l1872:	
;keypad.c: 145: lcd_string("KEYPAD:",7);
	movlw	(07h)
	movwf	(?_lcd_string)
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_string
	line	146
	
l1874:	
;keypad.c: 146: lcd_command(0xC0);
	movlw	(0C0h)
	fcall	_lcd_command
	line	150
	
l1876:	
;keypad.c: 149: {
;keypad.c: 150: keypad();
	fcall	_keypad
	goto	l1876
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	153
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_keypad
psect	text64,local,class=CODE,delta=2
global __ptext64
__ptext64:

;; *************** function _keypad *****************
;; Defined at:
;;		line 56 in file "D:\pic_youtube_tutorials\keypad.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
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
;;		_lcd_data
;;		_lcd_command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text64
	file	"D:\pic_youtube_tutorials\keypad.c"
	line	56
	global	__size_of_keypad
	__size_of_keypad	equ	__end_of_keypad-_keypad
	
_keypad:	
	opt	stack 6
; Regs used in _keypad: [wreg+status,2+status,0+pclath+cstack]
	line	57
	
l1834:	
;keypad.c: 57: RB0 =1; RB1 =0; RB2 =0;
	bsf	(48/8),(48)&7
	bcf	(49/8),(49)&7
	bcf	(50/8),(50)&7
	line	58
;keypad.c: 58: if (RB3==1)
	btfss	(51/8),(51)&7
	goto	u21
	goto	u20
u21:
	goto	l702
u20:
	line	60
	
l1836:	
;keypad.c: 59: {
;keypad.c: 60: lcd_data('1');
	movlw	(031h)
	fcall	_lcd_data
	line	61
;keypad.c: 61: while(RB3==1);
	
l703:	
	btfsc	(51/8),(51)&7
	goto	u31
	goto	u30
u31:
	goto	l703
u30:
	line	62
	
l702:	
	line	64
;keypad.c: 62: }
;keypad.c: 64: if(RB4==1)
	btfss	(52/8),(52)&7
	goto	u41
	goto	u40
u41:
	goto	l706
u40:
	line	66
	
l1838:	
;keypad.c: 65: {
;keypad.c: 66: lcd_data('4');
	movlw	(034h)
	fcall	_lcd_data
	line	67
;keypad.c: 67: while(RB4==1);
	
l707:	
	btfsc	(52/8),(52)&7
	goto	u51
	goto	u50
u51:
	goto	l707
u50:
	line	68
	
l706:	
	line	70
;keypad.c: 68: }
;keypad.c: 70: if(RB5==1)
	btfss	(53/8),(53)&7
	goto	u61
	goto	u60
u61:
	goto	l710
u60:
	line	72
	
l1840:	
;keypad.c: 71: {
;keypad.c: 72: lcd_data('7');
	movlw	(037h)
	fcall	_lcd_data
	line	73
;keypad.c: 73: while(RB5==1);
	
l711:	
	btfsc	(53/8),(53)&7
	goto	u71
	goto	u70
u71:
	goto	l711
u70:
	line	74
	
l710:	
	line	76
;keypad.c: 74: }
;keypad.c: 76: if(RB6==1)
	btfss	(54/8),(54)&7
	goto	u81
	goto	u80
u81:
	goto	l714
u80:
	line	78
	
l1842:	
;keypad.c: 77: {
;keypad.c: 78: lcd_data('*');
	movlw	(02Ah)
	fcall	_lcd_data
	line	79
;keypad.c: 79: while(RB6==1);
	
l715:	
	btfsc	(54/8),(54)&7
	goto	u91
	goto	u90
u91:
	goto	l715
u90:
	line	80
	
l714:	
	line	81
;keypad.c: 80: }
;keypad.c: 81: RB0 =0; RB1 =1;RB2 =0;
	bcf	(48/8),(48)&7
	bsf	(49/8),(49)&7
	bcf	(50/8),(50)&7
	line	82
;keypad.c: 82: if(RB3==1)
	btfss	(51/8),(51)&7
	goto	u101
	goto	u100
u101:
	goto	l718
u100:
	line	84
	
l1844:	
;keypad.c: 83: {
;keypad.c: 84: lcd_data('2');
	movlw	(032h)
	fcall	_lcd_data
	line	85
;keypad.c: 85: while(RB3==1);
	
l719:	
	btfsc	(51/8),(51)&7
	goto	u111
	goto	u110
u111:
	goto	l719
u110:
	line	86
	
l718:	
	line	88
;keypad.c: 86: }
;keypad.c: 88: if(RB4==1)
	btfss	(52/8),(52)&7
	goto	u121
	goto	u120
u121:
	goto	l722
u120:
	line	90
	
l1846:	
;keypad.c: 89: {
;keypad.c: 90: lcd_data('5');
	movlw	(035h)
	fcall	_lcd_data
	line	91
;keypad.c: 91: while(RB4==1);
	
l723:	
	btfsc	(52/8),(52)&7
	goto	u131
	goto	u130
u131:
	goto	l723
u130:
	line	92
	
l722:	
	line	94
;keypad.c: 92: }
;keypad.c: 94: if(RB5==1)
	btfss	(53/8),(53)&7
	goto	u141
	goto	u140
u141:
	goto	l726
u140:
	line	96
	
l1848:	
;keypad.c: 95: {
;keypad.c: 96: lcd_data('8');
	movlw	(038h)
	fcall	_lcd_data
	line	97
;keypad.c: 97: while(RB5==1);
	
l727:	
	btfsc	(53/8),(53)&7
	goto	u151
	goto	u150
u151:
	goto	l727
u150:
	line	98
	
l726:	
	line	100
;keypad.c: 98: }
;keypad.c: 100: if(RB6==1)
	btfss	(54/8),(54)&7
	goto	u161
	goto	u160
u161:
	goto	l730
u160:
	line	102
	
l1850:	
;keypad.c: 101: {
;keypad.c: 102: lcd_data('0');
	movlw	(030h)
	fcall	_lcd_data
	line	103
;keypad.c: 103: while(RB6==1);
	
l731:	
	btfsc	(54/8),(54)&7
	goto	u171
	goto	u170
u171:
	goto	l731
u170:
	line	104
	
l730:	
	line	106
;keypad.c: 104: }
;keypad.c: 106: RB0 =0; RB1 =0;RB2 =1;
	bcf	(48/8),(48)&7
	bcf	(49/8),(49)&7
	bsf	(50/8),(50)&7
	line	107
;keypad.c: 107: if(RB3==1)
	btfss	(51/8),(51)&7
	goto	u181
	goto	u180
u181:
	goto	l734
u180:
	line	109
	
l1852:	
;keypad.c: 108: {
;keypad.c: 109: lcd_data('3');
	movlw	(033h)
	fcall	_lcd_data
	line	110
;keypad.c: 110: while(RB3==1);
	
l735:	
	btfsc	(51/8),(51)&7
	goto	u191
	goto	u190
u191:
	goto	l735
u190:
	line	111
	
l734:	
	line	113
;keypad.c: 111: }
;keypad.c: 113: if(RB4==1)
	btfss	(52/8),(52)&7
	goto	u201
	goto	u200
u201:
	goto	l738
u200:
	line	115
	
l1854:	
;keypad.c: 114: {
;keypad.c: 115: lcd_data('6');
	movlw	(036h)
	fcall	_lcd_data
	line	116
;keypad.c: 116: while(RB4==1);
	
l739:	
	btfsc	(52/8),(52)&7
	goto	u211
	goto	u210
u211:
	goto	l739
u210:
	line	117
	
l738:	
	line	119
;keypad.c: 117: }
;keypad.c: 119: if(RB5==1)
	btfss	(53/8),(53)&7
	goto	u221
	goto	u220
u221:
	goto	l742
u220:
	line	121
	
l1856:	
;keypad.c: 120: {
;keypad.c: 121: lcd_data('9');
	movlw	(039h)
	fcall	_lcd_data
	line	122
;keypad.c: 122: while(RB5==1);
	
l743:	
	btfsc	(53/8),(53)&7
	goto	u231
	goto	u230
u231:
	goto	l743
u230:
	line	123
	
l742:	
	line	125
;keypad.c: 123: }
;keypad.c: 125: if(RB6==1)
	btfss	(54/8),(54)&7
	goto	u241
	goto	u240
u241:
	goto	l746
u240:
	line	127
	
l1858:	
;keypad.c: 126: {
;keypad.c: 127: lcd_data('#');
	movlw	(023h)
	fcall	_lcd_data
	line	128
;keypad.c: 128: while(RB6==1);
	
l747:	
	btfsc	(54/8),(54)&7
	goto	u251
	goto	u250
u251:
	goto	l747
u250:
	line	129
	
l746:	
	line	131
;keypad.c: 129: }
;keypad.c: 131: if(RA0 == 1)
	btfss	(40/8),(40)&7
	goto	u261
	goto	u260
u261:
	goto	l751
u260:
	line	133
	
l1860:	
;keypad.c: 132: {
;keypad.c: 133: lcd_command(0);
	movlw	(0)
	fcall	_lcd_command
	line	135
	
l751:	
	return
	opt stack 0
GLOBAL	__end_of_keypad
	__end_of_keypad:
;; =============== function _keypad ends ============

	signat	_keypad,88
	global	_lcd_init
psect	text65,local,class=CODE,delta=2
global __ptext65
__ptext65:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 46 in file "D:\pic_youtube_tutorials\keypad.c"
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
psect	text65
	file	"D:\pic_youtube_tutorials\keypad.c"
	line	46
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 6
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	47
	
l1832:	
;keypad.c: 47: lcd_command(0x38);
	movlw	(038h)
	fcall	_lcd_command
	line	48
;keypad.c: 48: lcd_command(0x06);
	movlw	(06h)
	fcall	_lcd_command
	line	49
;keypad.c: 49: lcd_command(0x0C);
	movlw	(0Ch)
	fcall	_lcd_command
	line	50
;keypad.c: 50: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	53
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_string
psect	text66,local,class=CODE,delta=2
global __ptext66
__ptext66:

;; *************** function _lcd_string *****************
;; Defined at:
;;		line 38 in file "D:\pic_youtube_tutorials\keypad.c"
;; Parameters:    Size  Location     Type
;;  string          1    wreg     PTR unsigned char 
;;		 -> STR_1(8), 
;;  len             1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  string          1    4[COMMON] PTR unsigned char 
;;		 -> STR_1(8), 
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
psect	text66
	file	"D:\pic_youtube_tutorials\keypad.c"
	line	38
	global	__size_of_lcd_string
	__size_of_lcd_string	equ	__end_of_lcd_string-_lcd_string
	
_lcd_string:	
	opt	stack 6
; Regs used in _lcd_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_string@string stored from wreg
	line	40
	movwf	(lcd_string@string)
	
l1824:	
;keypad.c: 39: unsigned char i;
;keypad.c: 40: for (i = 0;i<len;i++)
	clrf	(lcd_string@i)
	goto	l1830
	line	42
	
l1826:	
;keypad.c: 41: {
;keypad.c: 42: lcd_data(string[i]);
	movf	(lcd_string@i),w
	addwf	(lcd_string@string),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	line	40
	
l1828:	
	incf	(lcd_string@i),f
	
l1830:	
	movf	(lcd_string@len),w
	subwf	(lcd_string@i),w
	skipc
	goto	u11
	goto	u10
u11:
	goto	l1826
u10:
	line	44
	
l696:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_string
	__end_of_lcd_string:
;; =============== function _lcd_string ends ============

	signat	_lcd_string,8312
	global	_lcd_command
psect	text67,local,class=CODE,delta=2
global __ptext67
__ptext67:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 28 in file "D:\pic_youtube_tutorials\keypad.c"
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
;;		_keypad
;;		_main
;; This function uses a non-reentrant model
;;
psect	text67
	file	"D:\pic_youtube_tutorials\keypad.c"
	line	28
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 6
; Regs used in _lcd_command: [wreg]
;lcd_command@command stored from wreg
	movwf	(lcd_command@command)
	line	29
	
l1814:	
;keypad.c: 29: PORTC = command;
	movf	(lcd_command@command),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(7)	;volatile
	line	30
	
l1816:	
;keypad.c: 30: RD0 =0;
	bcf	(64/8),(64)&7
	line	31
	
l1818:	
;keypad.c: 31: RD1 =0;
	bcf	(65/8),(65)&7
	line	32
	
l1820:	
;keypad.c: 32: RD2 =1;
	bsf	(66/8),(66)&7
	line	33
;keypad.c: 33: _delay((unsigned long)((5)*(16000000/4000.0)));
	opt asmopt_off
movlw	26
movwf	((??_lcd_command+0)+0+1),f
	movlw	248
movwf	((??_lcd_command+0)+0),f
u277:
	decfsz	((??_lcd_command+0)+0),f
	goto	u277
	decfsz	((??_lcd_command+0)+0+1),f
	goto	u277
	clrwdt
opt asmopt_on

	line	34
	
l1822:	
;keypad.c: 34: RD2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	35
	
l690:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_lcd_data
psect	text68,local,class=CODE,delta=2
global __ptext68
__ptext68:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 18 in file "D:\pic_youtube_tutorials\keypad.c"
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
;;		_keypad
;; This function uses a non-reentrant model
;;
psect	text68
	file	"D:\pic_youtube_tutorials\keypad.c"
	line	18
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 6
; Regs used in _lcd_data: [wreg]
;lcd_data@data stored from wreg
	movwf	(lcd_data@data)
	line	19
	
l1804:	
;keypad.c: 19: PORTC = data;
	movf	(lcd_data@data),w
	movwf	(7)	;volatile
	line	20
	
l1806:	
;keypad.c: 20: RD0 = 1;
	bsf	(64/8),(64)&7
	line	21
	
l1808:	
;keypad.c: 21: RD1 =0;
	bcf	(65/8),(65)&7
	line	22
	
l1810:	
;keypad.c: 22: RD2 = 1;
	bsf	(66/8),(66)&7
	line	23
;keypad.c: 23: _delay((unsigned long)((5)*(16000000/4000.0)));
	opt asmopt_off
movlw	26
movwf	((??_lcd_data+0)+0+1),f
	movlw	248
movwf	((??_lcd_data+0)+0),f
u287:
	decfsz	((??_lcd_data+0)+0),f
	goto	u287
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u287
	clrwdt
opt asmopt_on

	line	24
	
l1812:	
;keypad.c: 24: RD2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	25
	
l687:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
psect	text69,local,class=CODE,delta=2
global __ptext69
__ptext69:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
