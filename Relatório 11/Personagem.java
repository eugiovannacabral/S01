public class Personagem {
    // Encapsulamento: Atributos privados
    private String nome;
    private int idade;

    // Construtor
    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    // Getters
    public String getNome() {
        return nome;
    }

    public int getIdade() {
        return idade;
    }

    // Setter (Exemplo de controle de acesso)
    public void setNome(String nome) {
        this.nome = nome;
    }
    
}