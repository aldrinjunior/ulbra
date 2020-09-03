import java.util.ArrayList;
public class Onibus {
private ArrayList<Poltrona> listaPoltronas;
private String origem, destino;
private int codigoOnibus;
public Onibus(String origem, String destino, int codigoOnibus) {
//Ao inicializar um ônibus, a lista de poltronas recebe
//40 poltronas mas sem passageiros cadastrados.
listaPoltronas = new ArrayList<Poltrona>();
for(int i = 1; i<=40; i++){
listaPoltronas.add(new Poltrona(i, null)); 
} 
this.origem = origem;
this.destino = destino;
this.codigoOnibus = codigoOnibus;
} 
}