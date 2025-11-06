import java.util.*;

public class Main {
  
    public static void main(String[] args) {
      
        Menu menu = new Menu(); //criando um menu vazio
        
        CafeLeblanc cafeteria = new CafeLeblanc(menu); //composição/ cria a cafeteria e o menu dentro dela como parametro

        Cafe cafe1 = new Cafe("Café com Leite", 4.50);
        Cafe cafe2 = new Cafe("Espresso", 5.0);
        
        CafeGourmet cafe3 = new CafeGourmet("Café com Doce de Leite", 15.0, 2.0);
        CafeGourmet cafe4 = new CafeGourmet("Mocaccino", 10.0, 1.5);

        cafeteria.receberPedido(cafe1);
        cafeteria.receberPedido(cafe2);
        cafeteria.receberPedido(cafe3);
        cafeteria.receberPedido(cafe4);

        cafeteria.exibirMenu();
    }
}
