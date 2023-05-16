class Transaction {
  late String id;
  late String date;
  late String status;
  late String cartId;
  late String customerId;
  late String merchantId;
  late String? driverId;
  late Cart cart;
  late Customer customer;
  late Merchant merchant;
  late dynamic driver;

  Transaction({
    required this.id,
    required this.date,
    required this.status,
    required this.cartId,
    required this.customerId,
    required this.merchantId,
    this.driverId,
    required this.cart,
    required this.customer,
    required this.merchant,
    this.driver,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    status = json['status'];
    cartId = json['cartId'];
    customerId = json['customerId'];
    merchantId = json['merchantId'];
    driverId = json['driverId'];
    cart = (json['cart'] != null ? Cart.fromJson(json['cart']) : null)!;
    customer = (json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null)!;
    merchant = (json['merchant'] != null
        ? Merchant.fromJson(json['merchant'])
        : null)!;
    driver = json['driver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['status'] = status;
    data['cartId'] = cartId;
    data['customerId'] = customerId;
    data['merchantId'] = merchantId;
    data['driverId'] = driverId;
    data['cart'] = cart.toJson();
    data['customer'] = customer.toJson();
    data['merchant'] = merchant.toJson();
    data['driver'] = driver;
    return data;
  }

  @override
  String toString() {
    return 'Transaction{id: $id, date: $date, status: $status, cartId: $cartId, customerId: $customerId, merchantId: $merchantId, driverId: $driverId, cart: $cart, customer: $customer, merchant: $merchant, driver: $driver}';
  }
}

class Cart {
  late String id;
  late String customerId;
  late String merchantId;
  late List<CartItem> cartItem;

  Cart({
    required this.id,
    required this.customerId,
    required this.merchantId,
    required this.cartItem,
  });

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    merchantId = json['merchantId'];
    if (json['cartItem'] != null) {
      cartItem = <CartItem>[];
      json['cartItem'].forEach((v) {
        cartItem.add(CartItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customerId'] = customerId;
    data['merchantId'] = merchantId;
    data['cartItem'] = cartItem.map((v) => v.toJson()).toList();
    return data;
  }

  @override
  String toString() {
    return 'Cart{id: $id, customerId: $customerId, merchantId: $merchantId, cartItem: $cartItem}';
  }
}

class CartItem {
  late String id;
  late int quantity;
  late String cartId;
  late String menuId;

  CartItem({
    required this.id,
    required this.quantity,
    required this.cartId,
    required this.menuId,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    cartId = json['cartId'];
    menuId = json['menuId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['cartId'] = cartId;
    data['menuId'] = menuId;
    return data;
  }

  @override
  String toString() {
    return 'CartItem{id: $id, quantity: $quantity, cartId: $cartId, menuId: $menuId}';
  }
}

class Customer {
  late String id;
  late String? address;
  late List<dynamic> restrictions;
  late String userId;
  late User user;

  Customer({
    required this.id,
    required this.address,
    required this.restrictions,
    required this.userId,
    required this.user,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    if (json['restrictions'] != null) {
      restrictions = <dynamic>[];
      json['restrictions'].forEach((v) {
        restrictions.add(v);
      });
    }
    userId = json['userId'];
    user = (json['user'] != null ? User.fromJson(json['user']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address'] = address;
    data['restrictions'] = restrictions.map((v) => v.toJson()).toList();
    data['userId'] = userId;
    data['user'] = user.toJson();
    return data;
  }

  @override
  String toString() {
    return 'Customer{id: $id, address: $address, restrictions: $restrictions, userId: $userId, user: $user}';
  }
}

class User {
  late String id;
  late String username;
  late String email;
  late String password;
  late String phone;
  late String? profilePicture;
  late int? tokenVersion;
  late int wallet;
  late String role;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.profilePicture,
    required this.tokenVersion,
    required this.wallet,
    required this.role,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    profilePicture = json['profilePicture'];
    tokenVersion = json['tokenVersion'];
    wallet = json['wallet'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['profilePicture'] = profilePicture;
    data['tokenVersion'] = tokenVersion;
    data['wallet'] = wallet;
    data['role'] = role;
    return data;
  }

  @override
  String toString() {
    return 'User{id: $id, username: $username, email: $email, password: $password, phone: $phone, profilePicture: $profilePicture, tokenVersion: $tokenVersion, wallet: $wallet, role: $role}';
  }
}

class Merchant {
  late String id;
  late String restaurantName;
  late String restaurantAddress;
  late int rating;
  late String userId;

  Merchant({
    required this.id,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.rating,
    required this.userId,
  });

  Merchant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantName = json['restaurantName'];
    restaurantAddress = json['restaurantAddress'];
    rating = json['rating'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['restaurantName'] = restaurantName;
    data['restaurantAddress'] = restaurantAddress;
    data['rating'] = rating;
    data['userId'] = userId;
    return data;
  }

  @override
  String toString() {
    return 'Merchant{id: $id, restaurantName: $restaurantName, restaurantAddress: $restaurantAddress, rating: $rating, userId: $userId}';
  }
}
