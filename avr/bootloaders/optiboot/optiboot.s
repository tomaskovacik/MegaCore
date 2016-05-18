	.file	"optiboot.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
.global	putch
	.type	putch, @function
putch:
.LFB2:
	.file 1 "optiboot.c"
	.loc 1 684 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL0:
.L3:
	.loc 1 686 0 discriminator 1
	sbis 0xb,5
	rjmp .L3
	.loc 1 687 0
	out 0xc,r24
	ret
	.cfi_endproc
.LFE2:
	.size	putch, .-putch
.global	getch
	.type	getch, @function
getch:
.LFB3:
	.loc 1 714 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L7:
	.loc 1 751 0 discriminator 1
	sbis 0xb,7
	rjmp .L7
	.loc 1 753 0
	sbic 0xb,4
	rjmp .L8
.LBB6:
.LBB7:
	.loc 1 830 0
/* #APP */
 ;  830 "optiboot.c" 1
	wdr

 ;  0 "" 2
/* #NOAPP */
.L8:
.LBE7:
.LBE6:
	.loc 1 765 0
	in r24,0xc
.LVL1:
	.loc 1 777 0
	ret
	.cfi_endproc
.LFE3:
	.size	getch, .-getch
.global	watchdogConfig
	.type	watchdogConfig, @function
watchdogConfig:
.LFB8:
	.loc 1 835 0
	.cfi_startproc
.LVL2:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 836 0
	ldi r25,lo8(24)
	out 0x21,r25
	.loc 1 837 0
	out 0x21,r24
	ret
	.cfi_endproc
.LFE8:
	.size	watchdogConfig, .-watchdogConfig
.global	verifySpace
	.type	verifySpace, @function
verifySpace:
.LFB5:
	.loc 1 803 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 804 0
	call getch
.LVL3:
	cpi r24,lo8(32)
	breq .L11
	.loc 1 805 0
	ldi r24,lo8(8)
	call watchdogConfig
.LVL4:
.L12:
	rjmp .L12
.L11:
	.loc 1 809 0
	ldi r24,lo8(20)
	jmp putch
.LVL5:
	.cfi_endproc
.LFE5:
	.size	verifySpace, .-verifySpace
	.type	getNch, @function
getNch:
.LFB4:
	.loc 1 798 0
	.cfi_startproc
.LVL6:
	push r28
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
.LVL7:
.L15:
	.loc 1 799 0 discriminator 1
	call getch
.LVL8:
	subi r28,lo8(-(-1))
.LVL9:
	brne .L15
/* epilogue start */
	.loc 1 801 0
	pop r28
.LVL10:
	.loc 1 800 0
	jmp verifySpace
.LVL11:
	.cfi_endproc
.LFE4:
	.size	getNch, .-getNch
.global	appStart
	.type	appStart, @function
appStart:
.LFB9:
	.loc 1 840 0
	.cfi_startproc
.LVL12:
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 844 0
/* #APP */
 ;  844 "optiboot.c" 1
	mov r2, r24

 ;  0 "" 2
	.loc 1 846 0
/* #NOAPP */
	ldi r24,0
.LVL13:
	call watchdogConfig
.LVL14:
	.loc 1 849 0
/* #APP */
 ;  849 "optiboot.c" 1
	ldi r30,0
clr r31
ijmp

 ;  0 "" 2
/* epilogue start */
	.loc 1 855 0
/* #NOAPP */
	.cfi_endproc
.LFE9:
	.size	appStart, .-appStart
	.section	.init9,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB1:
	.loc 1 444 0
	.cfi_startproc
	push __zero_reg__
.LCFI1:
	.cfi_def_cfa_offset 3
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI2:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 1 */
/* stack size = 1 */
.L__stack_usage = 1
.LVL15:
	.loc 1 465 0
/* #APP */
 ;  465 "optiboot.c" 1
	clr __zero_reg__
 ;  0 "" 2
	.loc 1 467 0
/* #NOAPP */
	ldi r24,lo8(-1)
	ldi r25,lo8(16)
	out __SP_L__+1,r25
	out __SP_L__,r24
	.loc 1 477 0
	in r24,0x34
.LVL16:
	.loc 1 478 0
	out 0x34,__zero_reg__
	.loc 1 483 0
	mov r25,r24
	andi r25,lo8(13)
	breq .L18
	.loc 1 484 0
	call appStart
.LVL17:
.L18:
	.loc 1 488 0
	ldi r24,lo8(5)
	out 0x2e,r24
	.loc 1 498 0
	ldi r24,lo8(2)
	out 0xb,r24
	.loc 1 499 0
	ldi r24,lo8(24)
	out 0xa,r24
	.loc 1 500 0
	ldi r24,lo8(6)
	sts 149,r24
	.loc 1 501 0
	ldi r24,lo8(12)
	out 0x9,r24
	.loc 1 506 0
	ldi r24,lo8(14)
	call watchdogConfig
