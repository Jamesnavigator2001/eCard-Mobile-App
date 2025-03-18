class AppUrl {
  static const String liveUrl = "http://192.168.1.163:8080";
  static const String localhost = "http://localhost:8080";

  static const String baseEndpoint = liveUrl;
  static const String loginUrl = "$baseEndpoint/auth";
  static const String registerUrl = "$baseEndpoint/auth/register";
  static const String forgotPassword = "$baseEndpoint/auth/forgotPassword";
}
