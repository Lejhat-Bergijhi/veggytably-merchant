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
    return Merchant(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      restaurantName: json['restaurantName'],
      restaurantAddress: json['restaurantAddress'],
      phone: json['phone'],
      rating: json['rating']?.toDouble() ?? 0.0,
    );
  }
}

/**
    id: string;
    restaurantName: string;
    restaurantAddress: string;
    rating: number;
    username: string;
    email: string;
    phone: string;
 */