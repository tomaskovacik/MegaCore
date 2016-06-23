	.file	"optiboot.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.type	do_spm, @function
do_spm:
.LFB13:
	.file 1 "optiboot.c"
	.loc 1 990 0
	.cfi_startproc
.LVL0:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 1006 0
	movw r30,r24
/* #APP */
 ;  1006 "optiboot.c" 1
	    movw  r0, r20
    sts 104, r22
    spm
    clr  r1

 ;  0 "" 2
.LVL1:
/* #NOAPP */
.L3:
	.loc 1 1023 0 discriminator 1
	lds r24,104
	sbrc r24,0
	rjmp .L3
	.loc 1 1028 0
	andi r22,lo8(6)
.LVL2:
	breq .L1
	.loc 1 1028 0 is_stmt 0 discriminator 1
	or r20,r21
	brne .L1
	.loc 1 1033 0 is_stmt 1
	ldi r24,lo8(17)
/* #APP */
 ;  1033 "optiboot.c" 1
	sts 104, r24
	spm
	
 ;  0 "" 2
/* #NOAPP */
.L1:
	ret
	.cfi_endproc
.LFE13:
	.size	do_spm, .-do_spm
	.section	.init8,"ax",@progbits
.global	pre_main
	.type	pre_main, @function
pre_main:
.LFB1:
	.loc 1 445 0
	.cfi_startproc
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 449 0
/* #APP */
 ;  449 "optiboot.c" 1
		rjmp	1f
	rjmp	do_spm
1:

 ;  0 "" 2
/* epilogue start */
	.loc 1 454 0
/* #NOAPP */
	.cfi_endproc
.LFE1:
	.size	pre_main, .-pre_main
	.text
.global	putch
	.type	putch, @function
putch:
.LFB3:
	.loc 1 699 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL3:
.L12:
	.loc 1 701 0 discriminator 1
	sbis 0xb,5
	rjmp .L12
	.loc 1 702 0
	out 0xc,r24
	ret
	.cfi_endproc
.LFE3:
	.size	putch, .-putch
.global	getch
	.type	getch, @function
getch:
.LFB4:
	.loc 1 729 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L15:
	.loc 1 766 0 discriminator 1
	sbis 0xb,7
	rjmp .L15
	.loc 1 768 0
	sbic 0xb,4
	rjmp .L16
.LBB6:
.LBB7:
	.loc 1 845 0
/* #APP */
 ;  845 "optiboot.c" 1
	wdr

 ;  0 "" 2
/* #NOAPP */
.L16:
.LBE7:
.LBE6:
	.loc 1 780 0
	in r24,0xc
.LVL4:
	.loc 1 792 0
	ret
	.cfi_endproc
.LFE4:
	.size	getch, .-getch
.global	watchdogConfig
	.type	watchdogConfig, @function
watchdogConfig:
.LFB9:
	.loc 1 850 0
	.cfi_startproc
.LVL5:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 851 0
	ldi r25,lo8(24)
	out 0x21,r25
	.loc 1 852 0
	out 0x21,r24
	ret
	.cfi_endproc
.LFE9:
	.size	watchdogConfig, .-watchdogConfig
.global	verifySpace
	.type	verifySpace, @function
verifySpace:
.LFB6:
	.loc 1 818 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 819 0
	call getch
.LVL6:
	cpi r24,lo8(32)
	breq .L19
	.loc 1 820 0
	ldi r24,lo8(8)
	call watchdogConfig
.LVL7:
.L20:
	rjmp .L20
.L19:
	.loc 1 824 0
	ldi r24,lo8(20)
	jmp putch
.LVL8:
	.cfi_endproc
.LFE6:
	.size	verifySpace, .-verifySpace
	.type	getNch, @function
getNch:
.LFB5:
	.loc 1 813 0
	.cfi_startproc
.LVL9:
	push r28
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
.LVL10:
.L23:
	.loc 1 814 0 discriminator 1
	call getch
.LVL11:
	subi r28,lo8(-(-1))
.LVL12:
	brne .L23
/* epilogue start */
	.loc 1 816 0
	pop r28
.LVL13:
	.loc 1 815 0
	jmp verifySpace
.LVL14:
	.cfi_endproc
.LFE5:
	.size	getNch, .-getNch
.global	appStart
	.type	appStart, @function
appStart:
.LFB10:
	.loc 1 855 0
	.cfi_startproc
.LVL15:
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 859 0
/* #APP */
 ;  859 "optiboot.c" 1
	mov r2, r24

 ;  0 "" 2
	.loc 1 861 0
/* #NOAPP */
	ldi r24,0
.LVL16:
	call watchdogConfig
