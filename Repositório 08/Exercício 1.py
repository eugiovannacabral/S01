class Personagem:

    def __init__(self, vida: int, resistencia: int):
        self._vida = vida
        self._resistencia = resistencia

    def get_vida(self):
        return self._vida

    def set_vida(self, nova_vida):
        self._vida = nova_vida

    def __str__(self):
        return f"Personagem com {self._vida} de vida."


class Cavaleiro(Personagem):

    def __init__(self, vida: int, resistencia: int, armadura_pesada: bool):
        # chama o construtor da classe mãe
        super().__init__(vida, resistencia)
        self.__armadura_pesada = armadura_pesada

    def __str__(self):
        return f"Cavaleiro com {self._vida} de vida"

# cria um objeto da classe Cavaleiro
c1 = Cavaleiro(vida=100, resistencia=50, armadura_pesada=True)
print(c1)

# mudando o valor pelos getters e setters
print("Vida atual:", c1.get_vida())
c1.set_vida(80)
print("Nova vida:", c1.get_vida())

