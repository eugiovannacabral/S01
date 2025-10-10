using System;


public abstract class MonstroSombrio
{
    public string Nome { get; protected set; }

    public MonstroSombrio(string nome)
    {
        Nome = nome;
    }

    
    public abstract void Mover();
}


public class Zumbi : MonstroSombrio
{
    public Zumbi(string nome) : base(nome) { }

    public override void Mover()
    {
        Console.WriteLine($"{Nome} (Zumbi) está se arrastando lentamente...");
    }
}


public class Espectro : MonstroSombrio
{
    public Espectro(string nome) : base(nome) { }

    public override void Mover()
    {
        Console.WriteLine($"{Nome} (Espectro) está flutuando velozmente pelas sombras!");
    }
}


public class Program
{
    public static void Main()
    {
        //tipo matriz
        MonstroSombrio[] horda = new MonstroSombrio[]
        {
            new Zumbi("Zumbi Putrefato"),
            new Zumbi("Zumbi Enfurecido"),
            new Espectro("Espectro Sombrio"),
            new Espectro("Espírito Errante")
        };

        Console.WriteLine("Os monstros despertam na masmorra\n");


        foreach (MonstroSombrio criatura in horda)
        {
            criatura.Mover();
        }

        Console.WriteLine("Os monstrons estao chegando noo herói");
    }
}
