package utils

import (
	"io"
	"os"
	"strings"
)

func ReadInput(filename string) ([]string, error) {
	file, err := os.Open(filename)
	if err != nil {
		return nil, err
	}

	conts, err := io.ReadAll(file)
	if err != nil {
		return nil, err
	}

	return strings.Split(strings.TrimSpace(string(conts)), "\n"), nil
}

func ArraySum(arr []int) int {
	sum := 0
	for _, n := range arr {
		sum += n
	}

	return sum
}
