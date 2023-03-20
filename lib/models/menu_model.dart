class Menu {
  final String id;
  final String name;
  final double price;
  final String? description;
  final String? imageId;
  final String? imageUrl;
  final String merchantId;
  // Restriction?

  Menu({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.imageId,
    this.imageUrl,
    required this.merchantId,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['id'],
      name: json['name'],
      price: json['price']?.toDouble() ?? 0.0,
      description: json['description'],
      imageId: json['imageId'],
      imageUrl: json['imageUrl'],
      merchantId: json['merchantId'],
    );
  }

  static fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => Menu.fromJson(e)).toList();
  }

  @override
  toString() {
    return 'Menu(id: $id, name: $name, price: $price, description: $description, imageId: $imageId, imageUrl: $imageUrl, merchantId: $merchantId)';
  }
}


/**  
    imageUrl: string;
    id: string;
    name: string;
    price: number;
    description: string;
    imageId: string;
    merchantId: string;
 */