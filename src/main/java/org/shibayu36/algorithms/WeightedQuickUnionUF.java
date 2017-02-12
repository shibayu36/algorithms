package org.shibayu36.algorithms;

public class WeightedQuickUnionUF {
  private int[] id;
  private int [] size;

  public WeightedQuickUnionUF(int n) {
    this.id = new int[n];
    this.size = new int[n];
    for (int i = 0; i < n; i++) {
      this.id[i] = i;
      this.size[i] = 1;
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
    int i = this.root(p);
    int j = this.root(q);
    if (i == j) return;

    if (size[i] < size[j]) {
      id[i] = j;
      size[j] += size[i];
    }
    else {
      id[j] = i;
      size[i] += size[j];
    }
  }
}
