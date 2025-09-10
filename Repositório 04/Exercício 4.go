package main

import "fmt"

func verificarLogin(usuario, senha string) bool{
	
	if usuario == "senha" && senha == "admin"{
		return true
	}else{
		return false
	}
}

func main() {
	var usuario string
	var senha string

	for{
	fmt.Print("Digite seu usuário: ")
	fmt.Scanln(&usuario)

	fmt.Print("Digite sua senha: ")
	fmt.Scanln(&senha)

	if verificarLogin(usuario, senha) == true{
		fmt.Println("Login bem-sucessido!")
		break
		
	}else{
		fmt.Println("Usuário ou senha incorretos. Tente novamente.")
	}
	}
}
