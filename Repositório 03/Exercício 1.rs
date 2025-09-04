use std::io;

fn verificar_senha(senha: &str) -> bool { 
    if senha.len() < 8 {
        return false;
    }

    let mut n = false;
    let mut letra_maiuscula = false;

    for c in senha.chars() {
        if c.is_digit(10) {
            n = true;
        }
        if c.is_ascii_uppercase() {
            letra_maiuscula = true;
        }
    }

    n && letra_maiuscula // retorno da função
}

fn main() {
    loop {
        println!("Digite a senha: ");
        let mut senha = String::new();

        io::stdin()
            .read_line(&mut senha)
            .expect("Falha ao ler entrada");

        let senha = senha.trim(); 

        if verificar_senha(senha) {
            println!("Senha válida! Acesso Concedido!");
            break; // sai do loop
        } 
    }
}
