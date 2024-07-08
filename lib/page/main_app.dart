import 'package:flutter/material.dart';
import 'package:mobile/page/cart_page.dart';
import 'package:mobile/page/product_main.dart';
import 'package:mobile/page/setting_page.dart';
import 'package:mobile/page/transaction_page.dart';
import 'package:mobile/page/notification_page.dart';
import 'package:mobile/utils/color.dart';

class MainAppPage extends StatefulWidget {
  const MainAppPage({super.key});

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        ProductMainPage(size: MediaQuery.of(context).size),
        CartPage(),
        NotificationPage(),
        TransactionPage(),
        SettingPage(),
      ],
    );
  }

  Widget getFooter() {
    List iconItems = [
      "assets/images/icon-dashboard.png",
      "assets/images/icon-shop.png",
      "assets/images/icon-bell.png",
      "assets/images/icon-transaction.png",
      "assets/images/icon-setting.png",
    ];
    List textItems = [
      "Produk",
      "Keranjang",
      "Notifikasi",
      "Transaksi",
      "Pengaturan",
    ];

    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColor.whiteColor,
        border: Border(
          top: BorderSide(
            color: Colors.black.withOpacity(0.06),
          ),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(iconItems.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                children: [
                  Image.asset(
                    iconItems[index],
                    width: 24,
                    color: pageIndex == index ? Colors.green : Colors.black,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    textItems[index],
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: pageIndex == index ? Colors.green : Colors.black,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