.LVL18:
	.loc 1 510 0
	sbi 0x17,5
.LVL19:
	ldi r18,lo8(4)
.LBB22:
.LBB23:
	.loc 1 815 0
	ldi r24,lo8(-61)
	ldi r25,lo8(-1)
	.loc 1 816 0
	ldi r21,lo8(4)
	.loc 1 819 0
	ldi r20,lo8(32)
.LVL20:
.L22:
	.loc 1 815 0
	out 0x2c+1,r25
	out 0x2c,r24
	.loc 1 816 0
	out 0x36,r21
.L20:
	.loc 1 817 0
	in __tmp_reg__,0x36
	sbrs __tmp_reg__,2
	rjmp .L20
	.loc 1 819 0
	in r19,0x18
	eor r19,r20
	out 0x18,r19
.LBB24:
.LBB25:
	.loc 1 830 0
/* #APP */
 ;  830 "optiboot.c" 1
	wdr

 ;  0 "" 2
.LVL21:
/* #NOAPP */
	subi r18,lo8(-(-1))
.LVL22:
.LBE25:
.LBE24:
	.loc 1 824 0
	brne .L22
	mov r4,__zero_reg__
	mov r5,__zero_reg__
.LBE23:
.LBE22:
.LBB26:
.LBB27:
.LBB28:
.LBB29:
	.loc 1 897 0
	ldi r20,lo8(3)
	mov r13,r20
.LBB30:
	.loc 1 911 0
	clr r12
	inc r12
.LBE30:
	.loc 1 922 0
	ldi r21,lo8(5)
	mov r11,r21
	.loc 1 930 0
	ldi r22,lo8(17)
	mov r10,r22
.LVL23:
.L51:
.LBE29:
.LBE28:
.LBE27:
.LBE26:
	.loc 1 526 0
	call getch
.LVL24:
	.loc 1 528 0
	cpi r24,lo8(65)
	brne .L23
.LBB35:
	.loc 1 529 0
	call getch
.LVL25:
	.loc 1 530 0
	std Y+1,r24
	call verifySpace
.LVL26:
	.loc 1 535 0
	ldd r24,Y+1
	cpi r24,lo8(-126)
	brne .+2
	rjmp .L65
	.loc 1 537 0
	cpi r24,lo8(-127)
	brne .L26
	.loc 1 538 0
	ldi r24,lo8(6)
	rjmp .L63
.L26:
	.loc 1 544 0
	ldi r24,lo8(3)
.L63:
	call putch
.LVL27:
	rjmp .L25
.LVL28:
.L23:
.LBE35:
	.loc 1 547 0
	cpi r24,lo8(66)
	brne .L27
	.loc 1 549 0
	ldi r24,lo8(20)
.LVL29:
	rjmp .L64
.LVL30:
.L27:
	.loc 1 551 0
	cpi r24,lo8(69)
	brne .L28
	.loc 1 553 0
	ldi r24,lo8(5)
.LVL31:
.L64:
	call getNch
.LVL32:
	rjmp .L25
.LVL33:
.L28:
	.loc 1 555 0
	cpi r24,lo8(85)
	brne .L29
.LBB36:
	.loc 1 558 0
	call getch
.LVL34:
	mov r4,r24
.LVL35:
	.loc 1 559 0
	call getch
.LVL36:
	mov r5,__zero_reg__
	or r5,r24
.LVL37:
	.loc 1 564 0
	lsl r4
	rol r5
.LVL38:
	rjmp .L50
.LVL39:
.L29:
.LBE36:
	.loc 1 568 0
	cpi r24,lo8(86)
	brne .L30
	.loc 1 570 0
	ldi r24,lo8(4)
.LVL40:
	call getNch
.LVL41:
	.loc 1 571 0
	ldi r24,0
	rjmp .L63
.LVL42:
.L30:
	.loc 1 574 0
	cpi r24,lo8(100)
	breq .+2
	rjmp .L31
.LBB37:
	.loc 1 580 0
	call getch
.LVL43:
	mov r16,r24
	ldi r17,0
	mov r17,r16
	clr r16
.LVL44:
	call getch
.LVL45:
	or r16,r24
.LVL46:
	.loc 1 582 0
	call getch
.LVL47:
	mov r7,r24
.LVL48:
	.loc 1 580 0
	movw r14,r16
	.loc 1 582 0
	mov r8,__zero_reg__
	clr r9
	inc r9
.LVL49:
.L33:
	.loc 1 586 0 discriminator 1
	call getch
.LVL50:
	movw r30,r8
	st Z+,r24
