import java.util.LinkedHashSet;

public class Boss {
    public String nome;
    private String idBoss;
    private String pontoFraco;
    private LinkedHashSet<PadraoAtaque> moveset;

    public Boss(String nome, String idBoss, String fracoContra) {
        this.nome = nome;
        this.idBoss = idBoss;
        this.pontoFraco = fracoContra;
        this.moveset = new LinkedHashSet<>();
    }

    public String getIdBoss() {
        return idBoss;
    }

    public String getPontoFraco() {
        return pontoFraco;
    }

    public LinkedHashSet<PadraoAtaque> getMoveset() {
        return moveset;
    }

    public void adicionarAtaque(PadraoAtaque ataque) {
        moveset.add(ataque);
    }

    public void iniciarFase() {
        System.out.println("\nFases de Ataque " + nome + "");
        System.out.println("Ponto fraco: " + pontoFraco);
        System.out.println("Ataque :" );
        for (PadraoAtaque atk : moveset) {
            System.out.println(atk);
        }
    }
}
