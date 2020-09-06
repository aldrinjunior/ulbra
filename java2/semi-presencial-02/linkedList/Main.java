// https://dzone.com/articles/20-linked-list-interview-questions-for-java-progra

// How do you find the middle element
// of a singly linked list in one pass?

import com.entity.*;

public class Main {
  public static void main(String[] args) {
    LinkedList linkedList = new LinkedList();

    LinkedList.Node head = linkedList.head(); // 0
    linkedList.add(new LinkedList.Node("1")); // 1
    linkedList.add(new LinkedList.Node("2")); // 2
    linkedList.add(new LinkedList.Node("3")); // 3
    linkedList.add(new LinkedList.Node("4")); // 4

    LinkedList.Node current = head;
    int lenght = 0;
    LinkedList.Node middle = head;

    while (current.next() != null) {
      lenght++;
      if (lenght % 2 == 0) {
        middle = middle.next();
      }
      current = current.next();
    }

    if (lenght % 2 == 1) {
      middle = middle.next();
    }

    System.out.println("Tamanho total da lista:" + lenght);
    System.out.println("Elemento do meio da lista:" + middle);

  }
}
