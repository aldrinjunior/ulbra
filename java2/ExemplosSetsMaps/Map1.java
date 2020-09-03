import java.util.HashMap;
public class Map1{
    public static void main(String[] args){
       HashMap<String,String> notasReal = new HashMap<>();
       notasReal.put("1","Beija-Flor");
       notasReal.put("2","Tartaruga");
       notasReal.put("5","Garca");
       notasReal.put("10","Arara");
       notasReal.put("20","Mico-Leão Dourado");
       notasReal.put("50","Onça Pintada");
       notasReal.put("100","Garoupa");
       System.out.println("Impressao de HashMap:");
       for(String chave : notasReal.keySet()){
           String valor=notasReal.get(chave);
           System.out.println("Chave: " + chave + " Valor: " + valor);
        }
    }
}