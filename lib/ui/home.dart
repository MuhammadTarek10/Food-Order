import 'package:flutter/material.dart';
import 'package:food_order/ui/card.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameInputController = TextEditingController();
  TextEditingController orderInputController = TextEditingController();
  TextEditingController priceInputController = TextEditingController();
  TextEditingController payedInputController = TextEditingController();

  List<String> names = [];
  List<String> orders = [];
  List<int> prices = [];
  List<int> pays = [];

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Here"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: counter,
          itemBuilder: (context, index) {
            return OrderCard(
                names: names,
                orders: orders,
                prices: prices,
                pays: pays,
                index: index);
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showDialog(context);
        },
      ),
    );
  }

  _showDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              contentPadding: EdgeInsets.all(10),
              content: Column(
                children: [
                  textBox(
                      labelText: "Name*", InputController: nameInputController),
                  textBox(
                      labelText: "Order*",
                      InputController: orderInputController),
                  textBox(
                      labelText: "Price*",
                      InputController: priceInputController),
                  textBox(
                      labelText: "Payed*",
                      InputController: payedInputController),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => {
                          nameInputController.clear(),
                          orderInputController.clear(),
                          priceInputController.clear(),
                          payedInputController.clear(),
                          Navigator.of(context).pop(),
                        },
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () {
                      if (nameInputController.text.isNotEmpty &&
                          orderInputController.text.isNotEmpty &&
                          priceInputController.text.isNotEmpty &&
                          payedInputController.text.isNotEmpty) {
                        _addValues(
                            nameInputController.text,
                            orderInputController.text,
                            int.parse(priceInputController.text),
                            int.parse(payedInputController.text));
                        nameInputController.clear();
                        orderInputController.clear();
                        priceInputController.clear();
                        payedInputController.clear();
                        Navigator.of(context).pop();
                      } else {
                        Fluttertoast.showToast(msg: "Please fill al of them");
                      }
                    },
                    child: Text("Save")),
              ],
            ));
  }

  _addValues(name, order, price, payed) {
    setState(() {
      names.add(name);
      orders.add(order);
      prices.add(price);
      pays.add(payed);
      counter++;
    });
  }
}

class textBox extends StatelessWidget {
  const textBox(
      {Key? key, required this.InputController, required this.labelText})
      : super(key: key);

  final TextEditingController InputController;
  final labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: TextField(
        autofocus: true,
        autocorrect: true,
        decoration: InputDecoration(
          labelText: labelText,
        ),
        controller: InputController,
      )),
    );
  }
}
