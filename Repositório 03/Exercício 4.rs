use std::io;

fn calcular_media(n1: f64, n2: f64, n3: f64)-> f64 { 

  (n1 * 2.0 + n2 * 3.0 + n3 * 5.0) / 10.0
}

fn main() {
    let mut n1 = String::new();          // declarando a variável
    let mut n2 = String::new(); // declarando a variável
    let mut n3 = String::new(); // declarando a variável

    println!("Digite sua primeira nota: ");
    io::stdin()
        .read_line(&mut n1)
        .expect("Erro ao ler");
    let n1: f64 = n1.trim().parse().expect("Por favor, digite um número válido");

    println!("Digite sua segunda nota: ");
    io::stdin()
        .read_line(&mut n2)
        .expect("Erro ao ler");
    let n2: f64 = n2.trim().parse().expect("Por favor, digite um número válido");

  println!("Digite sua terceira nota: ");
  io::stdin()
      .read_line(&mut n3)
      .expect("Erro ao ler");
  let n3: f64 = n3.trim().parse().expect("Por favor, digite um número válido");

    
  if calcular_media(n1, n2, n3) >= 7.0 {
    println!("Aprovado");
  }
  else{
    println!("Reprovado");
  }
}
