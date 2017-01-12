package org.shibayu36.algorithms;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import me.geso.nanobench.Benchmark;

public class SuffixArraySearchBenchmark {
  public static void main(String[] args) throws Exception {
    new Benchmark(new SuffixArraySearchBenchmarkInner()).warmup(3).runByTime(3).timethese().cmpthese();
  }

  public static class SuffixArraySearchBenchmarkInner {
    private String text;
    {
      // 指定のファイル URL のファイルをバイト列として読み込む
      try {
        byte[] fileContentBytes = Files.readAllBytes(Paths.get("./wikipedia1.txt"));
        // 読み込んだバイト列を UTF-8 でデコードして文字列にする
        text = new String(fileContentBytes, StandardCharsets.UTF_8);
      } catch (Exception e) {}
    }

    private SuffixArraySearch search = new SuffixArraySearch(text);

    @Benchmark.Bench
    public void constructAndSearch() {
      SuffixArraySearch search = new SuffixArraySearch(text);
      search.searchPattern("歴史的");
      search.searchPattern("教会");
      search.searchPattern("分裂後のカロリング朝後継国家");
      search.searchPattern("近代のキリスト教は東西いずれの教会においてもその影響力を低下させた。ここでは近代社会と宗教について、とくに近代国家とキリスト教の問題を焦点とすることとし、その際近代国家成立の前提としての近代以前のヨーロッパ史における世俗王権とカトリックの教権の関係をまず概観する。さらにその背景となる思想史についても適宜記述する。近代以降については正教世界にも視野を広げて記述するが、近代国家との関連性を重視するという観点から中世以前の正教世界についてはここでは詳しく触れない。");
    }

    @Benchmark.Bench
    public void onlySearch() {
      search.searchPattern("歴史的");
      search.searchPattern("教会");
      search.searchPattern("分裂後のカロリング朝後継国家");
      search.searchPattern("近代のキリスト教は東西いずれの教会においてもその影響力を低下させた。ここでは近代社会と宗教について、とくに近代国家とキリスト教の問題を焦点とすることとし、その際近代国家成立の前提としての近代以前のヨーロッパ史における世俗王権とカトリックの教権の関係をまず概観する。さらにその背景となる思想史についても適宜記述する。近代以降については正教世界にも視野を広げて記述するが、近代国家との関連性を重視するという観点から中世以前の正教世界についてはここでは詳しく触れない。");
    }
  }
}
