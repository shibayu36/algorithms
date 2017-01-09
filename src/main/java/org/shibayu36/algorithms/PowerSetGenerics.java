package org.shibayu36.algorithms;

import java.util.ArrayList;
import java.util.List;

public class PowerSetGenerics {
  public static <T> List<List<T>> make(List<T> data) {
    if (data.size() == 0) {
      List<List<T>> empty = new ArrayList<>();
      empty.add(new ArrayList<>());
      return empty;
    }

    List<List<T>> result = new ArrayList<>();
    for (int i = 0; i < Math.pow(2, data.size()); i++) {

      List<T> set = new ArrayList<>();
      int flags = i;
      for (int j = 0; j < data.size(); j++) {
        int flag = flags % 2;
        if (flag == 1) {
          set.add(data.get(j));
        }
        flags = flags / 2;
      }
      result.add(set);
    }

    return result;
  }
}
