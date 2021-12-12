package main

import (
	"fmt"
	"strconv"
	"strings"
	"sync"

	utils "github.com/arjunmahishi/advent-of-code/utils/go"
)

type fish struct {
	timer int
}

func (f *fish) incr() *fish {
	if f.timer == 0 {
		f.timer = 6
		return &fish{8}
	}

	f.timer--
	return nil
}

type school []*fish

func (s *school) incr() {
	for _, fish := range *s {
		if newFish := fish.incr(); newFish != nil {
			*s = append(*s, newFish)
		}
	}
}

type schools []school

func (s *schools) count() int {
	count := 0
	for _, school := range *s {
		count += len(school)
	}

	return count
}

func run(input []string, days int) {
	lineSplit := strings.Split(input[0], ",")
	batchSize := 50
	schools := schools{}

	school := school{}
	for _, strTime := range lineSplit {
		if len(school) == batchSize {
			schools = append(schools, school)
			school = []*fish{}
		}

		numTime, _ := strconv.Atoi(strTime)
		school = append(school, &fish{timer: numTime})
	}

	if len(school) > 0 {
		schools = append(schools, school)
	}

	var wg sync.WaitGroup
	for s := 0; s < len(schools); s++ {
		wg.Add(1)
		go func(s int) {
			for i := 0; i < days; i++ {
				schools[s].incr()
			}
			wg.Done()
		}(s)
	}

	wg.Wait()
	fmt.Printf("Count: %d\n", schools.count())
}

func runPart1(input []string) {
	run(input, 80)
}

func runPart2(input []string) {
	// run(input, 256)
}

func main() {
	// input, _ := utils.ReadInput("./sample_input.txt")
	input, _ := utils.ReadInput("./input.txt")

	runPart1(input)
	runPart2(input)
}
