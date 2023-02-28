class ApiEndPoints {
  static const String baseUrl = "http://localhost:5000/merchants/";
  static final _AuthEndPoints authEndpoints = _AuthEndPoints();
  static final _MerchantEndPoints merchantEndpoints = _MerchantEndPoints();
}

class _AuthEndPoints {
  final String signUp = "auth/signUp";
  final String login = "auth/login";
  final String logout = "auth/logout";
}

class _MerchantEndPoints {
  final String getProfile = "profile";
}
