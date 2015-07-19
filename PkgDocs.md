# 说明 #

本文档用于记录Go文档的翻译状态，以此来明确各子文档的译者、现状及任务分工。
标准格式如下：
```
包名|文档名 // 名字: 状态[(缩写: 注释)] .

其中：
|  表示或者
[] 表示可选

名字 = 提交者 .
状态 = *待译*|*翻译*|*校对*|*整理*|完成|… .
注释 = 具体说明 .
```

如：
```
runtime // Oling Cat：*校对*（osc: extern.go, debug.go）
```

若要认领任务，请注明译者并将状态标为`*待译*`；若已经开始翻译，请将状态改为`*翻译*`

  * 注：提交者名字以清晰易辨为佳；非“完成”状态请使用`*星号突出*`；邮件地址可在成员列表中找到。

# doc #
```
doc
│  asm.html                // Oling Cat: *待译*
│  cmd.html                // Oling Cat: 完成
│  code.html               // Oling Cat: 完成
│  contrib.html            // Oling Cat: 完成
│  contribute.html         // Oling Cat: 完成
│  debugging_with_gdb.html // Oling Cat: 完成
│  docs.html               // Oling Cat: 完成
│  effective_go.html       // Cipher Chen: 完成 (osc: *整理*)
│  effective_go.old.html   // Oling Cat: 完成
│  gccgo_contribute.html   // Oling Cat: 完成
│  gccgo_install.html      // Oling Cat: 完成
│  go1.1.html              // Sunny: 完成 (osc: *校对*)
│  go1.2.html              // Oling Cat: *待译*
│  go1.3.html              // Oling Cat: *待译*
│  go1.html                // Oling Cat: *待译*
│  go1compat.html          // Oling Cat: 完成
│  go_faq.html             // Oling Cat: 完成
│  go_mem.html             // Ants Arks & Oling Cat: 完成 (osc: *整理*)
│  go_mem.old.html         // Oling Cat: 完成
│  go_spec.html            // Oling Cat: *重译*
│  go_spec.old.html        // Oling Cat: 完成
│  help.html               // Oling Cat: 完成
│  install-source.html     // Oling Cat: 完成
│  install.html            // Oling Cat: 完成
│  root.html               // Oling Cat: 完成
│  tos.html                // Oling Cat: 完成
│
├── articles               // Oling Cat: 完成
│   │   go_command.html    // Oling Cat: 完成
│   │   index.html         // Oling Cat: 完成
│   │   race_detector.html // Oling Cat: *待译*
│   │
│   └── wiki
│            index.html     // ChaiShushan: 完成 (osc: *整理*)
│            index.html     // Oling Cat: 待译
│            view.html      // Oling Cat: 待译
│
├── codewalk
│        codewalk.xml  // Oling Cat: 完成
│        functions.xml // Oling Cat: 完成
│        markov.xml    // Oling Cat: 完成
│        sharemem.xml  // Oling Cat: 完成
│
└── play
         fib.go
         hello.go
         life.go
         peano.go
         pi.go
         sieve.go
         solitaire.go
         tree.go
```

