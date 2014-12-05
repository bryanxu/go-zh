// created by cgo -cdefs and then converted to Go
// cgo -cdefs defs_dragonfly.go

package runtime

import "unsafe"

const (
	_EINTR  = 0x4
	_EFAULT = 0xe
	_EBUSY  = 0x10
	_EAGAIN = 0x23

	_PROT_NONE  = 0x0
	_PROT_READ  = 0x1
	_PROT_WRITE = 0x2
	_PROT_EXEC  = 0x4

	_MAP_ANON    = 0x1000
	_MAP_PRIVATE = 0x2
	_MAP_FIXED   = 0x10

	_MADV_FREE = 0x5

	_SA_SIGINFO = 0x40
	_SA_RESTART = 0x2
	_SA_ONSTACK = 0x1

	_SIGHUP    = 0x1
	_SIGINT    = 0x2
	_SIGQUIT   = 0x3
	_SIGILL    = 0x4
	_SIGTRAP   = 0x5
	_SIGABRT   = 0x6
	_SIGEMT    = 0x7
	_SIGFPE    = 0x8
	_SIGKILL   = 0x9
	_SIGBUS    = 0xa
	_SIGSEGV   = 0xb
	_SIGSYS    = 0xc
	_SIGPIPE   = 0xd
	_SIGALRM   = 0xe
	_SIGTERM   = 0xf
	_SIGURG    = 0x10
	_SIGSTOP   = 0x11
	_SIGTSTP   = 0x12
	_SIGCONT   = 0x13
	_SIGCHLD   = 0x14
	_SIGTTIN   = 0x15
	_SIGTTOU   = 0x16
	_SIGIO     = 0x17
	_SIGXCPU   = 0x18
	_SIGXFSZ   = 0x19
	_SIGVTALRM = 0x1a
	_SIGPROF   = 0x1b
	_SIGWINCH  = 0x1c
	_SIGINFO   = 0x1d
	_SIGUSR1   = 0x1e
	_SIGUSR2   = 0x1f

	_FPE_INTDIV = 0x2
	_FPE_INTOVF = 0x1
	_FPE_FLTDIV = 0x3
	_FPE_FLTOVF = 0x4
	_FPE_FLTUND = 0x5
	_FPE_FLTRES = 0x6
	_FPE_FLTINV = 0x7
	_FPE_FLTSUB = 0x8

	_BUS_ADRALN = 0x1
	_BUS_ADRERR = 0x2
	_BUS_OBJERR = 0x3

	_SEGV_MAPERR = 0x1
	_SEGV_ACCERR = 0x2

	_ITIMER_REAL    = 0x0
	_ITIMER_VIRTUAL = 0x1
	_ITIMER_PROF    = 0x2

	_EV_ADD       = 0x1
	_EV_DELETE    = 0x2
	_EV_CLEAR     = 0x20
	_EV_ERROR     = 0x4000
	_EVFILT_READ  = -0x1
	_EVFILT_WRITE = -0x2
)

type rtprio struct {
	_type uint16
	prio  uint16
}

type lwpparams struct {
	start_func uintptr
	arg        unsafe.Pointer
	stack      uintptr
	tid1       unsafe.Pointer // *int32
	tid2       unsafe.Pointer // *int32
}

type sigaltstackt struct {
	ss_sp    uintptr
	ss_size  uintptr
	ss_flags int32
}

type sigset struct {
	__bits [4]uint32
}

type stackt struct {
	ss_sp    uintptr
	ss_size  uintptr
	ss_flags int32
}

type siginfo struct {
	si_signo  int32
	si_errno  int32
	si_code   int32
	si_pid    int32
	si_uid    uint32
	si_status int32
	si_addr   uintptr
	si_value  [4]byte
	si_band   int32
	__spare__ [7]int32
}

type mcontext struct {
	mc_onstack  uint32
	mc_gs       uint32
	mc_fs       uint32
	mc_es       uint32
	mc_ds       uint32
	mc_edi      uint32
	mc_esi      uint32
	mc_ebp      uint32
	mc_isp      uint32
	mc_ebx      uint32
	mc_edx      uint32
	mc_ecx      uint32
	mc_eax      uint32
	mc_xflags   uint32
	mc_trapno   uint32
	mc_err      uint32
	mc_eip      uint32
	mc_cs       uint32
	mc_eflags   uint32
	mc_esp      uint32
	mc_ss       uint32
	mc_len      uint32
	mc_fpformat uint32
	mc_ownedfp  uint32
	mc_fpregs   [128]uint32
	__spare__   [16]uint32
}

type ucontext struct {
	uc_sigmask  sigset
	uc_mcontext mcontext
	uc_link     *ucontext
	uc_stack    stackt
	__spare__   [8]int32
}

type timespec struct {
	tv_sec  int32
	tv_nsec int32
}

func (ts *timespec) set_sec(x int64) {
	ts.tv_sec = int32(x)
}

type timeval struct {
	tv_sec  int32
	tv_usec int32
}

func (tv *timeval) set_usec(x int32) {
	tv.tv_usec = x
}

type itimerval struct {
	it_interval timeval
	it_value    timeval
}

type keventt struct {
	ident  uint32
	filter int16
	flags  uint16
	fflags uint32
	data   int32
	udata  *byte
}
