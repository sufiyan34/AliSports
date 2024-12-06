import 'package:alisportspk/widgets/badmintionEquipmentEquipmentSale.dart';
import 'package:alisportspk/widgets/cricketing_equipment_sale.dart';
import 'package:alisportspk/widgets/exerciseAndFitnessEquipmentSale.dart';
import 'package:alisportspk/widgets/limited_time_sale.dart';
import 'package:alisportspk/widgets/sportsFootwearEquipmentSale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LaptopShopNowScreen extends StatefulWidget {
  const LaptopShopNowScreen({super.key});

  @override
  State<LaptopShopNowScreen> createState() => _LaptopShopNowScreenState();
}

class _LaptopShopNowScreenState extends State<LaptopShopNowScreen> {
  int? selectedindex;
  final PageController _scrollController = PageController();
  void scrollForward() {
    _scrollController.animateTo(
      _scrollController.position.pixels +
          _scrollController.position.viewportDimension,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  void scrollBackward() {
    _scrollController.animateTo(
      _scrollController.position.pixels -
          _scrollController.position.viewportDimension,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  bool clicked = false;
  List<Widget> pagesToNavigate = [
    // const Placeholder(),
    //  const Placeholder(),
    // const Placeholder(),
    // const Placeholder(),
    // const Placeholder(),
    LimitedTimeSale(),
    const CricketingEquipmentSale(),
    const BadmintionEquipmentEquipmentSale(),
    const ExerciseAndFitnessEquipmentSale(),
    const SportsFootwearEquipmentSale()
  ];
  final List<Map<String, String>> textUrlsMap = [
    {
      "image": "assets/images/unsplash9.png",
      "title": "Limmited Time Offers",
    },
    {
      "image": " assets/images/sports_unsplash8.jpg",
      "title": "Cricketing Equipment",
    },
    {
      "image": "assets/images/sports_unsplash1.jpg",
      "title": "Badmintion Equipment",
    },
    {
      "image": 'assets/images/sports_unsplash6.jpg',
      "title": "Exercise & Fitness",
    },
    {
      "image": 'assets/images/sports_unsplash5.jpg',
      "title": "Sports Footwear",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 980.w,
          child: ListView.builder(
              itemCount: textUrlsMap.length,
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Stack(children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 980.w,
                      child: Image.network(
                        textUrlsMap.elementAt(index)["image"]!,
                        fit: BoxFit.contain,
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Container(
                        color: Colors.white,
                        height: 200.w,
                        width: 400.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${textUrlsMap.elementAt(index)["title"]},",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 22.sp)),
                            Text(
                                "Grab Your Favorite Sports Gear At Amizing Prices!",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 14.sp)),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  clicked = !clicked;
                                  selectedindex = index;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          pagesToNavigate[index],
                                    ),
                                  );

                                  // Get.to(LimitedTimeSale());
                                });
                              },
                              child: Container(
                                height: 50.w,
                                color: Colors.black,
                                width: 150.w,
                                child: Center(
                                    child: Text(
                                  "Shop Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14.sp),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]);
              }),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    scrollBackward();
                    setState(() {});
                  },
                  icon: CachedNetworkImage(
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: 'assets/images/leftarrow.png',
                    height: 20.w,
                    width: 20.w,
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                child: SmoothPageIndicator(
                    controller: _scrollController,
                    count: textUrlsMap.length,
                    effect: const ColorTransitionEffect(
                        dotHeight: 10.0,
                        dotWidth: 10.0,
                        strokeWidth: 2,
                        activeStrokeWidth: 1,
                        activeDotColor: Colors.black,
                        dotColor: Colors.white),
                    onDotClicked: (index) {
                      _scrollController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }),
              ),
              IconButton(
                  onPressed: () {
                    scrollForward();
                    setState(() {});
                  },
                  icon: CachedNetworkImage(
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: 'assets/images/rightarrow.png',
                    height: 20.w,
                    width: 20.w,
                  )),
            ],
          ),
        )
      ],
    );
  }
}
