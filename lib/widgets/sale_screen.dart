import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  bool _tap = false;
  int? itemindex;
  final List<Map<String, String>> saleItemsUrlsMap = [
    {
      "image": "assets/images/saleItem7-removebg-preview.png",
      "image2": "assets/images/saleItem7_1-removebg-preview.png",
      "title": "CA Kamo Cricket Shoes",
      "Price": "Rs.6,500.00 PKR",
    },
    {
      "image": "assets/images/saleItem1_1-removebg-preview.png",
      "image2": "assets/images/saleItem1_2-removebg-preview.png",
      "title": "Summer Sports V2 T-Shirt",
      "Price": "Rs.1,450.00 PKR",
    },
    {
      "image": "assets/images/saleItem2_1-removebg-preview.png",
      "image2": "assets/images/saleItem2_2-removebg-preview.png",
      "title": "Summer Sports V3 T-Shirt",
      "Price": "Rs.1,450.00 PKR",
    },
    {
      "image": "assets/images/saleItem3_1-removebg-preview.png",
      "image2": "assets/images/saleItem3_2-removebg-preview.png",
      "title": "Summer Sports V4 T-Shirt",
      "Price": "Rs.1,490.00 PKR",
    },
    {
      "image": "assets/images/saleItem4_1-removebg-preview.png",
      "image2": "assets/images/saleItem4_2-removebg-preview.png",
      "title": "Dual Tone Dry Sports T-Shirt",
      "Price": "Rs.1,490.00 PKR",
    },
    {
      "image": "assets/images/saleItem5_1-removebg-preview.png",
      "image2": "assets/images/saleItem5_2-removebg-preview.png",
      "title": "Dual Tone Dry Sports V2 T-Shirt",
      "Price": "Rs.1,490.00 PKR",
    },
    {
      "image": "assets/images/saleItem8_1-removebg-preview.png",
      "image2": "assets/images/saleItem8-removebg-preview.png",
      "title": "CA PRO Boost Cricket Shoes",
      "Price": "Rs.1,550.00 PKR",
    },
    {
      "image": "assets/images/saleItem6_1-removebg-preview.png",
      "image2": "assets/images/saleItem6_2-removebg-preview.png",
      "title": "Dual Tone Dry Sports V8 T-Shirt",
      "Price": "Rs.1,490.00 PKR",
    },
  ];
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(left: 70.w, top: 30.w),
              child: Text("Sale",
                  style: TextStyle(
                      fontSize: 50.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black))),
          SizedBox(
            height: 500.w,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: saleItemsUrlsMap.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {
                    itemindex = index;
                    _tap = !_tap;
                    setState(() {});
                  },
                  child: MouseRegion(
                    onEnter: (event) {
                      itemindex = index;
                      setState(() {});
                    },
                    onExit: (event) {
                      itemindex = null;

                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 45.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 380.w,
                              child: itemindex == index
                                  ? Image.network(
                                      saleItemsUrlsMap
                                          .elementAt(index)["image2"]!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(saleItemsUrlsMap
                                      .elementAt(index)["image"]!)),
                          Wrap(
                            children: [
                              Text(
                                  textAlign: TextAlign.left,
                                  saleItemsUrlsMap.elementAt(index)["title"]!,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.black)),
                            ],
                          ),
                          Text(
                              textAlign: TextAlign.left,
                              saleItemsUrlsMap.elementAt(index)["Price"]!,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 20.w),
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
                      count: saleItemsUrlsMap.length,
                      effect: ColorTransitionEffect(
                          dotHeight: 10.w,
                          dotWidth: 10.w,
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
          ),
          Center(
            child: InkWell(
              onTap: () {
                setState(() {});
              },
              child: Container(
                color: Colors.black,
                height: 50.w,
                width: 150.w,
                child: Center(
                  child: Text("View all",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.white)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
