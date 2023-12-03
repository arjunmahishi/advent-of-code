package main

import (
	"strconv"
	"strings"
)

func colorMax(sets []map[string]int) map[string]int {
	maxSet := map[string]int{}
	for _, set := range sets {
		for color, count := range set {
			if currCount, ok := maxSet[color]; !ok {
				maxSet[color] = count
			} else if count > currCount {
				maxSet[color] = count
			}
		}
	}

	return maxSet
}

func part2(inp []string) int {
	sum := 0
	for _, row := range inp {
		colonSplit := strings.Split(row, ":")
		_, err := strconv.Atoi(strings.Split(strings.TrimSpace(colonSplit[0]), " ")[1])
		if err != nil {
			panic(err)
		}

		semiColonSplit := strings.Split(colonSplit[1], ";")
		sets := []map[string]int{}
		for _, set := range semiColonSplit {
			sets = append(sets, parseSet(set))
		}

		product := 1
		for _, count := range colorMax(sets) {
			product *= count
		}

		sum += product
	}

	return sum
}
