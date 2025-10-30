//cRIEI GETTERS E SETTERS PARA OS ARGUMENTOS PRIVADOS 
class Pokemon {
    #vida = 0;

    constructor(nome, tipo, vidaInicial) {
        this.nome = nome;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }
    getVida() {
        return this.#vida;
    }

    setVida(novaVida) {
      if (novaVida >= 0) {
      this.#vida = novaVida;
      }else {
        console.log("Valor de vida inválido!");
      }
    }

    receberDano(dano) {
      const vidaAntes = this.#vida;     
      this.#vida -= dano;               
      
      if (this.#vida < 0) 
      this.#vida = 0;
      const vidaPerdida = vidaAntes - this.#vida;  
      
    console.log(`${this.nome} perdeu ${vidaPerdida} de vida!`);
}

  atacar(alvo) {
    console.log(`${this.nome} atacou ${alvo.nome}`);
    alvo.receberDano(2); //dano fixo de menos 2 pontos no adversario
  }

}
class PokemonFogo extends Pokemon { //HERANÇA DA CLASSE MAE
    
    constructor(nome, vidaInicial, bonusAtaque) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = bonusAtaque;
  }

  atacar(alvo) {
    const dano = 5 + this.bonusAtaque; //é o dano fixo desse pokemon mais o bonus de dano
    
    console.log(`${this.nome} lançou fogo em ${alvo.nome}!`);
    alvo.receberDano(dano);
  }
}

class PokemonAgua extends Pokemon {
  #curaBase; 

  constructor(nome, vidaInicial, curaBase) {
    super(nome, "Água", vidaInicial);
    this.#curaBase = curaBase;
  }

  get curaBase() {
    return this.#curaBase;
  }

  set curaBase(valor) {
    if (valor >= 0) {
      this.#curaBase = valor;
    } else {
      console.log("Valor de cura inválido!");
    }
  }

  atacar(alvo) {
    const dano = 15;
    console.log(`${this.nome} deixou ${alvo.nome} com osmose de tanta água!`);
    alvo.receberDano(dano);
  }

}

const pk1 = new PokemonFogo("Foguinho", 40, 10);
const pk2 = new PokemonAgua("Aquagirl", 78, 3);

pk1.atacar(pk2);
pk2.atacar(pk1);

console.log(`\n ${pk1.nome} possui ${pk1.getVida()} de vida`);
console.log(`${pk2.nome} possui ${pk2.getVida()} de vida`);
