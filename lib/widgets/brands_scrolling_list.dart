import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BrandsScrollingList extends StatefulWidget {
  const BrandsScrollingList({super.key});

  @override
  State<BrandsScrollingList> createState() => _BrandsScrollingListState();
}

class _BrandsScrollingListState extends State<BrandsScrollingList> {
  int brandindex = 0;
  final CarouselSliderController _scrollController = CarouselSliderController();
  List<String> brandlogos = [
    "assets/images/sportsbrand1.png",
    "assets/images/sportsbrand2.png",
    "assets/images/sportsbrand3.jpeg",
    "assets/images/sportsbrand4.png",
    "assets/images/sportsbrand5.png",
    "assets/images/sportsbrand6.png",
    "assets/images/sportsbrand7.png",
    "assets/images/sportsbrand8.png",
    "assets/images/sportsbrand9.png",
    "assets/images/sportsbrand10.png",
    "assets/images/sportsbrand11.png",
    "assets/images/sportsbrand12.png",
    "assets/images/sportsbrand13.jpeg",
    "assets/images/sportsbrand14.png",
    "assets/images/sportsbrand15.png",
    "assets/images/sportsbrand16.png",
    "assets/images/sportsbrand17.PNG",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50.w),
      width: MediaQuery.of(context).size.width,
      height: 100.w,
      child: CarouselSlider.builder(
        itemCount: brandlogos.length,
        carouselController: _scrollController,
        options: CarouselOptions(
          viewportFraction: 0.2,
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(seconds: 2),
          autoPlayInterval: const Duration(seconds: 2),
          height: 100.w,
          initialPage: 0,
          enableInfiniteScroll: true,
          enlargeFactor: 0.0,
          onPageChanged: (index, reason) {
            setState(() {
              brandindex = index;
            });
          },
          scrollDirection: Axis.horizontal,
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return InkWell(
              onTap: () {
                setState(() {
                  brandindex = index;
                });
              },
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20.w),
                  child: Image.network(brandlogos[index])));
        },
      ),
    );
  }
}
