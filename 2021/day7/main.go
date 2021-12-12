package main

import (
	"fmt"
	"math"
	"strconv"
	"strings"

	utils "github.com/arjunmahishi/advent-of-code/utils/go"
)

func costOfMovingV1(list []int, pos int) int {
	cost := 0

	for _, num := range list {
		cost += int(math.Abs(float64(num) - float64(pos)))
	}

	return cost
}

func costOfMovingV2(list []int, pos int) int {
	cost := 0

	for _, num := range list {
		steps := int(math.Abs(float64(num) - float64(pos)))
		cost += (steps * (steps + 1)) / 2 // sum of AP :)
	}

	return cost
}

func runPart1(input []string) {
	intList := []int{}

	for _, ele := range strings.Split(input[0], ",") {
		n, _ := strconv.Atoi(ele)
		intList = append(intList, n)
	}

	leastCost := costOfMovingV1(intList, intList[0])
	for _, i := range intList {
		cost := costOfMovingV1(intList, i)
		if cost < leastCost {
			leastCost = cost
		}
	}

	fmt.Println(leastCost)
}

func runPart2(input []string) {
	intList := []int{}
	max := -1
	min, _ := strconv.Atoi(input[0])

	for _, ele := range strings.Split(input[0], ",") {
		n, _ := strconv.Atoi(ele)
		intList = append(intList, n)

		if n > max {
			max = n
		}

		if n < min {
			min = n
		}
	}

	leastCost := costOfMovingV2(intList, intList[0])
	for i := min; i <= max; i++ {
		cost := costOfMovingV2(intList, i)
		if cost < leastCost {
			leastCost = cost
		}
	}

	fmt.Println(leastCost)
}

func main() {
	input, _ := utils.ReadInput("./input.txt")
	// input, _ := utils.ReadInput("./sample_input.txt")

	runPart1(input)
	runPart2(input)
}
