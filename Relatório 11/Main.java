import java.util.*;

public class Main {
  
    public static void main(String[] args) {
      
        Castelo castelo = new Castelo("Castelo Animado");

        castelo.adicionarDivisao("Quarto da Sophie");
        castelo.adicionarDivisao("Salão de Feitiços");
        castelo.adicionarDivisao("Banheiro");

        castelo.listarDivisoes();

        Mago mago = new Mago("Maga Sophie", 15 , "Chama coração roxo");
        
        System.out.println(mago.lancarFeitico());
    }

}