public class Entidades implements IRastreavel{

  public String nome;
  protected String localizacao; //Acabei colocando como protected pois eu estava tendo muito erro com isso nas subclasses
 
  
  public Entidades(String nome, String localizacao){
   this.nome = nome;
   this.localizacao = localizacao;
   
 }

  @Override
  public String obterCoordenadas() {
    
    return "Localização: " + localizacao;
  }
  
  public String getNome() {
        return nome;
  }
    
   public String getLocalizacao() {
        return localizacao;
    }
}


