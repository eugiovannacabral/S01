import java.util.ArrayList;

public class Menu {
  
  private ArrayList<Cafe> itens;
  
  public Menu() {
        this.itens = new ArrayList<>();
  }
  
  public void adicionarItem(Cafe cafe) {
        itens.add(cafe);
    }
  
  public void mostrarMenu() {
    
    System.out.println("\n-Cafeteria do Leblanc-\n");
    System.out.println("Menu :");
    
    for (Cafe c : itens) {
      
      System.out.println(c.nome + " -> R$ " + c.calcularPrecoFinal());
    }
    
  }
  
  
  
}