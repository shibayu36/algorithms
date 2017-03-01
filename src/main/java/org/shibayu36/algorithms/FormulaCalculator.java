package org.shibayu36.algorithms;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;
import org.apache.commons.lang3.math.NumberUtils;

public class FormulaCalculator {
  // オペレーターの優先順位
  private static final Map<String, Integer> opPriority = new HashMap<String, Integer>() {
    {
      put("+", 2);
      put("-", 2);
      put("*", 3);
      put("/", 3);
    }
  };

  /**
   * 数式の文字列を与えると計算結果を返す
   * @param formula 数式の文字列。トークンは空白で区切られている必要がある
   * @return
   */
  public static double calculate(String formula) {
    Stack<String> ops = new Stack<>(); // オペレーターのスタック
    Stack<Double> vals = new Stack<>(); // 値のスタック

    String[] tokens = formula.split(" ");

    for (String token: tokens) {
      if (NumberUtils.isCreatable(token)) {
        // tokenが数値なら数値に変換して値スタックに積む
        vals.push(Double.parseDouble(token));
      }
      else if (isOperator(token)) {
        // tokenがオペレーターの時
        while (ops.size() > 0) {
          String lastOp = ops.pop();
          // オペレータスタックの最後もオペレータ、つまり(でなく、
          // かつ現在のtokenのほうが優先度が低いなら計算する
          if (isOperator(lastOp) && getOpPriority(token) <= getOpPriority(lastOp)) {
            double val2 = vals.pop();
            double val1 = vals.pop();
            vals.push(applyOperator(lastOp, val1, val2));
          }
          else {
            ops.push(lastOp);
            break;
          }
        }
        ops.push(token);
      }
      else if (token.equals("(")) {
        ops.push(token);
      }
      else if (token.equals(")")) {
        while (ops.size() > 0) {
          String op = ops.pop();
          if (op.equals("(")) {
            break;
          }
          else {
            double val2 = vals.pop();
            double val1 = vals.pop();
            vals.push(applyOperator(op, val1, val2));
          }
        }
      }
    }

    while (ops.size() > 0) {
      // オペレータがなくなるまで計算を続ける
      String op = ops.pop();
      if (isOperator(op)) {
        double val2 = vals.pop();
        double val1 = vals.pop();
        vals.push(applyOperator(op, val1, val2));
      }
    }
    return vals.pop();
  }

  private static double applyOperator(String op, double val1, double val2) {
    BigDecimal b1 = new BigDecimal(String.valueOf(val1));
    BigDecimal b2 = new BigDecimal(String.valueOf(val2));
    switch (op) {
      case "+":
        return b1.add(b2).doubleValue();
      case "-":
        return b1.subtract(b2).doubleValue();
      case "*":
        return b1.multiply(b2).doubleValue();
      case "/":
        return b1.divide(b2).doubleValue();
    }

    // ここまで来たら意図しないoperatorが来たということなので例外
    throw new RuntimeException("Unexpected operator: " + op);
  }

  private static int getOpPriority(String token) {
    return opPriority.getOrDefault(token, 0);
  }

  private static boolean isOperator(String token) {
    return opPriority.containsKey(token);
  }
}
