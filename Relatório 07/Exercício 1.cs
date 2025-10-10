using System;
//using System.Collection.Generic; //necessario quando for usar List

public class MembroDaSociedade
{
    private string nome;
    private string raca;
    private string funcao_membro;

    //Construtor da classe que força a inicialização dos atributos
    public MembroDaSociedade(string nome, string raca, string funcao_membro)
    {
        this.nome = nome; 
        this.raca = raca;
        this.funcao_membro = funcao_membro;
    }

    //Método Descrever() 
    public void Descrever()
    {   					//escreve a oq vai sair do código
        Console.WriteLine($"Raça: {raca}");
    	Console.WriteLine($"Função: {funcao_membro}");
    	Console.WriteLine();

    }
}

class Program
{
    static void Main(string[] args)
    {
        // Cria instâncias usando o Construtor 
        MembroDaSociedade Aragorn = new MembroDaSociedade("Aragorn", "Humano", "Guardião");
        MembroDaSociedade Legolas  = new MembroDaSociedade("Legolas", "Elfo", "Arqueiro");
        Aragorn.Descrever();
        Legolas.Descrever();
    }
}