# pkg #
```
pkg
├── archive
│   ├── tar // Liudi Wu: 完成 (Chensi Yuan: 整理)
│   └── zip // Liudi Wu: 完成 (Chensi Yuan: 整理)
├── bufio // Oling Cat：部分完成 (Chensi Yuan：整理合并 Liudi Wu 翻译)
├── builtin // Oling Cat: 完成
├── bytes // Liudi Wu：完成 (Chensi Yuan：待整理)
├── compress
│   ├── bzip2
│   ├── flate
│   ├── gzip
│   ├── lzw
│   └── zlib
├── container
│   ├── heap
│   ├── list
│   └── ring
├── crypto
│   ├── aes
│   ├── cipher
│   ├── des
│   ├── dsa
│   ├── ecdsa
│   ├── elliptic
│   ├── hmac
│   ├── md5
│   ├── rand
│   ├── rc4
│   ├── rsa
│   ├── sha1
│   ├── sha256
│   ├── sha512
│   ├── subtle
│   ├── tls
│   └── x509
│       └── pkix
├── database
│   └── sql        // 轩脉刃: 完成 (osc: sql.go *更新*，已标出TODO.)
│       └── driver // 轩脉刃: *翻译*
├── debug
│   ├── dwarf
│   ├── elf
│   ├── goobj
│   ├── gosym
│   ├── macho
│   ├── pe
│   └── plan9obj
├── encoding
│   ├── ascii85 // Xize Dong: *校对*
│   ├── asn1    // Xize Dong: *翻译*
│   ├── base32  // Xize Dong: *待译*
│   ├── base64  // Xize Dong: *待译*
│   ├── binary  // Xize Dong: *待译*
│   ├── csv     // Xize Dong: *待译*
│   ├── gob     // Xize Dong: *待译*
│   ├── hex     // Xize Dong: *待译*
│   ├── json    // Xize Dong: *待译*
│   ├── pem     // Xize Dong: *待译*
│   └── xml     // Xize Dong: *待译*
├── errors // Oling Cat: 完成
├── expvar
├── flag   // 轩脉刃: 完成 (osc: *更新*)
├── fmt    // Oling Cat & 刘地: 完成
├── go
│   ├── ast
│   ├── build
│   ├── doc
│   ├── format
│   ├── parser
│   ├── printer
│   ├── scanner
│   └── token
├── hash
│   ├── adler32
│   ├── crc32
│   ├── crc64
│   └── fnv
├───html            // Cipher Chen: *待译*
│   └── template    // Cipher Chen: *待译*
├── image           // 轩脉刃: 完成
│   ├── color       // 轩脉刃: 完成
│   │   └─ palette // 轩脉刃: *待译*
│   ├── draw        // 轩脉刃: 完成
│   ├── gif         // 轩脉刃: 完成
│   ├── jpeg        // 轩脉刃: *待译*
│   └── png         // 轩脉刃: 完成
├── index
│   └── suffixarray
├── io         // Oling Cat: 完成
│   └── ioutil // Oling Cat & 刘地: 完成
├── log
│   └── syslog
├── math      // Oling Cat: 完成
│   ├── big   // Oling Cat: *翻译*
│   ├── cmplx // Oling Cat: 完成
│   └── rand  // Oling Cat: *待译*
├── mime
│   └── multipart
├── net
│   ├── http          // Oling Cat & 刘地: 完成 (osc: 需整理)
│   │   ├── cgi       // 轩脉刃: 完成
│   │   ├── cookiejar // 轩脉刃: *待译*
│   │   ├── fcgi      // 轩脉刃: 完成
│   │   ├── httptest  // 轩脉刃: 完成
│   │   ├── httputil  // 轩脉刃: 完成
│   │   ├── internal
│   │   └── pprof     // 轩脉刃: 完成
│   ├── mail        // 轩脉刃: 完成
│   ├── rpc         // 轩脉刃: 完成
│   │   └── jsonrpc // 轩脉刃: 完成
│   ├── smtp
│   ├── textproto
│   └── url
├── os
│   ├── exec
│   ├── signal
│   └── user
├── path
│   └── filepath
├── reflect
├── regexp
│   └── syntax
├── runtime   // Oling Cat: 完成
│   ├── cgo   // Oling Cat: 完成
│   ├── debug // Oling Cat: 完成
│   ├── pprof // Oling Cat: 完成
│   └── race  // Oling Cat: 完成
├── sort      // Johntech: 完成 (osc: 已校对)
├── strconv   // Oling Cat: *待译*
├── strings
├── sync       // Oling Cat: 完成
│   └── atomic // Oling Cat: 完成
├── syscall
├── testing
│   ├── iotest
│   └── quick
├── text          // Stone Lion: *翻译*
│   ├── scanner   // Stone Lion: *翻译*
│   ├── tabwriter // Stone Lion: *翻译*
│   └── template  // Stone Lion: *翻译*
│       └── parse  // Stone Lion: *翻译*
├── time      // Oling Cat:  *待译*
├── unicode   // Oling Cat: 完成
│   ├── utf16 // Oling Cat: 完成
│   └── utf8  // Oling Cat: 完成
└── unsafe    // Oling Cat: 完成
```

# cmd #
```
cmd
├── 5a
├── 5c
├── 5g
├── 5l
├── 6a
├── 6c
├── 6g
├── 6l
├── 8a
├── 8c
├── 8g
├── 8l
├── addr2line
├── api
├── cc
├── cgo
├── dist
├── fix
├── gc
├── go
├── gofmt
├── ld
├── link
├── nm
├── objdump
├── pack
└── yacc
```