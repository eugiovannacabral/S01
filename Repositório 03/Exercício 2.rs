use std::io;

fn eh_par(soma: i32) -> bool { 
    if soma % 2 == 0 {
        return true;
    }
  else{
      return false;
  }

}

fn main() {

  let mut escolha = String::new();
  let mut j1 = String::new();
  let mut j2 = String::new();

        println!("Escolha entre par ou ímpar: ");
        io::stdin()
          .read_line(&mut escolha)
          .expect("Erro ao ler");
        let escolha = escolha.trim().replace("\r", "").to_lowercase(); // precisei fazer isso pq o console estava buado, acho que erra um erro em na questão de espaço

        println!("Digite um número: ");
        io::stdin()
          .read_line(&mut j1)
          .expect("Erro ao ler");
        let j1: i32 = j1
          .trim()
          .parse()
          .expect("Digite um número válido");

        println!("Digite um número inteiro: ");
        io::stdin()
          .read_line(&mut j2)
          .expect("Erro ao ler");
        let j2: i32 = j2
          .trim()
          .parse()
          .expect("Digite um número válido");

  let soma = j1 + j2;
  
   if eh_par(soma) {
     if escolha == "par" {
         println!("Soma igual a {}. Jogador 1 venceu!", soma);
     } else {
         println!("Soma igual a {}. Jogador 2 venceu!", soma);
     }
   } else {
     if escolha == "ímpar" {
         println!("Soma igual a {}. Jogador 1 venceu!", soma);
     } else {
         println!("Soma igual a {}. Jogador 2 venceu!", soma);
     }
   }
    
}
