import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:fruitshop/model/card_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
        ),
        body: Consumer<CardModel>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            leading: Image.asset(
                              value.cartItems[index]["image"],
                              height: 36,
                            ),
                            title: Text(value.cartItems[index]["name"]),
                            subtitle:
                                Text("\$${value.cartItems[index]["price"]}"),
                            trailing: IconButton(
                              onPressed: () =>
                                  Provider.of<CardModel>(context, listen: false)
                                      .removeItemFromCart(index),
                              icon: const Icon(Icons.cancel),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ));
  }
}
