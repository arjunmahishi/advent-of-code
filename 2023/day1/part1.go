package main

import (
	"strconv"
	"strings"

	utils "github.com/arjunmahishi/advent-of-code/utils/go"
)

func part1(inp []string) int {
	values := []int{}

	for _, row := range inp {
		digits := []int{}
		for _, cell := range strings.Split(row, "") {
			n, err := strconv.Atoi(cell)
			if err == nil {
				digits = append(digits, n)
			}
		}

		if len(digits) > 0 {
			values = append(values, digits[0]*10+digits[len(digits)-1])
		}
	}

	return utils.ArraySum(values)
}
