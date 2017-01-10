package org.shibayu36.algorithms;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SuffixArraySearch {
  private Integer[] suffixArray;
  private String text;

  public SuffixArraySearch(String text) {
    // patternとsuffixが一致することがない方が
    // 探索がやりやすいので、番兵を入れておく
    this.text = text + "\0";

    // コンストラクタでSuffixArrayを構築する
    int n = this.text.length();
    Suffix[] suffixes = new Suffix[n];
    for (int i = 0; i < n; i++) {
      suffixes[i] = new Suffix(this.text, i);
    }
    Arrays.sort(suffixes);
    this.suffixArray = Arrays.stream(suffixes)
        .map(s -> s.index)
        .toArray(size -> new Integer[size]);
  }

  public List<Integer> searchPattern(String pattern) {
    if (pattern.length() == 0) {
      // patternが空文字なら全マッチ
      // ただし番兵の入った1番目は除く
      List<Integer> positions = new ArrayList<>(Arrays.asList(this.suffixArray));
      positions.remove(0);
      return positions;
    }

    // 二分探索をしながら、prefixがマッチしうる
    // 場所を探し出す
    int left = 0;
    int right = this.suffixArray.length - 1;
    while (right - left > 1) {
      int middle = (left + right) / 2;
      String suffix = this.text.substring(this.suffixArray[middle]);
      if (pattern.compareTo(suffix) > 0) {
        left = middle;
      }
      else {
        right = middle;
      }
    }

    // prefixがマッチするとしたらrightからなので
    // rightからprefixがマッチする限り、positionsに追加
    List<Integer> positions = new ArrayList<>();
    int index = right;
    while (true) {
      if (index >= this.suffixArray.length) break;
      if (!this.text.startsWith(pattern, this.suffixArray[index])) break;
      positions.add(this.suffixArray[index]);
      index++;
    }

    return positions;
  }
}

