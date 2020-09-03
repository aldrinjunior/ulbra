import java.util.HashSet;
import java.util.Iterator;
public class Set2{
    public static void main(String[] args){
       HashSet<String> paises = new HashSet<>();
       paises.add("Japao");
       paises.add("Brasil");
       paises.add("Estados Unidos");
       paises.add("Japao");
       paises.add("Brasil");
       if(paises.contains("Brasil")){
          System.out.println("O conjunto contem Brasil");
       }
    }
}