.LVL51:
	movw r8,r30
	.loc 1 587 0 discriminator 1
	ldi r31,1
	sub r14,r31
	sbc r15,__zero_reg__
.LVL52:
	cp r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .L33
	.loc 1 590 0
	call verifySpace
.LVL53:
.LBB34:
.LBB33:
	.loc 1 863 0
	ldi r24,lo8(69)
	cpse r7,r24
	rjmp .L61
	movw r8,r16
.LVL54:
	add r8,r4
	adc r9,r5
	movw r14,r4
.LVL55:
	ldi r16,0
	ldi r17,lo8(1)
.LVL56:
.L36:
	.loc 1 866 0
	cp r14,r8
	cpc r15,r9
	brne .+2
	rjmp .L25
.LVL57:
	.loc 1 867 0
	movw r30,r16
	ld r22,Z+
.LVL58:
	movw r16,r30
.LVL59:
	movw r24,r14
	call __eewr_byte_m64
.LVL60:
	ldi r31,-1
	sub r14,r31
	sbc r15,r31
	rjmp .L36
.LVL61:
.L61:
.LBB32:
	.loc 1 897 0
	movw r30,r4
/* #APP */
 ;  897 "optiboot.c" 1
	sts 104, r13
	spm
	
 ;  0 "" 2
/* #NOAPP */
.L39:
	.loc 1 901 0
	lds r24,104
	sbrc r24,0
	rjmp .L39
	ldi r18,0
	ldi r19,0
.LVL62:
.L41:
	movw r30,r18
	inc r31
.LVL63:
.LBB31:
	.loc 1 908 0
	ld r24,Z
.LVL64:
	movw r30,r18
	add r30,r4
	adc r31,r5
.LVL65:
	movw r26,r18
	subi r26,-1
	sbci r27,-2
.LVL66:
	.loc 1 909 0
	ld r20,X
	ldi r25,0
	or r25,r20
	.loc 1 911 0
/* #APP */
 ;  911 "optiboot.c" 1
	movw  r0, r24
	sts 104, r12
	spm
	clr  r1
	
 ;  0 "" 2
.LVL67:
/* #NOAPP */
	subi r18,-2
	sbci r19,-1
.LVL68:
.LBE31:
	.loc 1 916 0
	cp r16,r18
	cpc r17,r19
	brne .L41
	.loc 1 922 0
	movw r30,r4
/* #APP */
 ;  922 "optiboot.c" 1
	sts 104, r11
	spm
	
 ;  0 "" 2
.LVL69:
/* #NOAPP */
.L43:
	.loc 1 926 0
	lds r24,104
	sbrc r24,0
	rjmp .L43
	.loc 1 930 0
/* #APP */
 ;  930 "optiboot.c" 1
	sts 104, r10
	spm
	
 ;  0 "" 2
/* #NOAPP */
	rjmp .L25
.LVL70:
.L31:
.LBE32:
.LBE33:
.LBE34:
.LBE37:
	.loc 1 652 0
	cpi r24,lo8(116)
	brne .L44
.LBB38:
	.loc 1 654 0
	call getch
.LVL71:
	mov r16,r24
	ldi r17,0
	mov r17,r16
	clr r16
.LVL72:
	call getch
.LVL73:
	or r16,r24
.LVL74:
	.loc 1 656 0
	call getch
.LVL75:
	.loc 1 658 0
	std Y+1,r24
	call verifySpace
.LVL76:
.LBB39:
.LBB40:
	.loc 1 944 0
	ldd r24,Y+1
	movw r14,r4
	cpi r24,lo8(69)
	brne .L48
.LVL77:
.L47:
	.loc 1 949 0
	movw r24,r14
	call __eerd_byte_m64
.LVL78:
	call putch
.LVL79:
	.loc 1 950 0
	subi r16,1
	sbc r17,__zero_reg__
.LVL80:
	ldi r31,-1
	sub r14,r31
	sbc r15,r31
.LVL81:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	brne .L47
	rjmp .L25
.LVL82:
.L48:
	.loc 1 974 0
	movw r30,r14
/* #APP */
 ;  972 "optiboot.c" 1
	lpm r24,Z+

 ;  0 "" 2
/* #NOAPP */
	movw r14,r30
	call putch
.LVL83:
	.loc 1 975 0
	subi r16,1
	sbc r17,__zero_reg__
.LVL84:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	brne .L48
	rjmp .L25
.LVL85:
.L44:
.LBE40:
.LBE39:
.LBE38:
	.loc 1 664 0
	cpi r24,lo8(117)
	brne .L49
	.loc 1 666 0
	call verifySpace
.LVL86:
	.loc 1 667 0
	ldi r24,lo8(30)
	call putch
.LVL87:
	.loc 1 668 0
	ldi r24,lo8(-106)
	call putch
