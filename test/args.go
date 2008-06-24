// $G $F.go && $L $F.$A && ./$A.out arg1 arg2

// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package main

func main() {
	if sys.argc() != 3 {
		panic "argc"
	}
	if sys.argv(1) != "arg1" {
		panic "arg1"
	}
	if sys.argv(2) != "arg2" {
		panic "arg2"
	}
}
