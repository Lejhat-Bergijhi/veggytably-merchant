class Merchant {
  final String id;
  final String username;
  final String email;
  final String restaurantName;
  final String restaurantAddress;
  final String phone;
  final double rating;

  Merchant({
    required this.id,
    required this.username,
    required this.email,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.phone,
    required this.rating,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) {
    final userData = json['data']['user'];
    return Merchant(
      id: userData['id'],
      username: userData['username'],
      email: userData['email'],
      restaurantName: userData['restaurantName'],
      restaurantAddress: userData['restaurantAddress'],
      phone: userData['phone'],
      rating: userData['rating']?.toDouble() ?? 0.0,
    );
  }
}
