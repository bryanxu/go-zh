// Copyright 2013 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package md5_test

import (
	"crypto/md5"
	"fmt"
	"io"
)

func ExampleNew() {
	h := md5.New()
	io.WriteString(h, "The fog is getting thicker!")
	io.WriteString(h, "And Leon's getting laaarger!")
	fmt.Printf("%x", h.Sum(nil))
	// Output: e2c569be17396eca2a2e3c11578123ed
}

func ExampleSum() {
	input := "The quick brown fox jumps over the lazy dog."
	fmt.Printf("%x", md5.Sum([]byte(input)))
	// Output: e4d909c290d0fb1ca068ffaddf22cbd0
}
