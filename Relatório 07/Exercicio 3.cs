using System;
using System.Collections.Generic;

class Feitico
{
    public string Nome { get; set; }

    public Feitico(string nomeFeitico)
    {
        Nome = nomeFeitico;
    }
}

class Grimorio // composição de Feitiços
{
    public List<Feitico> ListaDeFeiticos { get; set; } = new List<Feitico>();

    public void AdicionarFeitico(Feitico novoFeitico)
    {
        ListaDeFeiticos.Add(novoFeitico);
    }

    public void MostrarFeiticos()
    {
        Console.WriteLine("Feitiços:");
        foreach (var itemFeitico in ListaDeFeiticos)
        {
            Console.WriteLine(itemFeitico.Nome);
        }
    }
}

class Ferramenta
{
    public string Nome { get; set; }

    public Ferramenta(string nomeFerramenta)
    {
        Nome = nomeFerramenta;
    }
}

class Maga // possui Grimório (composição) e usa Ferramentas (agregação)
{
    public string Nome { get; set; }
    public Grimorio GrimorioDeFeiticos { get; set; }
    public List<Ferramenta> ConjuntoDeFerramentas { get; set; }

    public Maga(string nomeMaga, List<Ferramenta> ferramentasDisponiveis)
    {
        Nome = nomeMaga;
        GrimorioDeFeiticos = new Grimorio();
        ConjuntoDeFerramentas = ferramentasDisponiveis;
    }

    public void MostrarEquipamentos()
    {
        Console.WriteLine($"Maga: {Nome}");
        Console.WriteLine("Ferramentas:");
        foreach (var ferramenta in ConjuntoDeFerramentas)
        {
            Console.WriteLine(ferramenta.Nome);
        }
    }
}

class Program
{
    static void Main()
    {
        List<Ferramenta> ferramentasParaFrieren = new List<Ferramenta>
        {
            new Ferramenta("Cajado Arcano"),
            new Ferramenta("Lanterna Mágica"),
            new Ferramenta("Poção de Mana")
        };

        Maga magaFrieren = new Maga("Frieren", ferramentasParaFrieren);

        magaFrieren.GrimorioDeFeiticos.AdicionarFeitico(new Feitico("Bola de Fogo"));
        magaFrieren.GrimorioDeFeiticos.AdicionarFeitico(new Feitico("Escudo Arcano"));
        magaFrieren.GrimorioDeFeiticos.AdicionarFeitico(new Feitico("Cura Celestial"));

        magaFrieren.MostrarEquipamentos();
        Console.WriteLine();
        magaFrieren.GrimorioDeFeiticos.MostrarFeiticos();
    }
}
