abstract class RoutePaths {
  static const onboarding = "/onboarding";
  static const initialRoute = "/initial-route";
  static const home = "/home";
  static const login = "/login";
  static const signUp = "/sign-up";
  static const otp = "/otp";
  static const category = "/category";
  static const productDetails = "/product-details/:productId";
  static String productDetailsPath(String productId) =>
      "/product-details/$productId";
  static const profile = "/profile";
  static const allReviews = "/all-reviews/:productId";
  static String allReviewsPath(String productId) => "/all-reviews/$productId";
}
