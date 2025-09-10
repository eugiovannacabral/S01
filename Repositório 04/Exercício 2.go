package main

import "fmt"

func main() {
	var num int
	//var resultado int

	fmt.Print("Digite um número: ")
	fmt.Scanln(&num)

	resultado := num % 2 //:= cria outra variável nova, não usa a anterior.
	
	switch resultado {
	case 0:
			fmt.Println("O número é par")
	default:
			fmt.Println("O número é ímpar")
	}

}
