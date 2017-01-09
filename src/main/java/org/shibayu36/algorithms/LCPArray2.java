package org.shibayu36.algorithms;

import static java.lang.System.currentTimeMillis;

import java.util.Arrays;

public class LCPArray2 {
  public static int compareNum = 0;

  public static Integer[] make(String text, Integer[] suffixArray) {
    compareNum = 0;

    text += "\0"; // 番兵を入れておく

    // 文字の長さ順にLCPを計算できるように、
    // suffixArray内のどこに位置するか、
    // 文字列長さ順に並べた配列を用意する
    int size = suffixArray.length;
    Integer[] rank = new Integer[size];
    for (int i = 0; i < size; i++) {
      rank[suffixArray[i]] = i;
    }

    Integer[] lcpArray = new Integer[size];
    int lcp = 0;
    for (int i = 0; i < size; i++) {
      // suffixArray中のindex番目のLCPを計算する
      int index = rank[i];
      int pos1 = suffixArray[index];
      // indexが最後なら、次の比較するものはないので、lcpは0で終わり
      if (index == size - 1) {
        lcpArray[index] = lcp = 0;
        continue;
      }

      int pos2 = suffixArray[index + 1];
      lcpArray[index] = lcp = calcLCP(text, pos1, pos2, lcp);

      // 次は一文字削ったものなので、lcpは1減らす
      lcp--;
      if (lcp <= 0) lcp = 0;
    }

    return lcpArray;
  }

  private static int calcLCP(String text, int pos1, int pos2, int lcp) {
    compareNum++;
    while (text.charAt(pos1 + lcp) == text.charAt(pos2 + lcp)) {
      lcp++;
      compareNum++;
    }
    return lcp;
  }
}
