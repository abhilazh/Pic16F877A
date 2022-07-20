opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

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
# 3 "D:\pic_youtube_tutorials\uart_led1.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "D:\pic_youtube_tutorials\uart_led1.c"
	dw 0x3F7A ;#
	FNCALL	_main,_uart_init
	FNCALL	_main,_uart_transmit
	FNCALL	_main,_uart_receive
	FNROOT	_main
	global	_RCREG
psect	text95,local,class=CODE,delta=2
global __ptext95
__ptext95:
_RCREG	set	26
	global	_RCSTA
_RCSTA	set	24
	global	_TXREG
_TXREG	set	25
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RCIF
_RCIF	set	101
	global	_TXIF
_TXIF	set	100
	global	_SPBRG
_SPBRG	set	153
	global	_TXSTA
_TXSTA	set	152
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"uart_led1.as"
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
	global	uart_receive@rec_data
uart_receive@rec_data:	; 1 bytes @ 0x1
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	3
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       5
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_uart_receive
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
;; (0) _main                                                 3     3      0      20
;;                                              2 COMMON     3     3      0
;;                          _uart_init
;;                      _uart_transmit
;;                       _uart_receive
;; ---------------------------------------------------------------------------------
;; (1) _uart_receive                                         2     2      0       5
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _uart_transmit                                        1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _uart_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _uart_init
;;   _uart_transmit
;;   _uart_receive
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       5       1       35.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
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
;;		line 42 in file "D:\pic_youtube_tutorials\uart_led1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_uart_init
;;		_uart_transmit
;;		_uart_receive
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\pic_youtube_tutorials\uart_led1.c"
	line	42
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	47
	
l2636:	
;uart_led1.c: 47: uart_init();
	fcall	_uart_init
	line	48
;uart_led1.c: 48: while(1)
	
l706:	
	line	50
;uart_led1.c: 49: {
;uart_led1.c: 50: uart_transmit('a');
	movlw	(061h)
	fcall	_uart_transmit
	line	51
	
l2638:	
;uart_led1.c: 51: _delay((unsigned long)((1000)*(16000000/4000.0)));
	opt asmopt_off
movlw  21
movwf	((??_main+0)+0+2),f
movlw	75
movwf	((??_main+0)+0+1),f
	movlw	209
movwf	((??_main+0)+0),f
u2257:
	decfsz	((??_main+0)+0),f
	goto	u2257
	decfsz	((??_main+0)+0+1),f
	goto	u2257
	decfsz	((??_main+0)+0+2),f
	goto	u2257
	clrwdt
opt asmopt_on

	line	52
	
l2640:	
;uart_led1.c: 52: uart_receive();
	fcall	_uart_receive
	goto	l706
	line	53
	
l707:	
	line	48
	goto	l706
	
l708:	
	line	55
	
l709:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_uart_receive
psect	text96,local,class=CODE,delta=2
global __ptext96
__ptext96:

;; *************** function _uart_receive *****************
;; Defined at:
;;		line 29 in file "D:\pic_youtube_tutorials\uart_led1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  rec_data        1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text96
	file	"D:\pic_youtube_tutorials\uart_led1.c"
	line	29
	global	__size_of_uart_receive
	__size_of_uart_receive	equ	__end_of_uart_receive-_uart_receive
	
_uart_receive:	
	opt	stack 7
; Regs used in _uart_receive: [wreg]
	line	32
	
l1770:	
;uart_led1.c: 31: char rec_data;
;uart_led1.c: 32: if(RCIF ==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u31
	goto	u30
u31:
	goto	l703
u30:
	line	34
	
l1772:	
;uart_led1.c: 33: {
;uart_led1.c: 34: rec_data = RCREG;
	movf	(26),w	;volatile
	movwf	(??_uart_receive+0)+0
	movf	(??_uart_receive+0)+0,w
	movwf	(uart_receive@rec_data)
	goto	l703
	line	35
	
l1774:	
;uart_led1.c: 35: return rec_data;
;	Return value of _uart_receive is never used
	goto	l703
	line	36
	
l1776:	
;uart_led1.c: 36: RCIF = 0;
	bcf	(101/8),(101)&7
	goto	l703
	line	37
	
l702:	
	line	39
	
l703:	
	return
	opt stack 0
GLOBAL	__end_of_uart_receive
	__end_of_uart_receive:
;; =============== function _uart_receive ends ============

	signat	_uart_receive,89
	global	_uart_transmit
psect	text97,local,class=CODE,delta=2
global __ptext97
__ptext97:

;; *************** function _uart_transmit *****************
;; Defined at:
;;		line 14 in file "D:\pic_youtube_tutorials\uart_led1.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
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
;;		_uart_string_transmit
;; This function uses a non-reentrant model
;;
psect	text97
	file	"D:\pic_youtube_tutorials\uart_led1.c"
	line	14
	global	__size_of_uart_transmit
	__size_of_uart_transmit	equ	__end_of_uart_transmit-_uart_transmit
	
_uart_transmit:	
	opt	stack 7
; Regs used in _uart_transmit: [wreg]
;uart_transmit@data stored from wreg
	movwf	(uart_transmit@data)
	line	15
	
l1758:	
;uart_led1.c: 15: while(TXIF ==0);
	goto	l690
	
l691:	
	
l690:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(100/8),(100)&7
	goto	u11
	goto	u10
u11:
	goto	l690
u10:
	goto	l1760
	
l692:	
	line	16
	
l1760:	
;uart_led1.c: 16: TXREG = data;
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
psect	text98,local,class=CODE,delta=2
global __ptext98
__ptext98:

;; *************** function _uart_init *****************
;; Defined at:
;;		line 6 in file "D:\pic_youtube_tutorials\uart_led1.c"
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
;;		On exit  : 0/0
;;		Unchanged: 0/0
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
psect	text98
	file	"D:\pic_youtube_tutorials\uart_led1.c"
	line	6
	global	__size_of_uart_init
	__size_of_uart_init	equ	__end_of_uart_init-_uart_init
	
_uart_init:	
	opt	stack 7
; Regs used in _uart_init: [wreg]
	line	7
	
l1756:	
;uart_led1.c: 7: TXSTA = 0x24;
	movlw	(024h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(152)^080h	;volatile
	line	8
;uart_led1.c: 8: RCSTA = 0x90;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(24)	;volatile
	line	9
;uart_led1.c: 9: SPBRG = 103;
	movlw	(067h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	11
	
l687:	
	return
	opt stack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
;; =============== function _uart_init ends ============

	signat	_uart_init,88
psect	text99,local,class=CODE,delta=2
global __ptext99
__ptext99:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
