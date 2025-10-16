from abc import ABC, abstractmethod

# Usando método de interfaces
class Heroi(ABC):
    def __init__(self, nome, funcao):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod  # força que as classes filhas usem esse método
    def usar_ultimate(self):
        pass


class Tanque(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} ativar modo ataque!")


class Dano(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} cuidado com o dano!")


if __name__ == "__main__":
    print("=== Overwatch - Simulação de Ultimates ===\n")

    herois = [Tanque("Heroi1", "Tanque"), Dano("Heroi2", "Dano")]

    for heroi in herois: #percorrendo a lista com o for
        heroi.usar_ultimate()
