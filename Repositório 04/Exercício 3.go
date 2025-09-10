package main

import "fmt"

func fibonacci(n int) {
	var a int = 0
	var b int = 1
	var i int = 0
	
	for i < n {
		
		fmt.Print(a, " ")
		a, b = b, a+b // vai atualizando os numeros da sequencia de fibonacci os 2 primeiros numeros sendo 0 e 1
		i++
	}
	fmt.Println()
}

func main() {
	var n int

	fmt.Print("Até quantos números você quer na sequência de Fibonacci? ")
	fmt.Scanln(&n)

	fibonacci(n) // apenas chama, não precisa imprimir retorno
}
