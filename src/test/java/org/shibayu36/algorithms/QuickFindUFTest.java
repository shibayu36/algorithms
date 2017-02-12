package org.shibayu36.algorithms;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;

public class QuickFindUFTest {

  @Test
  public void testQuickFind() throws Exception {
    QuickFindUF uf = new QuickFindUF(10);
    uf.union(4,3);
    assertThat(uf.connected(4,3)).isTrue();
    assertThat(uf.connected(4,0)).isFalse();

    uf.union(3,8);
    assertThat(uf.connected(4,8)).isTrue();
    assertThat(uf.connected(4,9)).isFalse();

    uf.union(5,6);
    assertThat(uf.connected(5,6)).isTrue();
    assertThat(uf.connected(6,9)).isFalse();

    uf.union(9,4);
    assertThat(uf.connected(9,8)).isTrue();

    uf.union(1,2);
    assertThat(uf.connected(8,9)).isTrue();
    assertThat(uf.connected(5,0)).isFalse();

    uf.union(5, 0);
    assertThat(uf.connected(0,6)).isTrue();
    assertThat(uf.connected(0,7)).isFalse();

    uf.union(7, 2);
    assertThat(uf.connected(1,7)).isTrue();

    uf.union(6,1);
    assertThat(uf.connected(6, 7)).isTrue();
    assertThat(uf.connected(8,7)).isFalse();
  }
}