.LVL88:
.L65:
	.loc 1 669 0
	ldi r24,lo8(2)
	rjmp .L63
.LVL89:
.L49:
	.loc 1 671 0
	cpi r24,lo8(81)
	brne .L50
	.loc 1 673 0
	ldi r24,lo8(8)
.LVL90:
	call watchdogConfig
.LVL91:
.L50:
	.loc 1 678 0
	call verifySpace
.LVL92:
.L25:
	.loc 1 680 0
	ldi r24,lo8(16)
	call putch
.LVL93:
	.loc 1 681 0
	rjmp .L51
	.cfi_endproc
.LFE1:
	.size	main, .-main
.global	optiboot_version
	.section	.version,"a",@progbits
	.type	optiboot_version, @object
	.size	optiboot_version, 2
optiboot_version:
	.word	1538
	.text
.Letext0:
	.file 2 "/usr/local/CrossPack-AVR-20131216/avr/include/stdint.h"
	.file 3 "/usr/local/CrossPack-AVR-20131216/avr/include/avr/eeprom.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x604
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF32
	.byte	0x1
	.long	.LASF33
	.long	.LASF34
	.long	.Ldebug_ranges0+0x60
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x2
	.byte	0x79
	.long	0x34
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x2
	.long	.LASF1
	.byte	0x2
	.byte	0x7a
	.long	0x46
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.long	.LASF4
	.byte	0x2
	.byte	0x7c
	.long	0x5f
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.long	.LASF6
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x5
	.long	.LASF10
	.byte	0x1
	.word	0x152
	.long	0x54
	.uleb128 0x6
	.long	.LASF16
	.byte	0x1
	.word	0x35c
	.byte	0x1
	.byte	0x3
	.long	0xf3
	.uleb128 0x7
	.long	.LASF11
	.byte	0x1
	.word	0x35c
	.long	0x29
	.uleb128 0x7
	.long	.LASF12
	.byte	0x1
	.word	0x35c
	.long	0xf3
	.uleb128 0x7
	.long	.LASF13
	.byte	0x1
	.word	0x35d
	.long	0x54
	.uleb128 0x8
	.string	"len"
	.byte	0x1
	.word	0x35d
	.long	0x82
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF14
	.byte	0x1
	.word	0x377
	.long	0xf3
	.uleb128 0xa
	.long	.LASF15
	.byte	0x1
	.word	0x378
	.long	0x54
	.uleb128 0x9
	.uleb128 0xb
	.string	"a"
	.byte	0x1
	.word	0x38b
	.long	0x54
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x2
	.long	0x3b
	.uleb128 0x6
	.long	.LASF17
	.byte	0x1
	.word	0x32d
	.byte	0x1
	.byte	0x3
	.long	0x114
	.uleb128 0x7
	.long	.LASF18
	.byte	0x1
	.word	0x32d
	.long	0x3b
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.long	.LASF20
	.byte	0x1
	.word	0x2ac
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x13d
	.uleb128 0xe
	.string	"ch"
	.byte	0x1
	.word	0x2ac
	.long	0x13d
	.byte	0x1
	.byte	0x68
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF19
	.uleb128 0xf
	.long	.LASF35
	.byte	0x1
	.word	0x33d
	.byte	0x3
	.uleb128 0x10
	.byte	0x1
	.long	.LASF26
	.byte	0x1
	.word	0x2ca
	.byte	0x1
	.long	0x3b
	.long	.LFB3
	.long	.LFE3
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x18a
	.uleb128 0x11
	.string	"ch"
	.byte	0x1
	.word	0x2cb
	.long	0x3b
	.byte	0x1
	.byte	0x68
	.uleb128 0x12
	.long	0x144
	.long	.LBB6
	.long	.LBE6
	.byte	0x1
	.word	0x2fa
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.long	.LASF21
	.byte	0x1
	.word	0x343
	.byte	0x1
	.long	.LFB8
	.long	.LFE8
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x1b2
	.uleb128 0xe
	.string	"x"
	.byte	0x1
	.word	0x343
	.long	0x3b
	.byte	0x1
	.byte	0x68
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF36
	.byte	0x1
	.word	0x323
	.long	.LFB5
	.long	.LFE5
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x1f9
	.uleb128 0x14
	.long	.LVL3
	.long	0x14d
	.uleb128 0x15
	.long	.LVL4
	.long	0x18a
	.long	0x1e8
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x38
	.byte	0
	.uleb128 0x17
	.long	.LVL5
	.byte	0x1
	.long	0x114
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x44
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	.LASF37
	.byte	0x1
	.word	0x31e
	.byte	0x1
	.long	.LFB4
	.long	.LFE4
	.long	.LLST0
	.byte	0x1
	.long	0x237
	.uleb128 0x19
	.long	.LASF18
	.byte	0x1
	.word	0x31e
	.long	0x3b
	.long	.LLST1
	.uleb128 0x14
	.long	.LVL8
	.long	0x14d
	.uleb128 0x1a
	.long	.LVL11
	.byte	0x1
	.long	0x1b2
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.word	0x348
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x272
	.uleb128 0x19
	.long	.LASF23
	.byte	0x1
	.word	0x348
	.long	0x3b
	.long	.LLST2
	.uleb128 0x1b
	.long	.LVL14
	.long	0x18a
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	.LASF24
	.byte	0x1
	.word	0x3ac
	.byte	0x1
	.byte	0x3
	.long	0x2b0
	.uleb128 0x7
	.long	.LASF11
	.byte	0x1
	.word	0x3ac
	.long	0x3b
	.uleb128 0x7
	.long	.LASF13
	.byte	0x1
	.word	0x3ac
	.long	0x54
	.uleb128 0x7
	.long	.LASF25
	.byte	0x1
	.word	0x3ac
	.long	0x82
	.uleb128 0xb
	.string	"ch"
	.byte	0x1
	.word	0x3ae
	.long	0x3b
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF27
	.byte	0x1
	.word	0x1bc
	.byte	0x1
	.long	0x4d
	.long	.LFB1
	.long	.LFE1
	.long	.LLST3
	.byte	0x1
	.long	0x5b2
	.uleb128 0x1d
	.string	"ch"
	.byte	0x1
	.word	0x1bd
	.long	0x3b
	.long	.LLST4
	.uleb128 0x1e
	.long	.LASF13
	.byte	0x1
	.word	0x1c5
	.long	0x54
	.long	.LLST5
	.uleb128 0x1e
	.long	.LASF25
	.byte	0x1
	.word	0x1c6
	.long	0x82
	.long	.LLST6
	.uleb128 0x1f
	.long	0xf9
	.long	.LBB22
	.long	.LBE22
	.byte	0x1
	.word	0x208
	.long	0x32c
	.uleb128 0x20
	.long	0x107
	.long	.LLST7
	.uleb128 0x12
	.long	0x144
	.long	.LBB24
	.long	.LBE24
	.byte	0x1
	.word	0x337
	.byte	0
	.uleb128 0x21
	.long	.Ldebug_ranges0+0
	.long	0x404
	.uleb128 0x1e
	.long	.LASF28
	.byte	0x1
	.word	0x240
	.long	0x3b
	.long	.LLST8
	.uleb128 0x1e
	.long	.LASF14
	.byte	0x1
	.word	0x241
	.long	0xf3
	.long	.LLST9
	.uleb128 0xa
	.long	.LASF29
	.byte	0x1
	.word	0x242
	.long	0x82
	.uleb128 0x22
	.long	0x8e
	.long	.LBB27
	.long	.Ldebug_ranges0+0x18
	.byte	0x1
	.word	0x287
	.long	0x3d6
	.uleb128 0x20
	.long	0xa8
	.long	.LLST10
	.uleb128 0x23
	.long	0xc0
	.uleb128 0x20
	.long	0xb4
	.long	.LLST11
	.uleb128 0x20
	.long	0x9c
	.long	.LLST12
	.uleb128 0x21
	.long	.Ldebug_ranges0+0x30
	.long	0x3c0
	.uleb128 0x24
	.long	0xcd
	.long	.LLST13
	.uleb128 0x24
	.long	0xd9
	.long	.LLST14
	.uleb128 0x25
	.long	.Ldebug_ranges0+0x48
	.uleb128 0x24
	.long	0xe6
	.long	.LLST15
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LVL60
	.long	0x5c9
	.uleb128 0x16
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.LVL43
	.long	0x14d
	.uleb128 0x14
	.long	.LVL45
	.long	0x14d
	.uleb128 0x14
	.long	.LVL47
	.long	0x14d
	.uleb128 0x14
	.long	.LVL50
	.long	0x14d
	.uleb128 0x14
	.long	.LVL53
	.long	0x1b2
	.byte	0
	.uleb128 0x26
	.long	.LBB35
	.long	.LBE35
	.long	0x43d
	.uleb128 0x1e
	.long	.LASF30
	.byte	0x1
	.word	0x211
	.long	0x46
	.long	.LLST16
	.uleb128 0x14
	.long	.LVL25
	.long	0x14d
	.uleb128 0x14
	.long	.LVL26
	.long	0x1b2
	.uleb128 0x14
	.long	.LVL27
	.long	0x114
	.byte	0
	.uleb128 0x26
	.long	.LBB36
	.long	.LBE36
	.long	0x46d
	.uleb128 0x1e
	.long	.LASF31
	.byte	0x1
	.word	0x22d
	.long	0x54
	.long	.LLST17
	.uleb128 0x14
	.long	.LVL34
	.long	0x14d
	.uleb128 0x14
	.long	.LVL36
	.long	0x14d
	.byte	0
	.uleb128 0x26
	.long	.LBB38
	.long	.LBE38
	.long	0x515
	.uleb128 0x1e
	.long	.LASF28
	.byte	0x1
	.word	0x28d
	.long	0x3b
	.long	.LLST18
	.uleb128 0x1f
	.long	0x272
	.long	.LBB39
	.long	.LBE39
	.byte	0x1
	.word	0x294
	.long	0x4f0
	.uleb128 0x20
	.long	0x298
	.long	.LLST19
	.uleb128 0x20
	.long	0x28c
	.long	.LLST20
	.uleb128 0x23
	.long	0x280
	.uleb128 0x27
	.long	.LBB40
	.long	.LBE40
	.uleb128 0x28
	.long	0x2a4
	.uleb128 0x15
	.long	.LVL78
	.long	0x5e3
	.long	0x4dc
	.uleb128 0x16
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.long	.LVL79
	.long	0x114
	.uleb128 0x14
	.long	.LVL83
	.long	0x114
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.LVL71
	.long	0x14d
	.uleb128 0x14
	.long	.LVL73
	.long	0x14d
	.uleb128 0x14
	.long	.LVL75
	.long	0x14d
	.uleb128 0x14
	.long	.LVL76
	.long	0x1b2
	.byte	0
	.uleb128 0x14
	.long	.LVL17
	.long	0x237
	.uleb128 0x15
	.long	.LVL18
	.long	0x18a
	.long	0x531
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3e
	.byte	0
	.uleb128 0x14
	.long	.LVL24
	.long	0x14d
	.uleb128 0x14
	.long	.LVL32
	.long	0x1f9
	.uleb128 0x15
	.long	.LVL41
	.long	0x1f9
	.long	0x556
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x34
	.byte	0
	.uleb128 0x14
	.long	.LVL86
	.long	0x1b2
	.uleb128 0x15
	.long	.LVL87
	.long	0x114
	.long	0x572
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x4e
	.byte	0
	.uleb128 0x15
	.long	.LVL88
	.long	0x114
	.long	0x586
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x9
	.byte	0x96
	.byte	0
	.uleb128 0x15
	.long	.LVL91
	.long	0x18a
	.long	0x599
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x38
	.byte	0
	.uleb128 0x14
	.long	.LVL92
	.long	0x1b2
	.uleb128 0x1b
	.long	.LVL93
	.long	0x114
	.uleb128 0x16
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x40
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF38
	.byte	0x1
	.byte	0xf3
	.long	0x5c4
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	optiboot_version
	.uleb128 0x2a
	.long	0x5f
	.uleb128 0x2b
	.byte	0x1
	.long	.LASF39
	.byte	0x3
	.word	0x2a2
	.byte	0x1
	.byte	0x1
	.long	0x5e3
	.uleb128 0x2c
	.long	0xf3
	.uleb128 0x2c
	.long	0x3b
	.byte	0
	.uleb128 0x2d
	.byte	0x1
	.long	.LASF40
	.byte	0x3
	.word	0x287
	.byte	0x1
	.long	0x3b
	.byte	0x1
	.long	0x5fc
	.uleb128 0x2c
	.long	0x5fc
	.byte	0
	.uleb128 0xc
	.byte	0x2
	.long	0x602
	.uleb128 0x2a
	.long	0x3b
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB4
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0
	.long	.LFE4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	0
	.long	0
