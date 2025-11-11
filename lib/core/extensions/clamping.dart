extension Clamping on double {
  double atLeast(num min) => clamp(min, double.infinity).toDouble();

  double clampLessHalfAndMoreHalf() => clamp(
        this * 0.5,
        this * 1.5,
      ).toDouble();

  double clampLessThirdAndMoreThird() => clamp(
        this * 0.67,
        this * 1.33,
      ).toDouble();

  double clampLessQuarterAndMoreQuarter() => clamp(
        this * 0.75,
        this * 1.25,
      ).toDouble();

  double clampLessFifthAndMoreFifth() => clamp(
        this * 0.8,
        this * 1.2,
      ).toDouble();

  double clampLessSixthAndMoreSixth() => clamp(
        this * 0.83,
        this * 1.17,
      ).toDouble();

  double clampLessSeventhAndMoreSeventh() => clamp(
        this * 0.86,
        this * 1.14,
      ).toDouble();

  double clampLessEighthAndMoreEighth() => clamp(
        this * 0.88,
        this * 1.12,
      ).toDouble();

  double clampLessNinthAndMoreNinth() => clamp(
        this * 0.89,
        this * 1.11,
      ).toDouble();

  double clampLessTenthAndMoreTenth() => clamp(
        this * 0.9,
        this * 1.1,
      ).toDouble();
}
