package utils

import (
	"io/ioutil"
	"strings"
)

func ReadInput(filename string) ([]string, error) {
	conts, err := ioutil.ReadFile(filename)
	if err != nil {
		return nil, err
	}

	return strings.Split(string(conts), "\n"), nil
}
