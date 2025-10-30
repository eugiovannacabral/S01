class Diario {
  
  #autorSecreto;
  constructor(autor) {
    this.#autorSecreto = autor;
    this.enigmas = new Map();        
    this.criaturasAvistadas = [];    
  }

  getAutor() {       //so mantive o getter e o setter pois é um atributo privado
    return this.#autorSecreto;
  }

  setAutor(novoAutor) {
    if (typeof novoAutor === "string" && novoAutor.trim() !== "") {
      this.#autorSecreto = novoAutor;
      console.log(`Autor secreto atualizado para: ${novoAutor}`);
    } else {
      console.log("Autor inválido!");
    }
  }
  
  adicionarEnigma(num, enigma) {
    this.enigmas.set(num, enigma);
  }

  decodificar(chave, num) {
    
    if (chave === this.#autorSecreto && this.enigmas.has(num)) {
      return `Enigma decifrado: ${this.enigmas.get(num)}`;
    } else {
      return "Chave incorreta !";
    }
  }
}

class Criatura {
  constructor(nome, perigosa) {
    this.nome = nome;
    this.perigosa = perigosa;
  }
}


class Personagem {
  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }
}


class Protagonista extends Personagem {
  constructor(nome, idade, autorDiario) {
    super(nome, idade);
    this.diario = new Diario(autorDiario); 
  }
}


class CabanaMisterio {
  constructor(diario) {
    this.visitantes = [];   
    this.funcionarios = []; 
    this.diario = diario;
  }

  adicionarFuncionario(personagem) {
    this.funcionarios.push(personagem);
  }

  listarFuncionarios() {
    return this.funcionarios;
  }
}


const mabel = new Protagonista("Mabel", 13, "Mabel");

mabel.diario.adicionarEnigma(1, "O segredo da porta trancada na colina.");
mabel.diario.adicionarEnigma(2, "As vozes que ecoam no bosque à meia-noite.");

console.log(mabel.diario.decodificar("Mabel", 1)); 
console.log(mabel.diario.decodificar("Luna", 2)); 

const esqueleto = new Criatura("Esqueleto", true);
const duende = new Criatura("Duende Verde", false);

mabel.diario.criaturasAvistadas.push(esqueleto, duende);

const cabana = new CabanaMisterio(mabel.diario);
const elara = new Personagem("Elara", 21);
const rick = new Personagem("Rick", 30);

cabana.adicionarFuncionario(elara);
cabana.adicionarFuncionario(rick);

console.log("\n Funcionários da Estalagem Lunar ");

for (const f of cabana.listarFuncionarios()) {
  console.log(`${f.nome} tem ${f.idade} anos de experiência nas sombras`);
}
