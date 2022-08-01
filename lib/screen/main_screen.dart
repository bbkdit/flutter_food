import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/food_page_screen.dart';
import 'package:flutter_application_1/wigits/big_text.dart';
import 'package:flutter_application_1/wigits/small_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40.0),
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: "Hello Bibek",
                      color: Colors.cyan,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "Purulia",
                          color: Colors.black,
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 4, 246, 117)),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          FoodPageScreen(),
        ],
      ),
    );
  }
}