.LLST1:
	.long	.LVL6
	.long	.LVL7
	.word	0x1
	.byte	0x68
	.long	.LVL7
	.long	.LVL10
	.word	0x1
	.byte	0x6c
	.long	0
	.long	0
.LLST2:
	.long	.LVL12
	.long	.LVL13
	.word	0x1
	.byte	0x68
	.long	.LVL13
	.long	.LFE9
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST3:
	.long	.LFB1
	.long	.LCFI1
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI1
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI2
	.long	.LFE1
	.word	0x2
	.byte	0x8c
	.sleb128 3
	.long	0
	.long	0
.LLST4:
	.long	.LVL16
	.long	.LVL17-1
	.word	0x1
	.byte	0x68
	.long	.LVL24
	.long	.LVL25-1
	.word	0x1
	.byte	0x68
	.long	.LVL28
	.long	.LVL29
	.word	0x1
	.byte	0x68
	.long	.LVL30
	.long	.LVL31
	.word	0x1
	.byte	0x68
	.long	.LVL33
	.long	.LVL34-1
	.word	0x1
	.byte	0x68
	.long	.LVL39
	.long	.LVL40
	.word	0x1
	.byte	0x68
	.long	.LVL42
	.long	.LVL43-1
	.word	0x1
	.byte	0x68
	.long	.LVL70
	.long	.LVL71-1
	.word	0x1
	.byte	0x68
	.long	.LVL85
	.long	.LVL86-1
	.word	0x1
	.byte	0x68
	.long	.LVL89
	.long	.LVL90
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST5:
	.long	.LVL15
	.long	.LVL23
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL23
	.long	.LVL35
	.word	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x1
	.byte	0x55
	.byte	0x93
	.uleb128 0x1
	.long	.LVL38
	.long	.LFE1
	.word	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x1
	.byte	0x55
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST6:
	.long	.LVL44
	.long	.LVL46
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL49
	.long	.LVL55
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL61
	.long	.LVL70
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL72
	.long	.LVL77
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST7:
	.long	.LVL19
	.long	.LVL20
	.word	0x2
	.byte	0x34
	.byte	0x9f
	.long	.LVL20
	.long	.LVL21
	.word	0x1
	.byte	0x62
	.long	.LVL21
	.long	.LVL22
	.word	0x3
	.byte	0x82
	.sleb128 -1
	.byte	0x9f
	.long	.LVL22
	.long	.LVL23
	.word	0x1
	.byte	0x62
	.long	0
	.long	0
