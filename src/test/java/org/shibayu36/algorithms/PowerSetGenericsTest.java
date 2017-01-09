package org.shibayu36.algorithms;

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.List;
import org.junit.Test;

public class PowerSetGenericsTest {

  @Test
  public void make() throws Exception {
    List<List<Integer>> integerPowerSet = PowerSetGenerics.make(Arrays.asList(1, 2, 3));
    System.out.println(integerPowerSet.toString());

    List<List<String>> stringPowerSet = PowerSetGenerics.make(Arrays.asList("hoge", "fuga", "bar"));
    System.out.println(stringPowerSet.toString());
  }

}