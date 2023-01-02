import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:fruitshop/pages/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(
                top: 150.0, left: 80, right: 80, bottom: 40),
            child: Image.asset("images/banana.png"),
          ),

          //We deliver Everywhere
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "We Deliver Groceries at your Doorstep!",
              style: GoogleFonts.ebGaramond(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          //fresh Items Everyday
          Text(
            "Fresh Items everyday",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 24,
            ),
          ),

          const Spacer(),

          //get Started button
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                )),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const Spacer()
        ],
      ),
    );
  }
}
