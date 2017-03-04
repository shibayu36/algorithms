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

    System.out.println("formula: " + formula);
    System.out.println("===============");

    for (String token: tokens) {
      System.out.println("token: " + token);
      if (NumberUtils.isCreatable(token)) {
        // tokenが数値なら値スタックに積む
        vals.push(Double.parseDouble(token));
      }
      else if (isOperator(token)) {
        // tokenがオペレータ(o1)の時
        // - オペレータスタックのトップにオペレータo2 があり、o1 が左結合性で、
        //   かつ優先順位が o2 と等しいか低い場合、以下を繰り返す
        //     - o2 をオペレータスタックからpopし、値スタックから値を二つpopし、
        //       演算し、結果を値スタックにpushする
        // - o1 をオペレータスタックにプッシュする。
        // (右結合性のオペレータは未実装)
        while (ops.size() > 0) {
          String lastOp = ops.pop();
          // "("が入っている場合があるため
          // オペレータスタックの最後もオペレータであることを確認する
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
        // トークンが左括弧の場合、オペレータスタックにプッシュする
        ops.push(token);
      }
      else if (token.equals(")")) {
        // トークンが右括弧の場合
        // - オペレータスタックのトップにあるトークンが左括弧になるまで、
        //   オペレータスタックからオペレータをpopし、値スタックから値を二つpopし
        //   それらを演算し、値スタックに結果をプッシュする
        // - 左括弧をスタックからpopするが、何もせずに捨てる
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
      System.out.println("ops: " + ops);
      System.out.println("vals: " + vals);
      System.out.println("------------");
    }

    // 読み取るべきトークンが無くなったら、オペレータスタックが空になるまで
    // オペレータスタックからオペレータをpopし、値スタックから値を二つpopし
    // それらを演算し、値スタックに結果をプッシュする
    while (ops.size() > 0) {
      System.out.println("last calculation");
      String op = ops.pop();
      if (isOperator(op)) {
        double val2 = vals.pop();
        double val1 = vals.pop();
        vals.push(applyOperator(op, val1, val2));
      }
      System.out.println("ops: " + ops);
      System.out.println("vals: " + vals);
      System.out.println("------------");
    }

    // 値スタックに最後に入っている結果が演算結果である
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
