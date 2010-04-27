// errchk $G -e $D/$F.go

// Copyright 2010 The Go Authors.  All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package main

fmt.Printf("hello")	// ERROR "non-declaration statement outside function body"

func main() {
}

x++	// ERROR "non-declaration statement outside function body"

func init() {
}

x,y := 1, 2	// ERROR "non-declaration statement outside function body"

