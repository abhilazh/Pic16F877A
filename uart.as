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
# 3 "D:\pic_youtube_tutorials\uart.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "D:\pic_youtube_tutorials\uart.c"
	dw 0x3F7A ;#
	FNCALL	_main,_uart_init
	FNCALL	_main,_uart_string_transmit
	FNCALL	_main,_uart_receive
	FNCALL	_uart_string_transmit,_uart_transmit
	FNROOT	_main
	global	_RCREG
psect	text66,local,class=CODE,delta=2
global __ptext66
__ptext66:
_RCREG	set	26
	global	_RCSTA
_RCSTA	set	24
	global	_TXREG
_TXREG	set	25
	global	_RCIF
_RCIF	set	101
	global	_TXIF
_TXIF	set	100
	global	_SPBRG
_SPBRG	set	153
	global	_TXSTA
_TXSTA	set	152
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
	retlw	77	;'M'
	retlw	66	;'B'
	retlw	68	;'D'
	retlw	69	;'E'
	retlw	68	;'D'
	retlw	68	;'D'
	retlw	32	;' '
	retlw	0
psect	strings
	file	"uart.as"
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
	global	?_uart_init
?_uart_init:	; 0 bytes @ 0x0
	global	??_uart_init
??_uart_init:	; 0 bytes @ 0x0
	global	?_uart_transmit
?_uart_transmit:	; 0 bytes @ 0x0
	global	??_uart_transmit
??_uart_transmit:	; 0 bytes @ 0x0
	global	??_uart_receive
??_uart_receive:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_uart_receive
?_uart_receive:	; 1 bytes @ 0x0
	global	uart_transmit@data
uart_transmit@data:	; 1 bytes @ 0x0
	ds	1
	global	?_uart_string_transmit
?_uart_string_transmit:	; 0 bytes @ 0x1
	global	uart_string_transmit@string_length
uart_string_transmit@string_length:	; 2 bytes @ 0x1
	ds	2
	global	??_uart_string_transmit
??_uart_string_transmit:	; 0 bytes @ 0x3
	global	uart_string_transmit@string
uart_string_transmit@string:	; 1 bytes @ 0x3
	ds	1
	global	uart_string_transmit@i
uart_string_transmit@i:	; 2 bytes @ 0x4
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x6
	ds	3
