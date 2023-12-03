package main

import (
	"strconv"
	"strings"
)

// Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
// Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
// Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
// Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
// Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green

var maxCounts = map[string]int{
	"red":   12,
	"green": 13,
	"blue":  14,
}

func parseSet(part string) map[string]int {
	set := map[string]int{}
	for _, row := range strings.Split(part, ",") {
		row = strings.TrimSpace(row)

		rowSplit := strings.Split(row, " ")
		color := strings.TrimSpace(rowSplit[1])
		count, err := strconv.Atoi(strings.TrimSpace(rowSplit[0]))
		if err != nil {
			panic(err)
		}

		if _, ok := set[color]; !ok {
			set[color] = count
		} else {
			set[color] += count
		}
	}

	return set
}

func part1(inp []string) int {
	sum := 0

outer:
	for _, row := range inp {
		colonSplit := strings.Split(row, ":")
		gameNum, err := strconv.Atoi(strings.Split(strings.TrimSpace(colonSplit[0]), " ")[1])
		if err != nil {
			panic(err)
		}

		semiColonSplit := strings.Split(colonSplit[1], ";")
		for _, set := range semiColonSplit {
			for color, count := range parseSet(set) {
				if count > maxCounts[color] {
					continue outer
				}
			}
		}

		sum += gameNum
	}

	return sum
}
