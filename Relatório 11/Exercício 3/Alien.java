public class Alien extends Entidades {

    private String planetaorigem;
    private String ovni;

    public Alien(String nome, String planetaorigem, String ovni) {
        super(nome, null); 
        this.planetaorigem = planetaorigem;
        this.ovni = ovni;
    }

    @Override
    public String obterCoordenadas() {
        return "A entidade Alien " + nome + " do planeta " + planetaorigem + " em " + ovni;
    }
}
