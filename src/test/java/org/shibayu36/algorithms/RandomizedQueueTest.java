package org.shibayu36.algorithms;

import static org.assertj.core.api.Assertions.assertThat;
import java.util.ArrayList;

import java.util.List;
import org.junit.Test;

public class RandomizedQueueTest {

  @Test
  public void testRandomizedQueue() throws Exception {
    RandomizedQueue<Integer> queue = new RandomizedQueue<>();
    assertThat(queue.isEmpty()).isTrue();
    assertThat(queue.size()).isEqualTo(0);

    queue.enqueue(1);
    queue.enqueue(2);
    queue.enqueue(3);
    queue.enqueue(4);
    queue.enqueue(5);
    queue.enqueue(6);
    queue.enqueue(7);
    queue.enqueue(8);

    assertThat(queue.isEmpty()).isFalse();
    assertThat(queue.size()).isEqualTo(8);

    List<Integer> list = new ArrayList<>();
    list.add(queue.dequeue());
    list.add(queue.dequeue());
    list.add(queue.dequeue());
    list.add(queue.dequeue());
    list.add(queue.dequeue());
    list.add(queue.dequeue());
    list.add(queue.dequeue());
    list.add(queue.dequeue());

    assertThat(list).containsExactlyInAnyOrder(1, 2, 3, 4, 5, 6, 7, 8).as("queueに入れたものがランダム順でdequeueされる");
  }

}