.LLST8:
	.long	.LVL48
	.long	.LVL70
	.word	0x1
	.byte	0x57
	.long	0
	.long	0
.LLST9:
	.long	.LVL48
	.long	.LVL49
	.word	0x4
	.byte	0xa
	.word	0x100
	.byte	0x9f
	.long	.LVL49
	.long	.LVL51
	.word	0x3
	.byte	0x78
	.sleb128 1
	.byte	0x9f
	.long	.LVL51
	.long	.LVL53-1
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL53-1
	.long	.LVL54
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	.LVL61
	.long	.LVL70
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST10:
	.long	.LVL53
	.long	.LVL56
	.word	0x4
	.byte	0xa
	.word	0x100
	.byte	0x9f
	.long	.LVL56
	.long	.LVL57
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL57
	.long	.LVL58
	.word	0x3
	.byte	0x80
	.sleb128 1
	.byte	0x9f
	.long	.LVL58
	.long	.LVL60-1
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL60-1
	.long	.LVL61
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL61
	.long	.LVL70
	.word	0x4
	.byte	0xa
	.word	0x100
	.byte	0x9f
	.long	0
	.long	0
.LLST11:
	.long	.LVL53
	.long	.LVL56
	.word	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x1
	.byte	0x55
	.byte	0x93
	.uleb128 0x1
	.long	.LVL56
	.long	.LVL59
	.word	0xa
	.byte	0x74
	.sleb128 0
	.byte	0x80
	.sleb128 0
	.byte	0x22
	.byte	0xa
	.word	0x100
	.byte	0x1c
	.byte	0x9f
	.long	.LVL59
	.long	.LVL60-1
	.word	0xa
	.byte	0x74
	.sleb128 0
	.byte	0x8e
	.sleb128 0
	.byte	0x22
	.byte	0xa
	.word	0x100
	.byte	0x1c
	.byte	0x9f
	.long	.LVL60-1
	.long	.LVL61
	.word	0xa
	.byte	0x74
	.sleb128 0
	.byte	0x80
	.sleb128 0
	.byte	0x22
	.byte	0xa
	.word	0x100
	.byte	0x1c
	.byte	0x9f
	.long	.LVL61
	.long	.LVL70
	.word	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x1
	.byte	0x55
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST12:
	.long	.LVL53
	.long	.LVL70
	.word	0x1
	.byte	0x57
	.long	0
	.long	0
