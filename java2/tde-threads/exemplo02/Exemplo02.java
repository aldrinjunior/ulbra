public class Exemplo02 extends Thread {

  Exemplo02(String nomeThread) {
    super(nomeThread);
  }

  public void run() {
    for (int i = 0; i < 6; i++) {
      System.out.println(this.getName() + ":" + i);
    }
  }
}

public class Exemplo02Main {
  public static void main(String[] args) {
    Exemplo02 ex2 = new Exemplo02("Thread Ex2");
    ex2.start();
    System.out.println("Thread em execução = " + Thread.currentThread().getName());
  }
}
