public class BossMagico extends Boss {

    public BossMagico(String nome, String idBoss, String fracoContra) {
        super(nome, idBoss, fracoContra);
    }

    @Override
    public void iniciarFase() {
        System.out.println("\nBatalha direto em " + nome);
        System.out.println("Fraqueza: " + getPontoFraco());
        System.out.println("Ataques arcanos:");
        for (PadraoAtaque atk : getMoveset()) {
            System.out.println("-" + atk);
        }
    }
}
