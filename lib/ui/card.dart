import 'package:flutter/material.dart';
import 'package:food_order/ui/text_styles.dart';

class OrderCard extends StatelessWidget {
  OrderCard(
      {Key? key, this.names, this.orders, this.prices, this.pays, this.index})
      : super(key: key);

  final names;
  final orders;
  final prices;
  final pays;
  final index;

  @override
  Widget build(BuildContext context) {
    int remaining = pays[index] - prices[index];
    return Column(
      children: [
        Card(
          elevation: 10,
          color: Colors.white,
          child: ListTile(
            title: Text(names[index], style: titleStyle(context)),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ordered: ${orders[index]}",
                    style: subTitleStyle(context)),
                Text("Price: ${prices[index]}", style: subTitleStyle(context)),
                Text("Payed: ${pays[index]}", style: subTitleStyle(context)),
                Text("Remaining: $remaining", style: subTitleStyle(context))
              ],
            ),
            leading: CircleAvatar(
              child: Text(names[index][0].toString().toUpperCase()),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
