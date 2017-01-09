package org.shibayu36.algorithms;

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.List;
import org.junit.Test;

public class PowerSetGenericsTest {

  @Test
  public void make() throws Exception {
    List<List<Integer>> result = PowerSet1.make(Arrays.asList());
    System.out.println(result.toString());

    result = PowerSetGenerics.make(Arrays.asList(1, 2, 3));
    System.out.println(result.toString());

    List<String> args = Arrays.asList("hoge", "fuga", "bar");
    List<List<String>> powerSet = PowerSetGenerics.make(args);
    System.out.println(powerSet.toString());
  }

}