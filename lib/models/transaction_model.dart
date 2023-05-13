class Transaction {
  late String id;
  late String date;
  late String status;
  late String cartId;
  late String customerId;
  late String merchantId;
  late String? driverId;

  Transaction({
    required this.id,
    required this.date,
    required this.status,
    required this.cartId,
    required this.customerId,
    required this.merchantId,
    this.driverId,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    status = json['status'];
    cartId = json['cartId'];
    customerId = json['customerId'];
    merchantId = json['merchantId'];
    driverId = json['driverId'];
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
    return data;
  }
}
