package main

import "fmt"

func main() {
	fmt.Println("vim-go")
	i := 13
	j := 2

	for {
		if i == j || i == 0 || j == 0 || i == 1 || j == 1 {
			break
		}
		if i > j {
			i = i % j
			j -= i
		} else {
			j = j % i
			i -= j
		}
		fmt.Printf("i=%v,j=%v\n", i, j)
	}

	i = 100
	i = ^i
	fmt.Println(i)
	i++
	fmt.Println(i)
	i = ^i
	fmt.Println(i)
	i++
	fmt.Println(i)
}
