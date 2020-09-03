import java.util.TreeMap;
public class Map2{
    public static void main(String[] args){
       TreeMap<String,String> notasReal = new TreeMap<>();
       notasReal.put("1","Beija-Flor");
       notasReal.put("2","Tartaruga");
       notasReal.put("5","Garca");
       notasReal.put("10","Arara");
       notasReal.put("20","Mico-Leão Dourado");
       notasReal.put("50","Onça Pintada");
       notasReal.put("100","Garoupa");
       System.out.println("Impressao de TreeMap:");
       for(String chave : notasReal.keySet()){
           String valor=notasReal.get(chave);
           System.out.println("Chave: " + chave + " Valor: " + valor);
        }
    }
}