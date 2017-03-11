package org.shibayu36.algorithms;

import java.util.NoSuchElementException;

public class RandomizedQueue<Item> {
  private Item[] queue;
  private int N;

  public RandomizedQueue() {
    N = 0;
    queue = (Item[]) new Object[1];
  }

  public boolean isEmpty() {
    return N == 0;
  }

  public int size() {
    return N;
  }

  public void enqueue(Item item) {
    // queueのサイズが足りなくなったら配列を2倍にする
    if (N == queue.length) this.resize(2 * queue.length);
    queue[N++] = item;
  }

  public Item dequeue() {
    if (this.isEmpty()) {
      throw new NoSuchElementException();
    }

    int i = (int) (Math.random() * N);
    Item item = queue[i];
    queue[i] = queue[N - 1];
    queue[N - 1] = null;
    N--;

    // queueの長さが総容量の1/4以下になったらqueueを1/2に縮める
    if (0 < N && N <= queue.length / 4) this.resize(queue.length / 2);

    return item;
  }

  private void resize(int capacity) {
    Item[] newQueue = (Item[]) new Object[capacity];
    for (int i = 0; i < N; i++) {
      newQueue[i] = queue[i];
    }
    queue = newQueue;
  }
}
