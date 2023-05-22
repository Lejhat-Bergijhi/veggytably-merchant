import 'package:flutter/material.dart';

class OrderListItem extends StatelessWidget {
  final String quantity;
  final String item;
  final String price;

  const OrderListItem(this.quantity, this.item, this.price);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              quantity,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: "Rubik",
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              item,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: "Rubik",
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              price,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: "Rubik",
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
