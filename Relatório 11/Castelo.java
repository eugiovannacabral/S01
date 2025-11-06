import java.util.ArrayList;

public class Castelo {
    private String nome;
    private ArrayList<Divisao> divisoes;

    public Castelo(String nome) {
        this.nome = nome;
        this.divisoes = new ArrayList<>();
    }

    
    public void adicionarDivisao(String divisao) { //Escolhi por Composicao por isso criei as divisoes dentro do castelo
        //adcionando como parte do castelo
        Divisao novadivisao = new Divisao(divisao);
        this.divisoes.add(novadivisao);
    }

    public void listarDivisoes() {
       System.out.println("Bem-vindo ao Castelo Animado :)\n");
        System.out.println("Divisões do " + nome + ":");//para cada Divisao d dentro da lista divisoes, execute o bloco de código
        
        for (Divisao d : divisoes) {
            System.out.println(d.getNome());
        }
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
