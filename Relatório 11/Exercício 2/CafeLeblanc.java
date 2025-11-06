public class CafeLeblanc {

  private Menu menu;
  
  public CafeLeblanc(Menu menu){
    this.menu = menu;
 }
  
  public void receberPedido(Cafe cafe) {
    menu.adicionarItem(cafe);
    
    System.out.println("Pedidos : " + cafe.nome);
    }

  public void exibirMenu() {
    
    menu.mostrarMenu();
  }

  
}