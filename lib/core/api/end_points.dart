abstract class EndPoints {
  static const String baseUrl = "https://nova-store-nine.vercel.app";
  ///common endpoint for auth (login & signup) its used to send verification code 
  static const String auth = "/api/v1/users/login";
  static const String verifyAuthOtp = "/api/v1/users/verify";
}
