import java.util.HashSet;
import java.util.Iterator;
public class Set1{
    public static void main(String[] args){
       HashSet<String> paises = new HashSet<>();
       paises.add("Japao");
       paises.add("Brasil");
       paises.add("Estados Unidos");
       paises.add("Japao");
       paises.add("Brasil");
       System.out.println("Impressao de HashSet:");
       for(String nomePais : paises){
           System.out.println(nomePais);
        }
    }
}