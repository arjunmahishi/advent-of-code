package main

import (
	"fmt"
	"strconv"
)

func parseInput(input []string) [][]int {
	var floor [][]int

	for _, line := range input {
		row := []int{}
		for _, sn := range line {
			n, _ := strconv.Atoi(string(sn))
			row = append(row, n)
		}
		floor = append(floor, row)
	}

	return floor
}

func isLowPoint(floor [][]int, coord [2]int) bool {
	if floor[coord[0]][coord[1]] == 0 {
		return true
	}

	locs := [][2]int{
		{coord[0], coord[1] + 1},
		{coord[0], coord[1] - 1},
		{coord[0] + 1, coord[1]},
		{coord[0] - 1, coord[1]},
	}

	for _, loc := range locs {
		if loc[0] < len(floor) && loc[0] >= 0 &&
			loc[1] < len(floor[0]) && loc[1] >= 0 &&
			floor[loc[0]][loc[1]] < floor[coord[0]][coord[1]] {
			return false
		}
	}

	return true
}

func runPart1(input []string) {
	floor := parseInput(input)

	riskLevel := 0
	for ix, row := range floor {
		for iy, point := range row {
			if isLowPoint(floor, [2]int{ix, iy}) {
				riskLevel += point + 1
			}
		}
	}

	fmt.Println(riskLevel)
}

func runPart2(input []string) {
}

func main() {
	input, _ := utils.ReadInput("./input.txt")
	// input, _ := utils.ReadInput("./sample_input.txt")

	runPart1(input)
	runPart2(input)
}
