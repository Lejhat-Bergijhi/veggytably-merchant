class User {
  late String id;
  late String username;
  late String email;
  late String phone;
  late num wallet;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.phone,
      required this.wallet});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    wallet = json['wallet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['wallet'] = wallet;
    return data;
  }
}