.LVL17:
	.loc 1 864 0
/* #APP */
 ;  864 "optiboot.c" 1
	ldi r30,0
clr r31
ijmp

 ;  0 "" 2
/* epilogue start */
	.loc 1 870 0
/* #NOAPP */
	.cfi_endproc
.LFE10:
	.size	appStart, .-appStart
	.section	.init9,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB2:
	.loc 1 458 0
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
.LVL18:
	.loc 1 479 0
/* #APP */
 ;  479 "optiboot.c" 1
	clr __zero_reg__
 ;  0 "" 2
	.loc 1 481 0
/* #NOAPP */
	ldi r24,lo8(-1)
	ldi r25,lo8(16)
	out __SP_L__+1,r25
	out __SP_L__,r24
	.loc 1 491 0
	in r24,0x34
.LVL19:
	.loc 1 492 0
	out 0x34,__zero_reg__
	.loc 1 499 0
	mov r25,r24
	andi r25,lo8(13)
	breq .L26
	.loc 1 500 0
	call appStart
.LVL20:
.L26:
	.loc 1 504 0
	ldi r24,lo8(5)
	out 0x2e,r24
	.loc 1 514 0
	ldi r24,lo8(2)
	out 0xb,r24
	.loc 1 515 0
	ldi r24,lo8(24)
	out 0xa,r24
	.loc 1 516 0
	ldi r24,lo8(6)
	sts 149,r24
	.loc 1 517 0
	ldi r24,lo8(12)
	out 0x9,r24
	.loc 1 522 0
	ldi r24,lo8(14)
	call watchdogConfig
.LVL21:
	.loc 1 526 0
	sbi 0x17,5
.LVL22:
	ldi r18,lo8(4)
.LBB22:
.LBB23:
	.loc 1 830 0
	ldi r24,lo8(-61)
	ldi r25,lo8(-1)
	.loc 1 831 0
	ldi r21,lo8(4)
	.loc 1 834 0
	ldi r20,lo8(32)
.LVL23:
.L30:
	.loc 1 830 0
	out 0x2c+1,r25
	out 0x2c,r24
	.loc 1 831 0
	out 0x36,r21
.L28:
	.loc 1 832 0
	in __tmp_reg__,0x36
	sbrs __tmp_reg__,2
	rjmp .L28
	.loc 1 834 0
	in r19,0x18
	eor r19,r20
	out 0x18,r19
.LBB24:
.LBB25:
	.loc 1 845 0
/* #APP */
 ;  845 "optiboot.c" 1
	wdr

 ;  0 "" 2
.LVL24:
/* #NOAPP */
	subi r18,lo8(-(-1))
.LVL25:
.LBE25:
.LBE24:
	.loc 1 839 0
	brne .L30
	mov r8,__zero_reg__
	mov r9,__zero_reg__
.LVL26:
.L55:
.LBE23:
.LBE22:
	.loc 1 542 0
	call getch
.LVL27:
	.loc 1 544 0
	cpi r24,lo8(65)
	brne .L31
.LBB26:
	.loc 1 545 0
	call getch
.LVL28:
	.loc 1 546 0
	std Y+1,r24
	call verifySpace
.LVL29:
	.loc 1 551 0
	ldd r24,Y+1
	cpi r24,lo8(-126)
	brne .+2
	rjmp .L69
	.loc 1 553 0
	cpi r24,lo8(-127)
	brne .L34
	.loc 1 554 0
	ldi r24,lo8(6)
	rjmp .L67
.L34:
	.loc 1 560 0
	ldi r24,lo8(3)
.L67:
	call putch
.LVL30:
	rjmp .L33
.LVL31:
.L31:
.LBE26:
	.loc 1 563 0
	cpi r24,lo8(66)
	brne .L35
	.loc 1 565 0
	ldi r24,lo8(20)
.LVL32:
	rjmp .L68
.LVL33:
.L35:
	.loc 1 567 0
	cpi r24,lo8(69)
	brne .L36
	.loc 1 569 0
	ldi r24,lo8(5)
.LVL34:
.L68:
	call getNch
.LVL35:
	rjmp .L33
.LVL36:
.L36:
	.loc 1 571 0
	cpi r24,lo8(85)
	brne .L37
.LBB27:
	.loc 1 574 0
	call getch
.LVL37:
	mov r8,r24
.LVL38:
	.loc 1 575 0
	call getch
.LVL39:
	mov r9,__zero_reg__
	or r9,r24
.LVL40:
	.loc 1 580 0
	lsl r8
	rol r9
.LVL41:
	rjmp .L54
.LVL42:
.L37:
.LBE27:
	.loc 1 584 0
	cpi r24,lo8(86)
	brne .L38
	.loc 1 586 0
	ldi r24,lo8(4)
