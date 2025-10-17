from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass


class Implante:
    def __init__(self, tipo, preco):
        self.tipo = tipo
        self.preco = preco


class NetRunner(Cibernetico):
    def __init__(self, codinome, tipo_implante, preco_implante):
        self.codinome = codinome
        self.implante = Implante(tipo_implante, preco_implante)

    def realizar_hack(self):
        print(f"{self.codinome} executa um ataque digital usando {self.implante.tipo} (valor: {self.implante.preco} créditos).")


class Faccao:
    def __init__(self, titulo):
        self.titulo = titulo
        self.agentes = []

    def recrutar(self, novo_agente):
        self.agentes.append(novo_agente)
        print(f"{novo_agente.codinome} agora faz parte da facção {self.titulo}.")

    def iniciar_invasao(self):
        print(f"\n>>> Facção {self.titulo} iniciou uma ofensiva cibernética! <<<\n")
        for agente in self.agentes:
            agente.realizar_hack()


if __name__ == "__main__":
    print("=== Operação Código Fantasma ===\n")

    grupo = Faccao("ZeroTrace")

    agente_a = NetRunner("Vex", "Interface Neural Sigma", 4100)
    agente_b = NetRunner("Nyx", "Módulo de Decodificação Veloz", 3600)
    agente_c = NetRunner("Orion", "Implante de Invisibilidade Digital", 5400)

    grupo.recrutar(agente_a)
    grupo.recrutar(agente_b)
    grupo.recrutar(agente_c)

    grupo.iniciar_invasao()
