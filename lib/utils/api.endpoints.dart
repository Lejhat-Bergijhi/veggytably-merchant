class ApiEndPoints {
  static const String baseUrl = "http://192.168.88.143:5000/merchants/";
  static final _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String signUp = "auth/signUp";
  final String login = "auth/login";
}
