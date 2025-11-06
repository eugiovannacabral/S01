public class CafeGourmet extends Cafe {

  public Double bonusaroma;
  
  public CafeGourmet(String nome, Double precobase, Double bonusaroma){
    super(nome, precobase);
    this.bonusaroma = bonusaroma;
 }
  
  @Override
   public Double calcularPrecoFinal(){
    return precobase + bonusaroma;
  }

}