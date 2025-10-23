class Drink
  
  attr_reader :nome # esse é o getter faz a leitura , o attr_writer faz a atribuição(setter) e o attr_accessor faz os dois juntos 

  def initialize(nome, preco_base) #construtor
    @nome = nome
    self.preco_base = preco_base
  end

  def preco_base
    @preco_base
  end

  def preco_base=(valor)
    if valor > 0
      @preco_base = valor
    else
      raise "O preço base precisa ser maior que 0!" #interrompe a execução do programa naquele ponto e mostra uma mensagem de erro, evita que o objeto seja criado com dados inválidos
    end
  end

  def preco_final
    @preco_base
  end

  def to_s
    "Drink: #{@nome} | Preço Base: $#{@preco_base}"
  end
end


class DrinkLenda < Drink
  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @anos_desde_criacao = anos_desde_criacao
  end

  def preco_final
    @preco_base + (5 * @anos_desde_criacao)
  end

  def to_s
  "Drink Lenda: #{@nome}\nPreço Base: $#{@preco_base}\nAnos: #{@anos_desde_criacao}"
end
end

# MAIN
puts "Digite o nome: "
nome = gets.chomp

puts "Digite o seu preço base: "
preco = gets.chomp.to_f

puts "Digite os anos de criação (0 se for um drink comum): "
anos = gets.chomp.to_i

if anos > 0
  drink = DrinkLenda.new(nome, preco, anos)
else
  drink = Drink.new(nome, preco)
end

puts
puts drink.to_s
puts "Preço final: $#{drink.preco_final}"