;;Data sizes: Strings 9, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9       9
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; uart_string_transmit@string	PTR unsigned char  size(1) Largest target is 9
;;		 -> STR_1(CODE[9]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_uart_string_transmit
;;   _uart_string_transmit->_uart_transmit
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0      80
;;                                              6 COMMON     3     3      0
;;                          _uart_init
;;               _uart_string_transmit
;;                       _uart_receive
;; ---------------------------------------------------------------------------------
;; (1) _uart_string_transmit                                 5     3      2      75
;;                                              1 COMMON     5     3      2
;;                      _uart_transmit
;; ---------------------------------------------------------------------------------
;; (1) _uart_receive                                         1     1      0       5
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _uart_transmit                                        1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _uart_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _uart_init
;;   _uart_string_transmit
;;     _uart_transmit
;;   _uart_receive
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      9       9       1       64.3%
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
;;		line 42 in file "D:\pic_youtube_tutorials\uart.c"
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
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_uart_init
;;		_uart_string_transmit
;;		_uart_receive
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\pic_youtube_tutorials\uart.c"
	line	42
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	47
	
l1778:	
;uart.c: 47: uart_init();
	fcall	_uart_init
	line	50
	
l1780:	
;uart.c: 49: {
;uart.c: 50: uart_string_transmit("EMBDEDD ",8);
	movlw	08h
	movwf	(?_uart_string_transmit)
	clrf	(?_uart_string_transmit+1)
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_uart_string_transmit
	line	51
	
l1782:	
;uart.c: 51: _delay((unsigned long)((1000)*(16000000/4000.0)));
	opt asmopt_off
movlw  21
movwf	((??_main+0)+0+2),f
movlw	75
movwf	((??_main+0)+0+1),f
	movlw	209
movwf	((??_main+0)+0),f
u47:
	decfsz	((??_main+0)+0),f
	goto	u47
	decfsz	((??_main+0)+0+1),f
	goto	u47
	decfsz	((??_main+0)+0+2),f
	goto	u47
	clrwdt
opt asmopt_on

	line	52
	
l1784:	
;uart.c: 52: uart_receive();
	fcall	_uart_receive
	goto	l1780
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	55
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_uart_string_transmit
psect	text67,local,class=CODE,delta=2
global __ptext67
__ptext67:

;; *************** function _uart_string_transmit *****************
;; Defined at:
;;		line 20 in file "D:\pic_youtube_tutorials\uart.c"
;; Parameters:    Size  Location     Type
;;  string          1    wreg     PTR unsigned char 
;;		 -> STR_1(9), 
;;  string_lengt    2    1[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  string          1    3[COMMON] PTR unsigned char 
;;		 -> STR_1(9), 
;;  i               2    4[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_uart_transmit
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text67
	file	"D:\pic_youtube_tutorials\uart.c"
	line	20
	global	__size_of_uart_string_transmit
	__size_of_uart_string_transmit	equ	__end_of_uart_string_transmit-_uart_string_transmit
	
_uart_string_transmit:	
	opt	stack 6
; Regs used in _uart_string_transmit: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;uart_string_transmit@string stored from wreg
	movwf	(uart_string_transmit@string)
	line	21
	
l1770:	
;uart.c: 21: for(int i =0; i<string_length; i++)
	clrf	(uart_string_transmit@i)
	clrf	(uart_string_transmit@i+1)
	goto	l1776
	line	23
	
l1772:	
;uart.c: 22: {
;uart.c: 23: uart_transmit(string[i]);
	movf	(uart_string_transmit@i),w
	addwf	(uart_string_transmit@string),w
	movwf	fsr0
	fcall	stringdir
	fcall	_uart_transmit
	line	21
	
l1774:	
	incf	(uart_string_transmit@i),f
	skipnz
	incf	(uart_string_transmit@i+1),f
	
l1776:	
	movf	(uart_string_transmit@string_length+1),w
	subwf	(uart_string_transmit@i+1),w
	skipz
	goto	u35
	movf	(uart_string_transmit@string_length),w
	subwf	(uart_string_transmit@i),w
u35:
	skipc
	goto	u31
	goto	u30
u31:
	goto	l1772
u30:
	line	25
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_uart_string_transmit
	__end_of_uart_string_transmit:
;; =============== function _uart_string_transmit ends ============

	signat	_uart_string_transmit,8312
	global	_uart_receive
psect	text68,local,class=CODE,delta=2
global __ptext68
__ptext68:

;; *************** function _uart_receive *****************
;; Defined at:
;;		line 29 in file "D:\pic_youtube_tutorials\uart.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  rec_data        1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text68
	file	"D:\pic_youtube_tutorials\uart.c"
	line	29
	global	__size_of_uart_receive
	__size_of_uart_receive	equ	__end_of_uart_receive-_uart_receive
	
_uart_receive:	
	opt	stack 7
; Regs used in _uart_receive: [wreg]
	line	32
	
l1762:	
;uart.c: 31: char rec_data;
;uart.c: 32: if(RCIF ==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u21
	goto	u20
u21:
	goto	l703
u20:
	line	34
	
l1764:	
	movf	(26),w	;volatile
	line	39
	
l703:	
	return
	opt stack 0
GLOBAL	__end_of_uart_receive
	__end_of_uart_receive:
;; =============== function _uart_receive ends ============

	signat	_uart_receive,89
	global	_uart_transmit
psect	text69,local,class=CODE,delta=2
global __ptext69
__ptext69:

;; *************** function _uart_transmit *****************
;; Defined at:
;;		line 14 in file "D:\pic_youtube_tutorials\uart.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_string_transmit
;; This function uses a non-reentrant model
;;
psect	text69
	file	"D:\pic_youtube_tutorials\uart.c"
	line	14
	global	__size_of_uart_transmit
	__size_of_uart_transmit	equ	__end_of_uart_transmit-_uart_transmit
	
_uart_transmit:	
	opt	stack 6
; Regs used in _uart_transmit: [wreg]
;uart_transmit@data stored from wreg
	movwf	(uart_transmit@data)
	line	15
	
l1758:	
;uart.c: 15: while(TXIF ==0);
	
l690:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(100/8),(100)&7
	goto	u11
	goto	u10
u11:
	goto	l690
u10:
	line	16
	
l1760:	
;uart.c: 16: TXREG = data;
	movf	(uart_transmit@data),w
	movwf	(25)	;volatile
	line	17
	
l693:	
	return
	opt stack 0
GLOBAL	__end_of_uart_transmit
	__end_of_uart_transmit:
;; =============== function _uart_transmit ends ============

	signat	_uart_transmit,4216
	global	_uart_init
psect	text70,local,class=CODE,delta=2
global __ptext70
__ptext70:

;; *************** function _uart_init *****************
;; Defined at:
;;		line 6 in file "D:\pic_youtube_tutorials\uart.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text70
	file	"D:\pic_youtube_tutorials\uart.c"
	line	6
	global	__size_of_uart_init
	__size_of_uart_init	equ	__end_of_uart_init-_uart_init
	
_uart_init:	
	opt	stack 7
; Regs used in _uart_init: [wreg]
	line	7
	
l1756:	
;uart.c: 7: TXSTA = 0x24;
	movlw	(024h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(152)^080h	;volatile
	line	8
;uart.c: 8: RCSTA = 0x90;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(24)	;volatile
	line	9
;uart.c: 9: SPBRG = 103;
	movlw	(067h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(153)^080h	;volatile
	line	11
	
l687:	
	return
	opt stack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
;; =============== function _uart_init ends ============

	signat	_uart_init,88
psect	text71,local,class=CODE,delta=2
global __ptext71
__ptext71:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
