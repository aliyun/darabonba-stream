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

func ReadFromFilePath(path *string) (_result io.Reader, _err error) {
	return os.Open(tea.StringValue(path))
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
