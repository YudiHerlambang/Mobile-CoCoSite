import 'package:flutter/material.dart';
import 'package:mobile/data/product_repo.dart';
import 'package:mobile/utils/color.dart';
import 'package:mobile/utils/helper.dart';
import 'package:mobile/widgets/nav_app.dart';
import 'package:mobile/widgets/product_cart.dart';

class ProductMainPage extends StatefulWidget {
  final Size size;
  const ProductMainPage({super.key, required this.size});

  @override
  State<ProductMainPage> createState() => _ProductMainPageState();
}

class _ProductMainPageState extends State<ProductMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: NavApp(size: widget.size),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
          // height: size.height - 80,
          width: size.width,
          child: Image.asset(
            getImage("banner.png"),
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            // color: CustomColor.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment,start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Produk",
                    style: TextStyle(
                      fontSize: 24,
                      color: CustomColor.blackColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: List.generate(productItems.length, (index) {
                      var product = productItems[index];
                      return ProductCart(product: product);
                    }),
                  ),
                ),
              ]
            ),
          ),
        ),
      ]),
    );
  }
}
