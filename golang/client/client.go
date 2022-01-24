// This file is auto-generated, don't edit it. Thanks.
/**
 * This is a stream module
 */
package client

import (
	"bytes"
	"io"
	"os"
	"strings"

	"github.com/alibabacloud-go/tea/tea"
)

func ReadFromFilePath(path *string) (_result io.Reader) {
	file, err := os.Open(tea.StringValue(path))
	if err != nil {
		return
	}
	defer file.Close()
	return file
}

func ReadFromBytes(raw []byte) (_result io.Reader) {
	return bytes.NewBuffer(raw)
}

func ReadFromString(raw *string) (_result io.Reader) {
	return strings.NewReader(tea.StringValue(raw))
}

func Reset(raw io.Reader) (_result io.Reader) {
	return
}
