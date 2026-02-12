abstract class EndPoints {
  static const String baseUrl = "https://nova-store-chi.vercel.app/api/v1";
  ///common endpoint for auth (login & signup) itps used to send verification code 
  static const String auth = "/auth/login";
  static const String verifyAuthOtp = "/auth/verify";
  static const String refreshToken = "/auth/refresh-token";
}
