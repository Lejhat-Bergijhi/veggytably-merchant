import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/transaction_controller.dart';
import '../utils/socket_service.dart';

class OrderPage extends StatelessWidget {
  final SocketService socketService = SocketService();
  final TransactionController orderController =
      Get.put(TransactionController());

  OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
