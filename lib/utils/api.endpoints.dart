class ApiEndPoints {
  static const String baseUrl = "http://10.6.178.141:5000/";
  static final _AuthEndPoints authEndpoints = _AuthEndPoints();
  static final _MerchantEndPoints merchantEndpoints = _MerchantEndPoints();
  static final _TransactionEndPoints transactionEndPoints =
      _TransactionEndPoints();
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

  final String menu = "merchants/menu";

  String singleMenu(String menuId) => "merchants/menu/$menuId";
  // get one, update, delete

  String getMenuImage(String imageId) => "merchants/menu/images/$imageId";
  final String postMenuImage = "merchants/menu/upload-image";
  String deleteMenuImage(String menuId, String imageId) =>
      "merchants/menu/$menuId/$imageId";
}

class _TransactionEndPoints {
  final String getTransactions = "transactions";
  final String getTransaction = "transactions";
  final String updateTransaction = "transactions";
  final String deleteTransaction = "transactions";
}
