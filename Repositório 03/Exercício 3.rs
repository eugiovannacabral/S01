use std::io;

fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) { 
    for i in limite_inferior..=limite_superior {
        println!("Resultado: {} x {} = {}", numero, i, numero * i);
    }
}

fn main() {
    let mut numero = String::new();          
    let mut limite_inferior = String::new(); 
    let mut limite_superior = String::new(); 

    println!("Digite qual número da tabuada: ");
    io::stdin()
        .read_line(&mut numero)
        .expect("Erro ao ler");
    let numero: i32 = numero.trim().parse().expect("Por favor, digite um número válido");

    println!("Digite um limite inferior: ");
    io::stdin()
        .read_line(&mut limite_inferior)
        .expect("Erro ao ler");
    let limite_inferior: i32 = limite_inferior.trim().parse().expect("Por favor, digite um número válido");

    println!("Digite um limite superior: ");
    io::stdin()
        .read_line(&mut limite_superior)
        .expect("Erro ao ler");
    let limite_superior: i32 = limite_superior.trim().parse().expect("Por favor, digite um número válido");

    imprimir_tabuada(numero, limite_inferior, limite_superior);
}
