import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:alisportspk/widgets/cart_drawer_cartedItem_carousal.dart';
import 'package:alisportspk/widgets/cart_drawer_suggestion_carousal.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartDrawer extends StatefulWidget {
  const CartDrawer({
    super.key,
  });

  @override
  State<CartDrawer> createState() => _CartDrawerState();
}

class _CartDrawerState extends State<CartDrawer> {
  AppControllers appControllers = Get.put(AppControllers());
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 500.w,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Cart',
                        style: TextStyle(fontSize: 30.sp),
                      ),
                      Icon(
                        Icons.close,
                        color: Colors.grey[300],
                      )
                    ],
                  ),
                ],
              ),
            ),
            appControllers.addedInCartProducts.isEmpty
                ? Center(
                    child: Text(
                    'Nothing added in cart',
                    style: TextStyle(fontSize: 30.sp),
                  ))
                : const Column(
                    children: [
                      CartDrawerSuggestionCarousal(),
                      CartDrawerCarteditemCarousal(),
                    ],
                  )
          ],
        ));
  }
}
