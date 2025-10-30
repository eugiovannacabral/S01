class IRastreavel {
  rastrearLocal(lat, long) {
    throw new Error("Este método deve ser implementado!");
  }
}

class Hunter extends IRastreavel {
  #nome;
  #idade;
  #localizacao;

  constructor(nome, localizacao, idade) {
    super();
    this.#nome = nome;
    this.#localizacao = localizacao;
    this.#idade = idade;
  }

  // os getters e os setters para os metodos protegidos
  get nome() {
    return this.#nome;
  }

  set nome(novoNome) {
    this.#nome = novoNome;
  }

  get idade() {
    return this.#idade;
  }

  set idade(novaIdade) {
    if (novaIdade > 0) {
      this.#idade = novaIdade;
    } else {
      console.log("Essa idade é invalida!");
    }
  }

  get localizacao() {
    return this.#localizacao;
  }

  set localizacao(novaLocal) {
    this.#localizacao = novaLocal;
  }
}


class Especialista extends Hunter {
  #habilidadeNen;

  constructor(nome, localizacao, idade, habilidadeNen) {
    super(nome, localizacao, idade);
    this.#habilidadeNen = habilidadeNen;
  }

  get habilidadeNen() {
    return this.#habilidadeNen;
  }

  set habilidadeNen(novaHab) {
    this.#habilidadeNen = novaHab;
  }

  rastrearLocal(lat, long) {
    return `${this.nome} (Possui  em ${this.#habilidadeNen}) rastreou coordenadas (${lat}, ${long})`;
  }
}


class Manipulador extends Hunter {
  #alvoAtual;

  constructor(nome, localizacao, idade, alvoAtual) {
    super(nome, localizacao, idade);
    this.#alvoAtual = alvoAtual;
  }

  get alvoAtual() {
    return this.#alvoAtual;
  }

  set alvoAtual(novoAlvo) {
    this.#alvoAtual = novoAlvo;
  }

  rastrearLocal(lat, long) {
    return `${this.nome} está manipulando o alvo ${this.#alvoAtual} com as coordenadas (${lat}, ${long})`;
  }
}

// Classe Batalhão
class Batalhao {
  #hunters;

  constructor() {
    this.#hunters = new Set();
  }

  adicionarHunter(hunter) {
    for (const h of this.#hunters) {
      if (h.nome === hunter.nome) {
        console.log(`O Hunter ${hunter.nome} está presente!`);
        return;
      }
    }
    this.#hunters.add(hunter);
    console.log(`O Hunter ${hunter.nome} foi inserido no batalhão`);
  }

  getNumHunters() {
    return this.#hunters.size;
  }

  iniciarRastreamento(lat, long) {

    for (const h of this.#hunters) {
      console.log(h.rastrearLocal(lat, long));
    }
  }

  get hunters() {
    return [...this.#hunters];
  }
}


const membro1 = new Especialista("Yirumira", "Paraiso do Japao", 14, "Unity");
const membro2 = new Manipulador("Mitsoki", "Montanhas ao ceu", 17, "Russel");

const batalhao = new Batalhao();
batalhao.adicionarHunter(membro1);
batalhao.adicionarHunter(membro2);
batalhao.adicionarHunter(membro1);

membro1.habilidadeNen = "Unity elevou de nível";
membro2.idade = 18;

batalhao.iniciarRastreamento("29,34", "-75.86");

console.log(`\nTotal de Hunters: ${batalhao.getNumHunters()}`);