.LVL43:
	call getNch
.LVL44:
	.loc 1 587 0
	ldi r24,0
	rjmp .L67
.LVL45:
.L38:
	.loc 1 590 0
	cpi r24,lo8(100)
	breq .+2
	rjmp .L39
.LBB28:
	.loc 1 596 0
	call getch
.LVL46:
	mov r14,r24
	mov r15,__zero_reg__
	mov r15,r14
	clr r14
.LVL47:
	call getch
.LVL48:
	or r14,r24
.LVL49:
	.loc 1 598 0
	call getch
.LVL50:
	mov r11,r24
.LVL51:
	.loc 1 596 0
	movw r16,r14
	.loc 1 598 0
	mov r12,__zero_reg__
	clr r13
	inc r13
.LVL52:
.L41:
	.loc 1 602 0 discriminator 1
	call getch
.LVL53:
	movw r30,r12
	st Z+,r24
.LVL54:
	movw r12,r30
	.loc 1 603 0 discriminator 1
	subi r16,1
	sbc r17,__zero_reg__
.LVL55:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	brne .L41
	.loc 1 606 0
	call verifySpace
.LVL56:
.LBB29:
.LBB30:
	.loc 1 878 0
	ldi r31,lo8(69)
	cpse r11,r31
	rjmp .L65
	add r14,r8
	adc r15,r9
	movw r16,r8
.LVL57:
	mov r12,__zero_reg__
	clr r13
	inc r13
.LVL58:
.L44:
	.loc 1 881 0
	cp r16,r14
	cpc r17,r15
	brne .+2
	rjmp .L33
.LVL59:
	.loc 1 882 0
	movw r30,r12
	ld r22,Z+
.LVL60:
	movw r12,r30
.LVL61:
	movw r24,r16
	call __eewr_byte_m64
.LVL62:
	subi r16,-1
	sbci r17,-1
	rjmp .L44
.LVL63:
.L65:
.LBB31:
	.loc 1 911 0
	ldi r20,0
	ldi r21,0
	ldi r22,lo8(3)
	movw r24,r8
	call do_spm
.LVL64:
	ldi r16,0
	ldi r17,0
.LVL65:
.L47:
	movw r30,r16
	inc r31
.LVL66:
.LBB32:
	.loc 1 918 0
	ld r20,Z
.LVL67:
	adiw r30,1
	.loc 1 919 0
	ld r24,Z
	ldi r21,0
	or r21,r24
	.loc 1 920 0
	ldi r22,lo8(1)
	movw r24,r16
	add r24,r8
	adc r25,r9
.LVL68:
	call do_spm
.LVL69:
	subi r16,-2
	sbci r17,-1
.LVL70:
.LBE32:
	.loc 1 922 0
	cp r14,r16
	cpc r15,r17
	brne .L47
	.loc 1 927 0
	ldi r20,0
	ldi r21,0
	ldi r22,lo8(5)
	movw r24,r8
	call do_spm
.LVL71:
	rjmp .L33
.LVL72:
.L39:
.LBE31:
.LBE30:
.LBE29:
.LBE28:
	.loc 1 667 0
	cpi r24,lo8(116)
	brne .L48
.LBB33:
	.loc 1 669 0
	call getch
.LVL73:
	mov r16,r24
	ldi r17,0
	mov r17,r16
	clr r16
.LVL74:
	call getch
.LVL75:
	or r16,r24
.LVL76:
	.loc 1 671 0
	call getch
.LVL77:
	.loc 1 673 0
	std Y+1,r24
	call verifySpace
.LVL78:
.LBB34:
.LBB35:
	.loc 1 937 0
	ldd r24,Y+1
	movw r14,r8
	cpi r24,lo8(69)
	brne .L52
.LVL79:
.L51:
	.loc 1 942 0
	movw r24,r14
	call __eerd_byte_m64
.LVL80:
	call putch
.LVL81:
	.loc 1 943 0
	subi r16,1
	sbc r17,__zero_reg__
.LVL82:
	ldi r31,-1
	sub r14,r31
	sbc r15,r31
.LVL83:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	brne .L51
	rjmp .L33
.LVL84:
.L52:
	.loc 1 967 0
	movw r30,r14
/* #APP */
 ;  965 "optiboot.c" 1
	lpm r24,Z+

 ;  0 "" 2
/* #NOAPP */
	movw r14,r30
	call putch
.LVL85:
	.loc 1 968 0
	subi r16,1
	sbc r17,__zero_reg__
.LVL86:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	brne .L52
	rjmp .L33
