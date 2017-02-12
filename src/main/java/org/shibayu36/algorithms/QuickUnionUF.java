package org.shibayu36.algorithms;

public class QuickUnionUF {
  private int[] id;

  public QuickUnionUF(int n) {
    this.id = new int[n];
    for (int i = 0; i < n; i++) {
      this.id[i] = i;
    }
  }

  private int root(int i) {
    while (i != this.id[i]) i = this.id[i];
    return i;
  }

  public boolean connected(int p, int q) {
    return this.root(p) == this.root(q);
  }

  public void union(int p, int q) {
    this.id[this.root(p)] = this.root(q);
  }
}
