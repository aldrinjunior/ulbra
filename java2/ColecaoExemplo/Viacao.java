import java.util.ArrayList;

public class Viacao {
  private String nomeViacao;
  private ArrayList<Onibus> listaOnibus;

  public Viacao(String nomeViacao) {
    this.nomeViacao = nomeViacao;
    this.listaOnibus = new ArrayList<Onibus>();
  }
}