.LVL87:
.L48:
.LBE35:
.LBE34:
.LBE33:
	.loc 1 679 0
	cpi r24,lo8(117)
	brne .L53
	.loc 1 681 0
	call verifySpace
.LVL88:
	.loc 1 682 0
	ldi r24,lo8(30)
	call putch
.LVL89:
	.loc 1 683 0
	ldi r24,lo8(-106)
	call putch
.LVL90:
.L69:
	.loc 1 684 0
	ldi r24,lo8(2)
	rjmp .L67
.LVL91:
.L53:
	.loc 1 686 0
	cpi r24,lo8(81)
	brne .L54
	.loc 1 688 0
	ldi r24,lo8(8)
.LVL92:
	call watchdogConfig
.LVL93:
.L54:
	.loc 1 693 0
	call verifySpace
.LVL94:
.L33:
	.loc 1 695 0
	ldi r24,lo8(16)
	call putch
.LVL95:
	.loc 1 696 0
	rjmp .L55
	.cfi_endproc
.LFE2:
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
	.long	0x6e2
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF36
	.byte	0x1
	.long	.LASF37
	.long	.LASF38
	.long	.Ldebug_ranges0+0
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
	.word	0x36b
	.byte	0x1
	.byte	0x3
	.long	0xf3
	.uleb128 0x7
	.long	.LASF11
	.byte	0x1
	.word	0x36b
	.long	0x29
	.uleb128 0x7
	.long	.LASF12
	.byte	0x1
	.word	0x36b
	.long	0xf3
	.uleb128 0x7
	.long	.LASF13
	.byte	0x1
	.word	0x36c
	.long	0x54
	.uleb128 0x8
	.string	"len"
	.byte	0x1
	.word	0x36c
	.long	0x82
	.uleb128 0x9
	.uleb128 0xa
	.long	.LASF14
	.byte	0x1
	.word	0x386
	.long	0xf3
	.uleb128 0xa
	.long	.LASF15
	.byte	0x1
	.word	0x387
	.long	0x54
	.uleb128 0x9
	.uleb128 0xb
	.string	"a"
	.byte	0x1
	.word	0x395
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
	.word	0x33c
	.byte	0x1
	.byte	0x3
	.long	0x114
	.uleb128 0x7
	.long	.LASF18
	.byte	0x1
	.word	0x33c
	.long	0x3b
	.byte	0
	.uleb128 0xd
	.long	.LASF24
	.byte	0x1
	.word	0x3de
	.byte	0x1
	.long	.LFB13
	.long	.LFE13
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x162
	.uleb128 0xe
	.long	.LASF13
	.byte	0x1
	.word	0x3de
	.long	0x54
	.long	.LLST0
	.uleb128 0xe
	.long	.LASF19
	.byte	0x1
	.word	0x3de
	.long	0x3b
	.long	.LLST1
	.uleb128 0xf
	.long	.LASF20
	.byte	0x1
	.word	0x3de
	.long	0x54
	.byte	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF39
	.byte	0x1
	.word	0x1bd
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x11
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.word	0x2bb
	.byte	0x1
	.long	.LFB3
	.long	.LFE3
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x1a2
	.uleb128 0x12
	.string	"ch"
	.byte	0x1
	.word	0x2bb
	.long	0x1a2
	.byte	0x1
	.byte	0x68
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF21
	.uleb128 0x13
	.long	.LASF40
	.byte	0x1
	.word	0x34c
	.byte	0x3
	.uleb128 0x14
	.byte	0x1
	.long	.LASF30
	.byte	0x1
	.word	0x2d9
	.byte	0x1
	.long	0x3b
	.long	.LFB4
	.long	.LFE4
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x1ef
	.uleb128 0x15
	.string	"ch"
	.byte	0x1
	.word	0x2da
	.long	0x3b
	.byte	0x1
	.byte	0x68
	.uleb128 0x16
	.long	0x1a9
	.long	.LBB6
	.long	.LBE6
	.byte	0x1
	.word	0x309
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF23
	.byte	0x1
	.word	0x352
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x217
	.uleb128 0x12
	.string	"x"
	.byte	0x1
	.word	0x352
	.long	0x3b
	.byte	0x1
	.byte	0x68
	.byte	0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF41
	.byte	0x1
	.word	0x332
	.long	.LFB6
	.long	.LFE6
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x25e
	.uleb128 0x18
	.long	.LVL6
	.long	0x1b2
	.uleb128 0x19
	.long	.LVL7
	.long	0x1ef
	.long	0x24d
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x38
	.byte	0
	.uleb128 0x1b
	.long	.LVL8
	.byte	0x1
	.long	0x179
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x44
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF25
	.byte	0x1
	.word	0x32d
	.byte	0x1
	.long	.LFB5
	.long	.LFE5
	.long	.LLST2
	.byte	0x1
	.long	0x29c
	.uleb128 0xe
	.long	.LASF18
	.byte	0x1
	.word	0x32d
	.long	0x3b
	.long	.LLST3
	.uleb128 0x18
	.long	.LVL11
	.long	0x1b2
	.uleb128 0x1d
	.long	.LVL14
	.byte	0x1
	.long	0x217
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF26
	.byte	0x1
	.word	0x357
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x2d7
	.uleb128 0xe
	.long	.LASF27
	.byte	0x1
	.word	0x357
	.long	0x3b
	.long	.LLST4
	.uleb128 0x1e
	.long	.LVL17
	.long	0x1ef
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	.LASF28
	.byte	0x1
	.word	0x3a5
	.byte	0x1
	.byte	0x3
	.long	0x315
	.uleb128 0x7
	.long	.LASF11
	.byte	0x1
	.word	0x3a5
	.long	0x3b
	.uleb128 0x7
	.long	.LASF13
	.byte	0x1
	.word	0x3a5
	.long	0x54
	.uleb128 0x7
	.long	.LASF29
	.byte	0x1
	.word	0x3a5
	.long	0x82
	.uleb128 0xb
	.string	"ch"
	.byte	0x1
	.word	0x3a7
	.long	0x3b
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF31
	.byte	0x1
	.word	0x1ca
	.byte	0x1
	.long	0x4d
	.long	.LFB2
	.long	.LFE2
	.long	.LLST5
	.byte	0x1
	.long	0x690
	.uleb128 0x20
	.string	"ch"
	.byte	0x1
	.word	0x1cb
	.long	0x3b
	.long	.LLST6
	.uleb128 0x21
	.long	.LASF13
	.byte	0x1
	.word	0x1d3
	.long	0x54
	.long	.LLST7
	.uleb128 0x21
	.long	.LASF29
	.byte	0x1
	.word	0x1d4
	.long	0x82
	.long	.LLST8
	.uleb128 0x22
	.long	0xf9
	.long	.LBB22
	.long	.LBE22
	.byte	0x1
	.word	0x218
	.long	0x391
	.uleb128 0x23
	.long	0x107
	.long	.LLST9
	.uleb128 0x16
	.long	0x1a9
	.long	.LBB24
	.long	.LBE24
	.byte	0x1
	.word	0x346
	.byte	0
	.uleb128 0x24
	.long	.LBB26
	.long	.LBE26
	.long	0x3ca
	.uleb128 0x21
	.long	.LASF32
	.byte	0x1
	.word	0x221
	.long	0x46
	.long	.LLST10
	.uleb128 0x18
	.long	.LVL28
	.long	0x1b2
	.uleb128 0x18
	.long	.LVL29
	.long	0x217
	.uleb128 0x18
	.long	.LVL30
	.long	0x179
	.byte	0
	.uleb128 0x24
	.long	.LBB27
	.long	.LBE27
	.long	0x3fa
	.uleb128 0x21
	.long	.LASF33
	.byte	0x1
	.word	0x23d
	.long	0x54
	.long	.LLST11
	.uleb128 0x18
	.long	.LVL37
	.long	0x1b2
	.uleb128 0x18
	.long	.LVL39
	.long	0x1b2
	.byte	0
	.uleb128 0x24
	.long	.LBB28
	.long	.LBE28
	.long	0x54b
	.uleb128 0x21
	.long	.LASF34
	.byte	0x1
	.word	0x250
	.long	0x3b
	.long	.LLST12
	.uleb128 0x21
	.long	.LASF14
	.byte	0x1
	.word	0x251
	.long	0xf3
	.long	.LLST13
	.uleb128 0xa
	.long	.LASF35
	.byte	0x1
	.word	0x252
	.long	0x82
	.uleb128 0x22
	.long	0x8e
	.long	.LBB29
	.long	.LBE29
	.byte	0x1
	.word	0x296
	.long	0x51d
	.uleb128 0x23
	.long	0xa8
	.long	.LLST14
	.uleb128 0x25
	.long	0xc0
	.uleb128 0x23
	.long	0xb4
	.long	.LLST15
	.uleb128 0x23
	.long	0x9c
	.long	.LLST16
	.uleb128 0x24
	.long	.LBB31
	.long	.LBE31
	.long	0x507
	.uleb128 0x26
	.long	0xcd
	.long	.LLST17
	.uleb128 0x26
	.long	0xd9
	.long	.LLST18
	.uleb128 0x24
	.long	.LBB32
	.long	.LBE32
	.long	0x4ba
	.uleb128 0x26
	.long	0xe6
	.long	.LLST19
	.uleb128 0x1e
	.long	.LVL69
	.long	0x114
	.uleb128 0x1a
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x80
	.sleb128 0
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.uleb128 0x1a
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	.LVL64
	.long	0x114
	.long	0x4e2
	.uleb128 0x1a
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1a
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x33
	.uleb128 0x1a
	.byte	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1e
	.long	.LVL71
	.long	0x114
	.uleb128 0x1a
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x78
	.sleb128 0
	.uleb128 0x1a
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x35
	.uleb128 0x1a
	.byte	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	.LVL62
	.long	0x6a7
	.uleb128 0x1a
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	.LVL46
	.long	0x1b2
	.uleb128 0x18
	.long	.LVL48
	.long	0x1b2
	.uleb128 0x18
	.long	.LVL50
	.long	0x1b2
	.uleb128 0x18
	.long	.LVL53
	.long	0x1b2
	.uleb128 0x18
	.long	.LVL56
	.long	0x217
	.byte	0
	.uleb128 0x24
	.long	.LBB33
	.long	.LBE33
	.long	0x5f3
	.uleb128 0x21
	.long	.LASF34
	.byte	0x1
	.word	0x29c
	.long	0x3b
	.long	.LLST20
	.uleb128 0x22
	.long	0x2d7
	.long	.LBB34
	.long	.LBE34
	.byte	0x1
	.word	0x2a3
	.long	0x5ce
	.uleb128 0x23
	.long	0x2fd
	.long	.LLST21
	.uleb128 0x23
	.long	0x2f1
	.long	.LLST22
	.uleb128 0x25
	.long	0x2e5
	.uleb128 0x27
	.long	.LBB35
	.long	.LBE35
	.uleb128 0x28
	.long	0x309
	.uleb128 0x19
	.long	.LVL80
	.long	0x6c1
	.long	0x5ba
	.uleb128 0x1a
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
	.uleb128 0x18
	.long	.LVL81
	.long	0x179
	.uleb128 0x18
	.long	.LVL85
	.long	0x179
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	.LVL73
	.long	0x1b2
	.uleb128 0x18
	.long	.LVL75
	.long	0x1b2
	.uleb128 0x18
	.long	.LVL77
	.long	0x1b2
	.uleb128 0x18
	.long	.LVL78
	.long	0x217
	.byte	0
	.uleb128 0x18
	.long	.LVL20
	.long	0x29c
	.uleb128 0x19
	.long	.LVL21
	.long	0x1ef
	.long	0x60f
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x3e
	.byte	0
	.uleb128 0x18
	.long	.LVL27
	.long	0x1b2
	.uleb128 0x18
	.long	.LVL35
	.long	0x25e
	.uleb128 0x19
	.long	.LVL44
	.long	0x25e
	.long	0x634
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x34
	.byte	0
	.uleb128 0x18
	.long	.LVL88
	.long	0x217
	.uleb128 0x19
	.long	.LVL89
	.long	0x179
	.long	0x650
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x4e
	.byte	0
	.uleb128 0x19
	.long	.LVL90
	.long	0x179
	.long	0x664
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x9
	.byte	0x96
	.byte	0
	.uleb128 0x19
	.long	.LVL93
	.long	0x1ef
	.long	0x677
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x38
	.byte	0
	.uleb128 0x18
	.long	.LVL94
	.long	0x217
	.uleb128 0x1e
	.long	.LVL95
	.long	0x179
	.uleb128 0x1a
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x40
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF42
	.byte	0x1
	.byte	0xf3
	.long	0x6a2
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	optiboot_version
	.uleb128 0x2a
	.long	0x5f
	.uleb128 0x2b
	.byte	0x1
	.long	.LASF43
	.byte	0x3
	.word	0x2a2
	.byte	0x1
	.byte	0x1
	.long	0x6c1
	.uleb128 0x2c
	.long	0xf3
	.uleb128 0x2c
	.long	0x3b
	.byte	0
	.uleb128 0x2d
	.byte	0x1
	.long	.LASF44
	.byte	0x3
	.word	0x287
	.byte	0x1
	.long	0x3b
	.byte	0x1
	.long	0x6da
	.uleb128 0x2c
	.long	0x6da
	.byte	0
	.uleb128 0xc
	.byte	0x2
	.long	0x6e0
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
	.uleb128 0xf
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
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
	.long	.LVL0
	.long	.LVL1
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL1
	.long	.LFE13
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST1:
	.long	.LVL0
	.long	.LVL2
	.word	0x1
	.byte	0x66
	.long	.LVL2
	.long	.LFE13
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	0
	.long	0
