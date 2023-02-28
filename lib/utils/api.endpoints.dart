class ApiEndPoints {
  static const String baseUrl = "http://localhost:5000/merchants/";
  static final _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String signUp = "auth/signUp";
  final String login = "auth/login";
  final String logout = "auth/logout";
}
