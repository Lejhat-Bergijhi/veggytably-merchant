class ApiEndPoints {
  static const String baseUrl = "http://192.168.88.143:5000/";
  static final _AuthEndPoints authEndpoints = _AuthEndPoints();
  static final _MerchantEndPoints merchantEndpoints = _MerchantEndPoints();
}

class _AuthEndPoints {
  final String signUp = "auth/signUp/merchant";
  final String login = "auth/login";
  final String logout = "auth/logout";
  final String verifyAuth = "auth/verify";
}

class _MerchantEndPoints {
  final String updateProfile = "merchants/profile";
  final String getProfile = "merchants/profile";
}
