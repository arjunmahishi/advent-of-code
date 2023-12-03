package main

import (
	"fmt"

	utils "github.com/arjunmahishi/advent-of-code/utils/go"
)

func main() {
	inp, err := utils.ReadInput("input.txt")
	if err != nil {
		panic(err)
	}

	fmt.Printf("Part1: `%d`\n\n", part1(inp))
	fmt.Printf("Part2: `%d`\n\n", part2(inp))
}
