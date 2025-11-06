public class Youkai extends Entidades {

  private Poder poder;
  //private String localizacao;
  
  public Youkai(String nome, String localizacao, Poder poder){
    super(nome,localizacao);
    this.poder = poder;
    
  }

  @Override
  public String obterCoordenadas() {
    
      return " A entidade Youkai " + nome + " localizado em " + localizacao;
    }

}