using System;
using System.Collections.Generic; //para lista

class Pokemon
{
    public string Nome { get; set; }

    public Elemento Tipo { get; set; }

    public Pokemon(string nome, Elemento tipo)
    {
        Nome = nome;
        Tipo = tipo;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"{Nome} ataque!");
    }
}

class Elemento
{
    public string NomeDoTipo { get; set; }

    public Elemento (string nomeDoTipo)
    {
        NomeDoTipo = nomeDoTipo;
    }
}

class PokemonDeFogo : Pokemon
{
    public PokemonDeFogo(string nome) : base(nome, new Elemento("Fogo")) { }

    		// sobrescreve o método Atacar()
    public override void Atacar()
    {
        Console.WriteLine($"{Nome} lança uma rajada de fogo!");
    }
}

class PokemonDeAgua : Pokemon
{
    public PokemonDeAgua(string nome) : base(nome, new Elemento("Água")) { }

    public override void Atacar()
    {
        Console.WriteLine($"{Nome} lança um jato de água!");
    }
}

class Treinador
{
    public string Nome { get; set; }

    public List<Pokemon> Pokemons { get; set; }

    public Treinador(string nome)
    {
        Nome = nome;
        Pokemons = new List<Pokemon>();
    }

    public void AdicionarPokemon(Pokemon p)
    {
        Pokemons.Add(p);
    }

    public void AcaoAtaque()
    {
        Console.WriteLine($"\n{Nome} Pokémons ao ataque");
        foreach (var p in Pokemons)
        {
            p.Atacar();  // polimorfismo
        }
    }
}

class Program
{
    static void Main(string[] args)
    {
        
        Treinador ash = new Treinador("Ash Ketchum");
        Pokemon charizard = new PokemonDeFogo("Charizard");
        Pokemon blastoise = new PokemonDeAgua("Blastoise");

        ash.AdicionarPokemon(charizard);
        ash.AdicionarPokemon(blastoise);

        ash.AcaoAtaque();

        Console.WriteLine();
    }
}
