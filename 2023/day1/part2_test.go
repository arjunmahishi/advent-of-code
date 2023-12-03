package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func Test_findDigits(t *testing.T) {
	tests := []struct {
		row   string
		first int
		last  int
	}{
		{row: "FBFBBFFRLR", first: -1, last: -1},
		{row: "1onetwo", first: 1, last: 2},
		{row: "3xkjrnqnqhgcfgjvfmxhghp15", first: 3, last: 5},
		{row: "xbfkhfvlts8dhtnxhxgn93three7one1", first: 8, last: 1},
		{row: "nine9844", first: 9, last: 4},
		{row: "1", first: 1, last: 1},
		{row: "", first: -1, last: -1},
		{row: "5onepczqjfcgfrbmtstbqbktphkvqcmbbvhpld", first: 5, last: 1},
		{row: "dafsdfdone5", first: 1, last: 5},
		{row: "twoone", first: 2, last: 1},
		{row: "twoonef", first: 2, last: 1},
		{row: "qp4", first: 4, last: 4},
		{row: "one", first: 1, last: 1},
		{row: "seven", first: 7, last: 7},
	}
	for _, tt := range tests {
		t.Run(tt.row, func(t *testing.T) {
			assert.Equal(t, tt.first, findFirstDigit(tt.row))
			assert.Equal(t, tt.last, findLastDigit(tt.row))
		})
	}
}
