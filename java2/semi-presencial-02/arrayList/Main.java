import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

// Given an ArrayList collection in Java, the task is to remove the first element from the ArrayList.

public class Main {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    List<Integer> listInteger = new ArrayList<>();

    listInteger.add(10);
    listInteger.add(20);
    listInteger.add(30);
    listInteger.add(40);
    listInteger.add(50);
    listInteger.add(60);

    System.out.println(listInteger);
    System.out.println("Digite o valor para remover");
    int elementToRemove = scanner.nextInt();
    System.out.println("Remover o elemento :" + elementToRemove);
    listInteger.remove(Integer.valueOf(elementToRemove));
    System.out.println(listInteger);
    scanner.close();
  }
}
