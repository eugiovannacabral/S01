public class Main {
  
    public static void main(String[] args) {
        // Criação dos ataques
        PadraoAtaque ataque1 = new PadraoAtaque("Ataque Supremo", 150);
        PadraoAtaque ataque2 = new PadraoAtaque("Explosão maxima", 1009);
        PadraoAtaque ataque3 = new PadraoAtaque("Facada com um dedo de lamina", 234);

        Boss boss1 = new Boss("SuperBoss", "qwyu", "Soco Poderoso");
        boss1.adicionarAtaque(ataque2);

        BossMagico boss2 = new BossMagico("MagoBoss", "yyio", "Magia dos Arcanjos");
        boss2.adicionarAtaque(ataque1);
        boss2.adicionarAtaque(ataque3);

        
        Batalha encontro = new Batalha();
        encontro.adicionarBoss(boss1);
        encontro.adicionarBoss(boss2);

      
        encontro.iniciarBatalha("qwyu");
        encontro.iniciarBatalha("yyio");
        encontro.iniciarBatalha("456Yt"); 
    }
}
