package main

import "fmt"

func classificar_numero(num int) string {
	if num > 0 {
		return "Positivo" // em go não pode fazer print em um função sem ser a main
		
	} else if num < 0 {
		return "Negativo"
		
	} else {
		return "Zero"
	}
}

func main() {
	var num int

	fmt.Print("Digite um número: ")
	fmt.Scanln(&num)

	fmt.Println(classificar_numero(num))
}
