package org.shibayu36.algorithms;

import java.util.ArrayList;
import java.util.List;
import me.geso.nanobench.Benchmark;
import org.apache.commons.lang3.RandomUtils;

public class UnionFindBenchmark {

  public static void main(String[] args) throws Exception {
    new Benchmark(new UnionFindBenchmarkInner()).warmup(1).runByTime(3).timethese().cmpthese();
  }

  public static class UnionFindBenchmarkInner {
    private int size = 1000000;
    private List<List<Integer>> unions = new ArrayList<>();
    private List<List<Integer>> connecteds = new ArrayList<>();

    // unionをするリストを作っておく
    {
      for (int i = 0; i < 1000; i++) {
        List<Integer> union = new ArrayList<>();
        union.add(RandomUtils.nextInt(0, size - 1));
        union.add(RandomUtils.nextInt(0, size - 1));
        unions.add(union);
      }
    }

    // connectedをするリストを作っておく
    {
      for (int i = 0; i < 1000; i++) {
        List<Integer> connected = new ArrayList<>();
        connected.add(RandomUtils.nextInt(0, size - 1));
        connected.add(RandomUtils.nextInt(0, size - 1));
        connecteds.add(connected);
      }
    }

    @Benchmark.Bench
    public void QuickFindUF() {
      QuickFindUF uf = new QuickFindUF(size);

      for (List<Integer> union : unions) {
        uf.union(union.get(0), union.get(1));
      }

      for (List<Integer> connected : connecteds) {
        uf.connected(connected.get(0), connected.get(1));
      }
    }
  }
}
