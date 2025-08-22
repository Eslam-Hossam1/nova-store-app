extension Clamping on double {
  double atLeast(num min) => clamp(min, double.infinity).toDouble();
}
