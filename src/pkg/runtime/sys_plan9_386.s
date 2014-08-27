// Copyright 2010 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

#include "zasm_GOOS_GOARCH.h"
#include "../../cmd/ld/textflag.h"

// setldt(int entry, int address, int limit)
TEXT runtime·setldt(SB),NOSPLIT,$0
	RET

TEXT runtime·open(SB),NOSPLIT,$0
	MOVL    $14, AX
	INT     $64
	MOVL	AX, ret+12(FP)
	RET

TEXT runtime·pread(SB),NOSPLIT,$0
	MOVL    $50, AX
	INT     $64
	MOVL	AX, ret+20(FP)
	RET

TEXT runtime·pwrite(SB),NOSPLIT,$0
	MOVL    $51, AX
	INT     $64
	MOVL	AX, ret+20(FP)
	RET

// int32 _seek(int64*, int32, int64, int32)
TEXT _seek<>(SB),NOSPLIT,$0
	MOVL	$39, AX
	INT	$64
	RET

TEXT runtime·seek(SB),NOSPLIT,$24
	LEAL	ret+16(FP), AX
	MOVL	fd+0(FP), BX
	MOVL	offset_lo+4(FP), CX
	MOVL	offset_hi+8(FP), DX
	MOVL	whence+12(FP), SI
	MOVL	AX, 0(SP)
	MOVL	BX, 4(SP)
	MOVL	CX, 8(SP)
	MOVL	DX, 12(SP)
	MOVL	SI, 16(SP)
	CALL	_seek<>(SB)
	CMPL	AX, $0
	JGE	3(PC)
	MOVL	$-1, ret_lo+16(FP)
	MOVL	$-1, ret_hi+20(FP)
	RET

TEXT runtime·close(SB),NOSPLIT,$0
	MOVL	$4, AX
	INT	$64
	MOVL	AX, ret+4(FP)
	RET

TEXT runtime·exits(SB),NOSPLIT,$0
	MOVL    $8, AX
	INT     $64
	RET

TEXT runtime·brk_(SB),NOSPLIT,$0
	MOVL    $24, AX
	INT     $64
	MOVL	AX, ret+4(FP)
	RET

TEXT runtime·sleep(SB),NOSPLIT,$0
	MOVL    $17, AX
	INT     $64
	MOVL	AX, ret+4(FP)
	RET

TEXT runtime·plan9_semacquire(SB),NOSPLIT,$0
	MOVL	$37, AX
	INT	$64
	MOVL	AX, ret+8(FP)
	RET

TEXT runtime·plan9_tsemacquire(SB),NOSPLIT,$0
	MOVL	$52, AX
	INT	$64
	MOVL	AX, ret+8(FP)
	RET

TEXT nsec<>(SB),NOSPLIT,$0
	MOVL	$53, AX
	INT	$64
	RET

TEXT runtime·nsec(SB),NOSPLIT,$8
	LEAL	ret+4(FP), AX
	MOVL	AX, 0(SP)
	CALL	nsec<>(SB)
	CMPL	AX, $0
	JGE	3(PC)
	MOVL	$-1, ret_lo+4(FP)
	MOVL	$-1, ret_hi+8(FP)
	RET

TEXT runtime·notify(SB),NOSPLIT,$0
	MOVL	$28, AX
	INT	$64
	MOVL	AX, ret+4(FP)
	RET

TEXT runtime·noted(SB),NOSPLIT,$0
	MOVL	$29, AX
	INT	$64
	MOVL	AX, ret+4(FP)
	RET
	
TEXT runtime·plan9_semrelease(SB),NOSPLIT,$0
	MOVL	$38, AX
	INT	$64
	MOVL	AX, ret+8(FP)
	RET
	
TEXT runtime·rfork(SB),NOSPLIT,$0
	MOVL	$19, AX // rfork
	MOVL	stack+8(SP), CX
	MOVL	mm+12(SP), BX	// m
	MOVL	gg+16(SP), DX	// g
	MOVL	fn+20(SP), SI	// fn
	INT     $64

	// In parent, return.
	CMPL	AX, $0
	JEQ	3(PC)
	MOVL	AX, ret+20(FP)
	RET

	// set SP to be on the new child stack
	MOVL	CX, SP

	// Initialize m, g.
	get_tls(AX)
	MOVL	DX, g(AX)
	MOVL	BX, g_m(DX)

	// Initialize procid from TOS struct.
	MOVL	_tos(SB), AX
	MOVL	48(AX), AX // procid
	MOVL	AX, m_procid(BX)	// save pid as m->procid
	
	CALL	runtime·stackcheck(SB)	// smashes AX, CX
	
	MOVL	0(DX), DX	// paranoia; check they are not nil
	MOVL	0(BX), BX
	
	// more paranoia; check that stack splitting code works
	PUSHL	SI
	CALL	runtime·emptyfunc(SB)
	POPL	SI
	
	CALL	SI	// fn()
	CALL	runtime·exit(SB)
	MOVL	AX, ret+20(FP)
	RET

// void sigtramp(void *ureg, int8 *note)
TEXT runtime·sigtramp(SB),NOSPLIT,$0
	get_tls(AX)

	// check that g exists
	MOVL	g(AX), BX
	CMPL	BX, $0
	JNE	3(PC)
	CALL	runtime·badsignal2(SB) // will exit
	RET

	// save args
	MOVL	ureg+4(SP), CX
	MOVL	note+8(SP), DX

	// change stack
	MOVL	g_m(BX), BX
	MOVL	m_gsignal(BX), BP
	MOVL	g_stackbase(BP), BP
	MOVL	BP, SP

	// make room for args and g
	SUBL	$16, SP

	// save g
	MOVL	g(AX), BP
	MOVL	BP, 12(SP)

	// g = m->gsignal
	MOVL	m_gsignal(BX), DI
	MOVL	DI, g(AX)

	// load args and call sighandler
	MOVL	CX, 0(SP)
	MOVL	DX, 4(SP)
	MOVL	BP, 8(SP)

	CALL	runtime·sighandler(SB)

	// restore g
	get_tls(BX)
	MOVL	12(SP), BP
	MOVL	BP, g(BX)

	// call noted(AX)
	MOVL	AX, 0(SP)
	CALL	runtime·noted(SB)
	RET

// Only used by the 64-bit runtime.
TEXT runtime·setfpmasks(SB),NOSPLIT,$0
	RET

#define ERRMAX 128	/* from os_plan9.h */

// func errstr() String
// Only used by package syscall.
// Grab error string due to a syscall made
// in entersyscall mode, without going
// through the allocator (issue 4994).
// See ../syscall/asm_plan9_386.s:/·Syscall/
TEXT runtime·errstr(SB),NOSPLIT,$0
	get_tls(AX)
	MOVL	g(AX), BX
	MOVL	g_m(BX), BX
	MOVL	m_errstr(BX), CX
	MOVL	CX, ret_base+0(FP)
	MOVL	$ERRMAX, ret_len+4(FP)
	MOVL	$41, AX
	INT	$64

	// syscall requires caller-save
	MOVL	ret_base+0(FP), CX

	// push the argument
	PUSHL	CX
	CALL	runtime·findnull(SB)
	POPL	CX
	MOVL	AX, ret_len+4(FP)
	RET
