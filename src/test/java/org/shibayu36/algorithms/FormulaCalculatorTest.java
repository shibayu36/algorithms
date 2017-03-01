package org.shibayu36.algorithms;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;

public class FormulaCalculatorTest {

  @Test
  public void calculate() throws Exception {
    double result;

    result = FormulaCalculator.calculate("1 + 2");
    assertThat(result).isEqualTo(3);

    result = FormulaCalculator.calculate("1 / 2 + 2 * 3 - 1");
    assertThat(result).isEqualTo(5.5);

    result = FormulaCalculator.calculate("1.8 * 3 - 2.1 + 0.5");
    assertThat(result).isEqualTo(3.8);

    result = FormulaCalculator.calculate("1.8 * ( 3 - 2.1 ) + 0.5");
    assertThat(result).isEqualTo(2.12);

    result = FormulaCalculator.calculate("( 10 + 2.2 * 5.5 / 2.2 * ( 1.2 - 0.6 * 3.0 ) / 2 + 4.5 * ( 2.0 - 3 ) )");
    assertThat(result).isEqualTo(3.85);
  }
}