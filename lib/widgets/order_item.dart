import 'package:flutter/material.dart';

import '../models/transaction_model.dart';
import '../utils/date_formatter.dart';

class OrderItem extends StatelessWidget {
  final Transaction transaction;
  const OrderItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 248, 251),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "#${transaction.id.substring(transaction.id.length - 6)}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF356631),
                ),
              ),
              const Spacer(),
              Text(
                DateFormatter.instance.format(DateTime.parse(transaction.date)),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9F9F9F),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            transaction.customer.user.username,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            "${transaction.cart.cartItem.length} items",
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF9F9F9F),
            ),
          ),
          Text(
            "status: ${transaction.status}",
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF9F9F9F),
            ),
          ),
          Text(
            "${transaction.customer.address}",
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF9F9F9F),
            ),
          ),

          // Button Detail pesanan
          Row(
            children: [
              const Text(
                "Tolak Pesanan",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    decoration: TextDecoration.underline),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF70CB88),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Detail Pesanan",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
