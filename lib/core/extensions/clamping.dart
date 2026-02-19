extension Clamping on double {
  double atLeast(num min) => clamp(min, double.infinity).toDouble();

  double clampLessHalfAndMoreHalf(num baseNumber) => clamp(
        baseNumber * 0.5,
        baseNumber * 1.5,
      ).toDouble();

  double clampLessThirdAndMoreThird(num baseNumber) => clamp(
        baseNumber * 0.67,
        baseNumber * 1.33,
      ).toDouble();

  double clampLessQuarterAndMoreQuarter(num baseNumber) => clamp(
        baseNumber * 0.75,
        baseNumber * 1.25,
      ).toDouble();

  double clampLessFifthAndMoreFifth(num baseNumber) => clamp(
        baseNumber * 0.8,
        baseNumber * 1.2,
      ).toDouble();

  double clampLessSixthAndMoreSixth(num baseNumber) => clamp(
        baseNumber * 0.83,
        baseNumber * 1.17,
      ).toDouble();

  double clampLessSeventhAndMoreSeventh(num baseNumber) => clamp(
        baseNumber * 0.86,
        baseNumber * 1.14,
      ).toDouble();

  double clampLessEighthAndMoreEighth(num baseNumber) => clamp(
        baseNumber * 0.88,
        baseNumber * 1.12,
      ).toDouble();

  double clampLessNinthAndMoreNinth(num baseNumber) => clamp(
        baseNumber * 0.89,
        baseNumber * 1.11,
      ).toDouble();

  double clampLessTenthAndMoreTenth(num baseNumber) => clamp(
        baseNumber * 0.9,
        baseNumber * 1.1,
      ).toDouble();
}
