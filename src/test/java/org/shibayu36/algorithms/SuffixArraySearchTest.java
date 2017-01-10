package org.shibayu36.algorithms;

import static org.assertj.core.api.Assertions.assertThat;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import org.junit.Test;

public class SuffixArraySearchTest {

  @Test
  public void searchPatternForEmpty() throws Exception {
    SuffixArraySearch search = new SuffixArraySearch("");
    List<Integer> positions;

    positions = search.searchPattern("");
    assertThat(positions).isEmpty();

    positions = search.searchPattern("pattern");
    assertThat(positions).isEmpty();
  }

  @Test
  public void searchPatternForBanana() throws Exception {
    SuffixArraySearch search = new SuffixArraySearch("banana");
    List<Integer> positions;

    positions = search.searchPattern("");
    assertThat(positions).containsExactlyInAnyOrder(0, 1, 2, 3, 4, 5);

    positions = search.searchPattern("a");
    assertThat(positions).containsExactlyInAnyOrder(1, 3, 5);

    positions = search.searchPattern("na");
    assertThat(positions).containsExactlyInAnyOrder(2, 4);

    positions = search.searchPattern("ana");
    assertThat(positions).containsExactlyInAnyOrder(1, 3);

    positions = search.searchPattern("banana");
    assertThat(positions).containsExactlyInAnyOrder(0);

    positions = search.searchPattern("bananana");
    assertThat(positions).isEmpty();
  }

  @Test
  public void searchPatternForBlogSample() throws Exception {
    String text = "";

    // 指定のファイル URL のファイルをバイト列として読み込む
    try {
      byte[] fileContentBytes = Files.readAllBytes(Paths.get("./blog1.txt"));
      // 読み込んだバイト列を UTF-8 でデコードして文字列にする
      text = new String(fileContentBytes, StandardCharsets.UTF_8);
    } catch (Exception e) {}

    SuffixArraySearch search = new SuffixArraySearch(text);
    List<Integer> positions;
    List<String> suffixStrings;

    positions = search.searchPattern("基礎技術");
    assertThat(positions).containsExactlyInAnyOrder(0, 518, 835, 881, 1039, 1097);
    for (int i : positions) {
      assertThat(text.substring(i)).startsWith("基礎技術");
    }

    positions = search.searchPattern("モチベーション");
    assertThat(positions).containsExactlyInAnyOrder(8, 287, 309, 398, 487, 524, 935, 1002, 1046, 1086);
    for (int i : positions) {
      assertThat(text.substring(i)).startsWith("モチベーション");
    }

    positions = search.searchPattern("正に今開発をしているサービスの分野");
    assertThat(positions).containsExactlyInAnyOrder(594);
    for (int i : positions) {
      assertThat(text.substring(i)).startsWith("正に今開発をしているサービスの分野");
    }
  }
}