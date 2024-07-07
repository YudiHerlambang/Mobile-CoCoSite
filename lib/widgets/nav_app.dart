import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:mobile/utils/color.dart';

class NavApp extends StatelessWidget {
  final Size size;
  const NavApp({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.8,
      backgroundColor: CustomColor.whiteColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      automaticallyImplyLeading: false,
      primary: false,
      excludeHeaderSemantics: true,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 8,
            right: 10,
            left: 10,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'CocoSite',
                    style: TextStyle(
                      fontSize: 24,
                      color: CustomColor.blackColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  IconBadge(
                    icon: const Icon(
                      Icons.message_outlined,
                    ),
                    itemCount: 2,
                    badgeColor: Colors.red,
                    itemColor: Colors.white,
                    hideZero: true,
                    onTap: () {
                      print("test");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