.LLST2:
	.long	.LFB5
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0
	.long	.LFE5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	0
	.long	0
.LLST3:
	.long	.LVL9
	.long	.LVL10
	.word	0x1
	.byte	0x68
	.long	.LVL10
	.long	.LVL13
	.word	0x1
	.byte	0x6c
	.long	0
	.long	0
.LLST4:
	.long	.LVL15
	.long	.LVL16
	.word	0x1
	.byte	0x68
	.long	.LVL16
	.long	.LFE10
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST5:
	.long	.LFB2
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
	.long	.LFE2
	.word	0x2
	.byte	0x8c
	.sleb128 3
	.long	0
	.long	0
.LLST6:
	.long	.LVL19
	.long	.LVL20-1
	.word	0x1
	.byte	0x68
	.long	.LVL27
	.long	.LVL28-1
	.word	0x1
	.byte	0x68
	.long	.LVL31
	.long	.LVL32
	.word	0x1
	.byte	0x68
	.long	.LVL33
	.long	.LVL34
	.word	0x1
	.byte	0x68
	.long	.LVL36
	.long	.LVL37-1
	.word	0x1
	.byte	0x68
	.long	.LVL42
	.long	.LVL43
	.word	0x1
	.byte	0x68
	.long	.LVL45
	.long	.LVL46-1
	.word	0x1
	.byte	0x68
	.long	.LVL72
	.long	.LVL73-1
	.word	0x1
	.byte	0x68
	.long	.LVL87
	.long	.LVL88-1
	.word	0x1
	.byte	0x68
	.long	.LVL91
	.long	.LVL92
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST7:
	.long	.LVL18
	.long	.LVL26
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL26
	.long	.LVL38
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	.LVL41
	.long	.LFE2
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST8:
	.long	.LVL47
	.long	.LVL49
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL52
	.long	.LVL57
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL63
	.long	.LVL65
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL74
	.long	.LVL79
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST9:
	.long	.LVL22
	.long	.LVL23
	.word	0x2
	.byte	0x34
	.byte	0x9f
	.long	.LVL23
	.long	.LVL24
	.word	0x1
	.byte	0x62
	.long	.LVL24
	.long	.LVL25
	.word	0x3
	.byte	0x82
	.sleb128 -1
	.byte	0x9f
	.long	.LVL25
	.long	.LVL26
	.word	0x1
	.byte	0x62
	.long	0
	.long	0