.LLST13:
	.long	.LVL61
	.long	.LVL62
	.word	0x4
	.byte	0xa
	.word	0x100
	.byte	0x9f
	.long	.LVL62
	.long	.LVL63
	.word	0x4
	.byte	0x82
	.sleb128 257
	.byte	0x9f
	.long	.LVL63
	.long	.LVL64
	.word	0x3
	.byte	0x8e
	.sleb128 1
	.byte	0x9f
	.long	.LVL64
	.long	.LVL68
	.word	0x4
	.byte	0x82
	.sleb128 258
	.byte	0x9f
	.long	.LVL68
	.long	.LVL70
	.word	0x4
	.byte	0x82
	.sleb128 256
	.byte	0x9f
	.long	0
	.long	0
.LLST14:
	.long	.LVL61
	.long	.LVL62
	.word	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x1
	.byte	0x55
	.byte	0x93
	.uleb128 0x1
	.long	.LVL62
	.long	.LVL65
	.word	0x6
	.byte	0x82
	.sleb128 0
	.byte	0x74
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.long	.LVL65
	.long	.LVL67
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL67
	.long	.LVL68
	.word	0x8
	.byte	0x74
	.sleb128 0
	.byte	0x82
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x2
	.byte	0x9f
	.long	.LVL68
	.long	.LVL70
	.word	0x6
	.byte	0x74
	.sleb128 0
	.byte	0x82
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.long	0
	.long	0
