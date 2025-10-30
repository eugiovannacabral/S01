class IExplorador { //Interface do UML
    explorarTerritorio() {     
        throw new Error(` O território não pode ser explorado`);
    }
}

class Soldado extends IExplorador {
  nome;
  #gear; 

  constructor(nome, modeloGear, gasInicial = 0) {
    super();
    this.nome = nome;

    if (modeloGear instanceof ODM_Gear) {
      this.#gear = modeloGearOrInstance;
      
    } else {
      this.#gear = new ODM_Gear(modeloGear, gasInicial);
    }
  }
  
 // get gear() {
 //   return this.#gear;
 // }

 // set gear(novoGear) {
 // }

  verificarEquipamento() {
    return `${this.nome} possui gear de  ${this.#gear.modelo} com  ${this.#gear.getGas()} de gás`;
  }

  explorarTerritorio() {
  
    const gasNecessario = 10;
    const gasConsumido = this.#gear.usarGas(gasNecessario);

    return `${this.nome} explorou usando ${gasConsumido} de gás (restante: ${this.#gear.getGas()})`;
  }

  
  usarGear(quantidade) {
    return this.#gear.usarGas(quantidade);
  }


  getGasDoGear() {
    return this.#gear.getGas();
  }
}


class ODM_Gear {
  modelo;
  #gasRestante; // privado

  constructor(modelo, gasInicial = 0) {
    this.modelo = modelo;
    this.#gasRestante = gasInicial;
  }
  
  get gasRestante() {
    return this.#gasRestante;
  }

  set gasRestante(valor) {
    if (typeof valor !== "number" || valor < 0) {
      console.log("Valor inválido para o gás restante!");
      return;
    }
    this.#gasRestante = valor;
  }

  usarGas(quantidade) {
    
    if (quantidade <= 0) return 0;
    const gasUsado = Math.min(this.#gasRestante, quantidade);
    this.#gasRestante -= gasUsado;
    
    return gasUsado; 
  }

  getGas() {
    return this.#gasRestante;
  }
}


class Esquadrao {
  lider;           
  membros = [];    

  constructor(lider, membrosIniciais = []) {
    if (!(lider instanceof Soldado)) {
      throw new Error(" Precisa ser um Soldado.");
    }
    this.lider = lider;
    membrosIniciais.forEach((m) => this.adicionarMembro(m));
  }

  adicionarMembro(soldado) {
    if (!(soldado instanceof Soldado)) {
      console.warn("Só é permitido adicionar instâncias de Soldado.");
      return;
    }
    this.membros.push(soldado);
  }

  explorarTerritorio() {
    const participantes = [this.lider, ...this.membros]; // esses 3 pontinhos é para tentar espalahar o elemento n array
    const relatorios = participantes.map((s) => s.explorarTerritorio());
    return relatorios.join("\n");
  }

  relatarStatus() {
    const participantes = [this.lider, ...this.membros];
    return participantes.map((s) => s.verificarEquipamento());
  }
}



const s1 = new Soldado("Soldado Armado", "ODM Gear 1", 48);
const s2 = new Soldado("Soldado Branco", "ODM Gear 2", 20);
const s3 = new Soldado("Soldado Kenedy", "ODM Gear 3", 35);

const esquadrao1 = new Esquadrao(s1, [s2]);
esquadrao1.adicionarMembro(s3);

console.log(esquadrao1.explorarTerritorio());
console.log(esquadrao1.relatarStatus());
console.log(`Missão concluída! Gás restante do líder ${s1.nome}: ${s1.getGasDoGear()}`);
