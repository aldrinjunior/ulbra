
public class Exemplo04 implements Runnable {
  public static void main(String args[]) {
    Exemplo4 ex4 = new Exemplo4();
    Thread primeira = new Thread(ex4);
    primeira.setName("Primeira");
    Thread segunda = new Thread(ex4);
    segunda.setName("Segunda");
    Thread terceira = new Thread(ex4);
    terceira.setName("Terceira");
    primeira.start();
    segunda.start();
    terceira.start();
  }
}