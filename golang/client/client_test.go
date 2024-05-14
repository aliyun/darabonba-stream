package client

import (
	"io"
	"io/ioutil"
	"os"
	"testing"

	"github.com/alibabacloud-go/tea/tea"
	"github.com/alibabacloud-go/tea/utils"
)

func Test_ReadFromFilePath(t *testing.T) {
	result := ReadFromFilePath(nil)
	utils.AssertNil(t, result)

	path, _ := os.Getwd()
	result = ReadFromFilePath(tea.String(path + "/test.txt"))
	byt, err := ioutil.ReadAll(result)
	utils.AssertNil(t, err)
	r, _ := result.(io.ReadCloser)
	r.Close()
	utils.AssertEqual(t, "test", string(byt))
}

func Test_ReadFromBytes(t *testing.T) {
	result := ReadFromBytes([]byte("test"))
	byt, err := ioutil.ReadAll(result)
	utils.AssertNil(t, err)
	utils.AssertEqual(t, "test", string(byt))
}

func Test_ReadFromString(t *testing.T) {
	result := ReadFromString(tea.String("test"))
	byt, err := ioutil.ReadAll(result)
	utils.AssertNil(t, err)
	utils.AssertEqual(t, "test", string(byt))
}
