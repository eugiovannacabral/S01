import java.util.*;

public class Main {
  
    public static void main(String[] args) {
      
        Poder poder1 = new Poder("Abducão");
        Poder poder2 = new Poder("Paralisia da mente");

        Alien alien1 = new Alien("ETMINHACASA", "Green", "Bicicleta");
        Youkai youkai1 = new Youkai("Youkaiyou", "Subssolo", poder2);

        Registros registro = new Registros("Equipe extraterrestre");

        registro.registrarAvistamento(alien1);
        registro.registrarAvistamento(youkai1);
        registro.registrarAvistamento(youkai1); // teste duplicado

        registro.listarAvistamentos();
    }
}
