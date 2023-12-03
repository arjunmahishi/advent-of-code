package main

import (
	"strconv"
)

var digitMap = map[string]int{
	"one":   1,
	"two":   2,
	"three": 3,
	"four":  4,
	"five":  5,
	"six":   6,
	"seven": 7,
	"eight": 8,
	"nine":  9,
}

func findFirstDigit(row string) int {
	for i := 0; i < len(row); i++ {
		if digit, err := strconv.Atoi(string(row[i])); err == nil {
			return digit
		}

		for j := 2; j <= 5; j++ {
			if i+j <= len(row) {
				curr := row[i : i+j]
				if digit, ok := digitMap[curr]; ok {
					return digit
				}
			}
		}
	}

	println("no first digit found")
	return -1
}

func findLastDigit(row string) int {
	for i := len(row) - 1; i >= 0; i-- {
		if digit, err := strconv.Atoi(string(row[i])); err == nil {
			return digit
		}

		for j := 2; j <= 4; j++ {
			if i-j >= 0 {
				curr := row[i-j : i+1]
				if digit, ok := digitMap[curr]; ok {
					return digit
				}
			}
		}
	}

	println("no last digit found")
	return -1
}

func part2(inp []string) int {
	sum := 0
	for _, row := range inp {
		f := findFirstDigit(row)
		l := findLastDigit(row)

		if f != -1 && l != -1 {
			sum += (f * 10) + l
		}
	}

	return sum
}
