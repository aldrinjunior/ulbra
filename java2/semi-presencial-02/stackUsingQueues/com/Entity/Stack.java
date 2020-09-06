package com.Entity;

import java.util.LinkedList;
import java.util.Queue;

public class Stack {
  Queue<Integer> queue;

  public Stack() {
    queue = new LinkedList<>();
  }

  public void push(int x) {
    Queue<Integer> queueList = new LinkedList<>();
    queueList.add(x);
    queueList.addAll(queue);
    queue = queueList;
    System.out.println(queue);
  }

  public int top() {
    return queue.peek();
  }
}