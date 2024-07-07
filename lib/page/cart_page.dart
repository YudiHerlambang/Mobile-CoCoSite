import 'package:flutter/material.dart';
import 'package:mobile/utils/color.dart';
// import 'package:mobile/widgets/product_cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      body: Container(
        padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
        child: const Text(
          "Keranjang",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800
          ),
        ),
      ),
      
    );
  }
}