.LLST15:
	.long	.LVL64
	.long	.LVL66
	.word	0x11
	.byte	0x82
	.sleb128 257
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x38
	.byte	0x24
	.byte	0x88
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x21
	.byte	0x9f
	.long	.LVL66
	.long	.LVL69
	.word	0x10
	.byte	0x8a
	.sleb128 0
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x38
	.byte	0x24
	.byte	0x88
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x21
	.byte	0x9f
	.long	.LVL69
	.long	.LVL70
	.word	0x13
	.byte	0x8a
	.sleb128 0
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x38
	.byte	0x24
	.byte	0x82
	.sleb128 254
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x21
	.byte	0x9f
	.long	0
	.long	0
.LLST16:
	.long	.LVL25
	.long	.LVL26-1
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST17:
	.long	.LVL35
	.long	.LVL37
	.word	0x6
	.byte	0x74
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.long	.LVL37
	.long	.LVL39
	.word	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x1
	.byte	0x55
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST18:
	.long	.LVL75
	.long	.LVL76-1
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST19:
	.long	.LVL76
	.long	.LVL85
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST20:
	.long	.LVL76
	.long	.LVL77
	.word	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x1
	.byte	0x55
	.byte	0x93
	.uleb128 0x1
	.long	.LVL77
	.long	.LVL81
	.word	0x3
	.byte	0x7e
	.sleb128 1
	.byte	0x9f
	.long	.LVL81
	.long	.LVL82
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x24
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.LFB1
	.long	.LFE1-.LFB1
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB26
	.long	.LBE26
	.long	.LBB37
	.long	.LBE37
	.long	0
	.long	0
	.long	.LBB27
	.long	.LBE27
	.long	.LBB34
	.long	.LBE34
	.long	0
	.long	0
	.long	.LBB29
	.long	.LBE29
	.long	.LBB32
	.long	.LBE32
	.long	0
	.long	0
	.long	.LBB30
	.long	.LBE30
	.long	.LBB31
	.long	.LBE31
	.long	0
	.long	0
	.long	.Ltext0
	.long	.Letext0
	.long	.LFB1
	.long	.LFE1
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF35:
	.string	"watchdogReset"
.LASF24:
	.string	"read_mem"
.LASF28:
	.string	"desttype"
.LASF21:
	.string	"watchdogConfig"
.LASF36:
	.string	"verifySpace"
.LASF12:
	.string	"mybuff"
.LASF14:
	.string	"bufPtr"
.LASF40:
	.string	"__eerd_byte_m64"
.LASF16:
	.string	"writebuffer"
.LASF37:
	.string	"getNch"
.LASF0:
	.string	"int8_t"
.LASF32:
	.string	"GNU C 4.8.1 -fpreprocessed -mrelax -mmcu=atmega64 -g -Os -fno-split-wide-types"
.LASF3:
	.string	"unsigned char"
.LASF20:
	.string	"putch"
.LASF30:
	.string	"which"
.LASF7:
	.string	"long unsigned int"
.LASF34:
	.string	"/Users/Hans/Documents/Arduino/hardware/MegaCore/avr/bootloaders/optiboot"
.LASF31:
	.string	"newAddress"
.LASF22:
	.string	"appStart"
.LASF26:
	.string	"getch"
.LASF27:
	.string	"main"
.LASF5:
	.string	"unsigned int"
.LASF13:
	.string	"address"
.LASF9:
	.string	"long long unsigned int"
.LASF1:
	.string	"uint8_t"
.LASF33:
	.string	"optiboot.c"
.LASF29:
	.string	"savelength"
.LASF39:
	.string	"__eewr_byte_m64"
.LASF8:
	.string	"long long int"
.LASF19:
	.string	"char"
.LASF17:
	.string	"flash_led"
.LASF18:
	.string	"count"
.LASF10:
	.string	"pagelen_t"
.LASF11:
	.string	"memtype"
.LASF4:
	.string	"uint16_t"
.LASF15:
	.string	"addrPtr"
.LASF38:
	.string	"optiboot_version"
.LASF6:
	.string	"long int"
.LASF2:
	.string	"signed char"
.LASF23:
	.string	"rstFlags"
.LASF25:
	.string	"length"
	.ident	"GCC: (GNU) 4.8.1"
