import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:alisportspk/view/constents/bottom_page.dart';
import 'package:alisportspk/view/constents/laptop_app_bar.dart';

import 'package:alisportspk/widgets/boxingAndmma_screen.dart';
import 'package:alisportspk/widgets/brands_scrolling_list.dart';
import 'package:alisportspk/widgets/cart_drawer.dart';
import 'package:alisportspk/widgets/features_laptop_screen.dart';
import 'package:alisportspk/widgets/features_mobile_screen.dart';
import 'package:alisportspk/widgets/fitness_screen.dart';
import 'package:alisportspk/widgets/footwear_laptopScreen.dart';
import 'package:alisportspk/widgets/footwear_mobile_screen.dart';
import 'package:alisportspk/widgets/items_laptop_screen.dart';
import 'package:alisportspk/widgets/items_mobile_screem.dart';
import 'package:alisportspk/widgets/laptop_shopnow_screen.dart';
import 'package:alisportspk/widgets/mobile_ap_bar.dart';

import 'package:alisportspk/widgets/mobile_shopnow_screen.dart';
import 'package:alisportspk/widgets/sale_screen.dart';
import 'package:alisportspk/widgets/shop_catogry_laptop.dart';
import 'package:alisportspk/widgets/shop_catogry_mobile.dart';
import 'package:alisportspk/widgets/user_reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.drawerVisible = false});
  final bool drawerVisible;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Uri phoneNumber = Uri.parse('tel:+933204425566');
  final Uri whattsApp = Uri.parse('https://wa.me/+923204425566');
  AppControllers appControllers = Get.put(AppControllers());
  var scaffoldKey = GlobalKey<ScaffoldState>();
  double dynamicHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        endDrawer: const CartDrawer(),
        // checkDrader.openDrader.value == true ? const CartDrawer() : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            try {
              await launchUrl(
                  whattsApp); // Replace with your desired WhatsApp number
              debugPrint('WhatsApp launched successfully');
            } catch (e) {
              debugPrint('Error launching WhatsApp: $e');
            }
          },
          shape: const CircleBorder(),
          child: Image.network(
            "assets/images/whattsapp.png",
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              floating: true,
              flexibleSpace: ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  if (sizingInformation.deviceScreenType ==
                      DeviceScreenType.desktop) {
                    return const LaptopAppBar(
                        // scaffoldKey: scaffoldKey,
                        );
                  } else {
                    return const MobileAppBar();
                  }
                },
              ),
              toolbarHeight: 280.w,
              backgroundColor: Colors.red,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () {
                      debugPrint(
                          ' should open: ${appControllers.openMenuContainer.value}, open index no: ${appControllers.dropdownPlutoMenusIndex.value}');
                      return appControllers.openMenuContainer.value == true
                          ? Container(
                              color: Colors.white.withOpacity(0.90),
                              width: MediaQuery.of(context).size.width,
                              child: appControllers.dropdownPlutoMenus[
                                  appControllers.dropdownPlutoMenusIndex.value],
                            )
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            );
                    },
                  ),
                  ResponsiveBuilder(
                    builder: (context, sizingInformation) {
                      if (sizingInformation.deviceScreenType ==
                          DeviceScreenType.desktop) {
                        return const LaptopShopNowScreen();
                      } else {
                        return const MobileShopNowScreen();
                      }
                    },
                  ),
                  ResponsiveBuilder(
                    builder: (context, sizingInformation) {
                      if (sizingInformation.deviceScreenType ==
                          DeviceScreenType.desktop) {
                        return const FeaturesLaptopScreen();
                      } else {
                        return const FeaturesMobileScreen();
                      }
                    },
                  ),
                  ResponsiveBuilder(
                    builder: (context, sizingInformation) {
                      if (sizingInformation.deviceScreenType ==
                          DeviceScreenType.desktop) {
                        return const FootwearLaptopscreen();
                      } else {
                        return const FootwearMobileScreen();
                      }
                    },
                  ),
                  ResponsiveBuilder(
                    builder: (context, sizingInformation) {
                      if (sizingInformation.deviceScreenType ==
                          DeviceScreenType.desktop) {
                        return const ItemsLaptopScreen();
                      } else {
                        return const ItemsMobileScreen();
                      }
                    },
                  ),
                  const FitnessScreen(),
                  const SaleScreen(),
                  ResponsiveBuilder(
                    builder: (context, sizingInformation) {
                      if (sizingInformation.deviceScreenType ==
                          DeviceScreenType.desktop) {
                        return const ShopCatogryLaptopView();
                      } else {
                        return const ShopCatogryMobileView();
                      }
                    },
                  ),
                  const BoxingandmmaScreen(),
                  const UserReviewsListtiles(),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 350.w),
                      child: const BrandsScrollingList()),
                  const BottomPage(),
                ],
              )),
            )
          ],
        ));
  }
}
