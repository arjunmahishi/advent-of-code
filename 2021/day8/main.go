package main

import (
	"fmt"
	"strings"

	utils "github.com/arjunmahishi/advent-of-code/utils/go"
)

func runPart1(input []string) {
	knownSegments := map[int]bool{2: true, 3: true, 4: true, 7: true}
	count := 0
	for _, line := range input {
		signals := strings.Split(line, " | ")[1]
		for _, sig := range strings.Split(signals, " ") {
			if _, ok := knownSegments[len(sig)]; ok {
				count++
			}
		}
	}

	fmt.Println(count)
}

func getSegList(inputSigs []string) [10]string {
	var sigs [10]string
	for _, sig := range inputSigs {
		switch len(sig) {
		case 2:
			sigs[1] = sig
		case 3:
			sigs[7] = sig
		case 4:
			sigs[4] = sig
		case 7:
			sigs[8] = sig
		}
	}

	sigs[0] += sigs[1]
	sigs[3] += sigs[1]
	sigs[9] += sigs[1]

	sigs[0] += sigs[7]
	sigs[3] += sigs[7]
	sigs[9] += sigs[7]

	sigs[9] += sigs[4]

	fmt.Println(sigs)
	return sigs
}

func runPart2(input []string) {
	line := "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf"
	lineSplit := strings.Split(line, " | ")
	inputSigs := strings.Split(lineSplit[0], " ")
	// outputSigs := strings.Split(lineSplit[1], " ")

	getSegList(inputSigs)
}

func main() {
	// input, _ := utils.ReadInput("./input.txt")
	input, _ := utils.ReadInput("./sample_input.txt")

	// runPart1(input)
	runPart2(input)
}