.LLST10:
	.long	.LVL28
	.long	.LVL29-1
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST11:
	.long	.LVL38
	.long	.LVL40
	.word	0x6
	.byte	0x78
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.long	.LVL40
	.long	.LVL42
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST12:
	.long	.LVL51
	.long	.LVL72
	.word	0x1
	.byte	0x5b
	.long	0
	.long	0
.LLST13:
	.long	.LVL51
	.long	.LVL52
	.word	0x4
	.byte	0xa
	.word	0x100
	.byte	0x9f
	.long	.LVL52
	.long	.LVL54
	.word	0x3
	.byte	0x7c
	.sleb128 1
	.byte	0x9f
	.long	.LVL54
	.long	.LVL56-1
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL56-1
	.long	.LVL58
	.word	0x6
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL63
	.long	.LVL72
	.word	0x6
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST14:
	.long	.LVL56
	.long	.LVL58
	.word	0x4
	.byte	0xa
	.word	0x100
	.byte	0x9f
	.long	.LVL58
	.long	.LVL59
	.word	0x6
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL59
	.long	.LVL60
	.word	0x3
	.byte	0x7c
	.sleb128 1
	.byte	0x9f
	.long	.LVL60
	.long	.LVL62-1
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL62-1
	.long	.LVL63
	.word	0x6
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL63
	.long	.LVL72
	.word	0x4
	.byte	0xa
	.word	0x100
	.byte	0x9f
	.long	0
	.long	0
