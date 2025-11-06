import java.util.HashMap;

public class Registros {
  
    public String nomeEquipe;
    
    private HashMap<String, Entidades> avistamentos;

    public Registros(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this.avistamentos = new HashMap<>(); //permite que só adcione um avez cada entidade
    }

    public boolean registrarAvistamento(Entidades entidade) {
                                        // verifica se já existe uma entidade com o mesmo nome
    if (avistamentos.containsKey(entidade.getNome())) {
        return false; // não adiciona de novo
    } else {
        avistamentos.put(entidade.getNome(), entidade); // adiciona no mapa
        return true; //adicionado
      }
    }
  

    public void listarAvistamentos() {
      
        System.out.println("\n Registro da " + nomeEquipe + ":");
        for (Entidades e : avistamentos.values()) {
          
            System.out.println("-" + e.obterCoordenadas());
        }
    }
}
