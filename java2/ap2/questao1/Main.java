
// Classe de leitura

public class read()extends Thread {
  private Value value;
  private int valueReader;

  public Read(Value value1, int valueNumber) {
     value = value1;
     valueReader = valueNumber
   }

  public void run() {
    valueReader = value.getValue();
  }
}

// Classe de escrita

public class write() extends Thread {
  private Value value;
  private int valueWriter;

  public Write(Value value1, int valueNumber) {
    value = value1;
    valueWriter = valueNumber;
  
  }

  public void run () {
    value.setValue(valueWriter);
  }

}