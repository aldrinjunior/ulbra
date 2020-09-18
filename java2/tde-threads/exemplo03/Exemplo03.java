public class Exemplo03 {
  public void run() {
    for (int i = 0; i < 6; i++) {
      System.out.println(Thread.currentThread().getName() + " :" + i);
    }
  }
}

public class Exemplo03Main {
  public static void main(String[] args) {
    Exemplo03 ex3 = new Exemplo03();
    Thread t = new Thread(ex3, "Thread Ex3");
    t.start();
    System.out.println("Thread em execução = " + Thread.currentThread().getName());
  }
}