.LLST15:
	.long	.LVL56
	.long	.LVL58
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	.LVL58
	.long	.LVL61
	.word	0xa
	.byte	0x78
	.sleb128 0
	.byte	0x7c
	.sleb128 0
	.byte	0x22
	.byte	0xa
	.word	0x100
	.byte	0x1c
	.byte	0x9f
	.long	.LVL61
	.long	.LVL62-1
	.word	0xa
	.byte	0x78
	.sleb128 0
	.byte	0x8e
	.sleb128 0
	.byte	0x22
	.byte	0xa
	.word	0x100
	.byte	0x1c
	.byte	0x9f
	.long	.LVL62-1
	.long	.LVL63
	.word	0xa
	.byte	0x78
	.sleb128 0
	.byte	0x7c
	.sleb128 0
	.byte	0x22
	.byte	0xa
	.word	0x100
	.byte	0x1c
	.byte	0x9f
	.long	.LVL63
	.long	.LVL72
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST16:
	.long	.LVL56
	.long	.LVL72
	.word	0x1
	.byte	0x5b
	.long	0
	.long	0
.LLST17:
	.long	.LVL63
	.long	.LVL65
	.word	0x4
	.byte	0xa
	.word	0x100
	.byte	0x9f
	.long	.LVL65
	.long	.LVL66
	.word	0x4
	.byte	0x80
	.sleb128 257
	.byte	0x9f
	.long	.LVL66
	.long	.LVL67
	.word	0x3
	.byte	0x8e
	.sleb128 1
	.byte	0x9f
	.long	.LVL67
	.long	.LVL70
	.word	0x4
	.byte	0x80
	.sleb128 258
	.byte	0x9f
	.long	.LVL70
	.long	.LVL72
	.word	0x4
	.byte	0x80
	.sleb128 256
	.byte	0x9f
	.long	0
	.long	0
