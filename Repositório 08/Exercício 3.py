class ArmaCorpoACorpo:

    def __init__(self, nome: str, dano: int):
        self.nome = nome
        self.dano = dano

    def __str__(self):
        return f"Arma: {self.nome} (Dano: {self.dano})"

class P_T:

    def __init__(self, nome: str, arma: str):
        self.nome = nome
        self.arma = arma

    def __str__(self): #esse é aquele metodo que nao precisa colocar print na saida pois ele ja retorna o texto
        return f"{self.nome} usa {self.arma}"


class Joker:
    def __init__(self, nome: str, dano_arma: int, equipe: list[P_T]):

        self.nome = nome
        self.arma = ArmaCorpoACorpo("Faca", dano_arma)
        self.equipe = equipe

    def mostrar_equipe(self):
        print(f"=== Equipe de {self.nome} ===")
        print(self.arma)  
        print("Membros da Phantom Thieves:")
        for membro in self.equipe:
            print(f"-{membro}")

#agregando o valor para visualizar na saida
x1 = P_T("Russinho", "Espada curta")
x2 = P_T("Ana", "Faca a laser")
x3 = P_T("Paulo", "Cajado")

joker = Joker("Personagem Curinga", 75, [x1, x2, x3])


joker.mostrar_equipe()
