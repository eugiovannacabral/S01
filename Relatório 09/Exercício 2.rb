class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError, "Não não não, esse método é só para as classes filhas!"
  end
end


class Pianista < Musico
  def tocar_partitura(peca)
    puts "#{@nome} realiza a peça '#{peca}' no piano."
  end
end


class Violinista < Musico
  def tocar_partitura(peca)
    puts "#{@nome} realiza a peça '#{peca}' com o violino."
  end
end


class Maestro
  def initialize(musicos)
    @musicos = musicos
  end

  def iniciar_ensaio(peca)
    puts "\nO Maestro inicia o ensaio da obra '#{peca}"
    @musicos.each do |m|
      m.tocar_partitura(peca)  # Polimorfismo: cada músico executa seu próprio método
    end
  end

  def ajustar_foco(estado)
    @musicos.each do |m|
      puts "\n#{m.nome} agora está #{estado} e pode para tocar."
    end
  end
end

# MAIN 
# incicializando com atribuições
m1 = Pianista.new("Layla", "Piano")
m2 = Violinista.new("Zeca", "Violino")

maestro = Maestro.new([m1, m2])


print "Digite o nome da peça: "
peca = gets.chomp

maestro.ajustar_foco("concentrado")
maestro.iniciar_ensaio(peca)
