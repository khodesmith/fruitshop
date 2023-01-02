import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:fruitshop/model/card_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CartPage();
            },
          ),
        ),
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            //good morning
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Good Afternoon"),
            ),
            const SizedBox(
              height: 30,
            ),

            //let's order fresh items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Let's order Fresh items for you",
                style: GoogleFonts.ebGaramond(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),

            //divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(
                thickness: 3,
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            //fresh items + grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Fresh Items",
                style: TextStyle(fontSize: 16),
              ),
            ),

            Expanded(
              child: Consumer<CardModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index]["name"],
                        itemPrice: value.shopItems[index]["price"],
                        imagePath: value.shopItems[index]["image"],
                        color: value.shopItems[index]["colour"],
                        onPressed: () {
                          Provider.of<CardModel>(context, listen: false)
                              .addItemToCart(index);
                        },
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
