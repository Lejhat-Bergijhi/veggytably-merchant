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
                itemCount: controller.transactions.length,
                itemBuilder: (context, index) {
                  var orders = controller.transactions;
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "id: ${orders[index].id}",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "status: ${orders[index].status}",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "date: ${orders[index].date}",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "items: ${orders[index].cart.cartItem.length}",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "customer: ${orders[index].customer.user.username}",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "address: ${orders[index].customer.address}",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  );
                });
          }),
        )
      ]),
    );
  }
}