.LLST18:
	.long	.LVL63
	.long	.LVL65
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	.LVL65
	.long	.LVL68
	.word	0x6
	.byte	0x80
	.sleb128 0
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.long	.LVL68
	.long	.LVL69-1
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL69-1
	.long	.LVL69
	.word	0x6
	.byte	0x80
	.sleb128 0
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.long	.LVL69
	.long	.LVL70
	.word	0x8
	.byte	0x78
	.sleb128 0
	.byte	0x80
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0x2
	.byte	0x9f
	.long	.LVL70
	.long	.LVL72
	.word	0x6
	.byte	0x78
	.sleb128 0
	.byte	0x80
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.long	0
	.long	0
.LLST19:
	.long	.LVL67
	.long	.LVL69-1
	.word	0x11
	.byte	0x80
	.sleb128 257
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x38
	.byte	0x24
	.byte	0x84
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x21
	.byte	0x9f
	.long	0
	.long	0
.LLST20:
	.long	.LVL77
	.long	.LVL78-1
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST21:
	.long	.LVL78
	.long	.LVL87
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST22:
	.long	.LVL78
	.long	.LVL79
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	.LVL79
	.long	.LVL83
	.word	0x3
	.byte	0x7e
	.sleb128 1
	.byte	0x9f
	.long	.LVL83
	.long	.LVL84
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
	.long	0x2c
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
	.long	.LFB2
	.long	.LFE2-.LFB2
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.Ltext0
	.long	.Letext0
	.long	.LFB1
	.long	.LFE1
	.long	.LFB2
	.long	.LFE2
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF40:
	.string	"watchdogReset"
.LASF28:
	.string	"read_mem"
.LASF38:
	.string	"/Users/Hans/Documents/Arduino/hardware/MegaCore/avr/bootloaders/optiboot_flash"
.LASF34:
	.string	"desttype"
.LASF23:
	.string	"watchdogConfig"
.LASF41:
	.string	"verifySpace"
.LASF12:
	.string	"mybuff"
.LASF14:
	.string	"bufPtr"
.LASF44:
	.string	"__eerd_byte_m64"
.LASF19:
	.string	"command"
.LASF16:
	.string	"writebuffer"
.LASF25:
	.string	"getNch"
.LASF0:
	.string	"int8_t"
.LASF20:
	.string	"data"
.LASF36:
	.string	"GNU C 4.8.1 -fpreprocessed -mrelax -mmcu=atmega64 -g -Os -fno-split-wide-types"
.LASF3:
	.string	"unsigned char"
.LASF22:
	.string	"putch"
.LASF32:
	.string	"which"
.LASF7:
	.string	"long unsigned int"
.LASF33:
	.string	"newAddress"
.LASF39:
	.string	"pre_main"
.LASF30:
	.string	"getch"
.LASF31:
	.string	"main"
.LASF5:
	.string	"unsigned int"
.LASF13:
	.string	"address"
.LASF9:
	.string	"long long unsigned int"
.LASF1:
	.string	"uint8_t"
.LASF37:
	.string	"optiboot.c"
.LASF35:
	.string	"savelength"
.LASF43:
	.string	"__eewr_byte_m64"
.LASF8:
	.string	"long long int"
.LASF21:
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
.LASF24:
	.string	"do_spm"
.LASF42:
	.string	"optiboot_version"
.LASF6:
	.string	"long int"
.LASF2:
	.string	"signed char"
.LASF27:
	.string	"rstFlags"
.LASF29:
	.string	"length"
.LASF26:
	.string	"appStart"
	.ident	"GCC: (GNU) 4.8.1"
