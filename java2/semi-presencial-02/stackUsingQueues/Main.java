
// LeetCode 225. Implement Stack using Queues (Java)

// Implement the following operations of a stack using queues.

// push(x) — Push element x onto stack.
// top() — Get the top element.

// Stack = LIFO Last in First Out

// Queue = FIFO First in First Out

import com.Entity.Stack;
import java.util.Queue;

public class Main {

  public static void main(String[] args) {
    Stack stack = new Stack();

    stack.push(1);
    stack.push(2);
    stack.push(3);
    stack.push(4);
    stack.push(5);
    stack.push(6);
    stack.push(7);

    System.out.println(stack.top());

  }

}
