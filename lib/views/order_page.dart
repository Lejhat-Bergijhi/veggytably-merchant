import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/widgets/order_item.dart';

import '../controllers/transaction_controller.dart';
import '../utils/socket_service.dart';

class OrderPage extends StatelessWidget {
  final SocketService socketService = SocketService();
  final TransactionController orderController =
      Get.put(TransactionController());

  OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
            child: Text(
          'Pesanan',
          style: TextStyle(
            color: Colors.black,
          ),
        )),
      ),
      body: Column(children: [
        // on process | done
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: const [
              Expanded(
                child: Center(
                  child: Text(
                    'On Process',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                    child: Text('Done',
                        style: TextStyle(
                          fontSize: 18,
                        ))),
              )
            ],
          ),
        ),
        // list of orders
        Expanded(
          child: GetBuilder<TransactionController>(builder: (controller) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                reverse: false,
                itemCount: controller.transactions.length,
                itemBuilder: (context, index) {
                  var orders = controller.transactions;
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 12,
                      bottom: 12,
                    ),
                    child: OrderItem(transaction: orders[index]),
                  );
                });
          }),
        )
      ]),
    );
  }
}
