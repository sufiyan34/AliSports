import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileAppBar extends StatefulWidget {
  const MobileAppBar({super.key});

  @override
  State<MobileAppBar> createState() => _MobileAppBarState();
}

class _MobileAppBarState extends State<MobileAppBar> {
  CarouselSliderController _scrollController = CarouselSliderController();
  void scrollForward() {
    _scrollController.nextPage(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  void scrollBackward() {
    _scrollController.previousPage(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  List<String> text = [
    'alisportsbwn@gmail.com|0315-2273142',
    "Minimum order: Rs 1000/-"
  ];

  int textIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                scrollBackward();
              });
            },
            icon: Image.network(
              'assets/images/leftarrow.png',
              color: Colors.white,
              height: 10.w,
              width: 10.w,
            )),
        SizedBox(
          height: 50.w,
          width: 500.w,
          child: Center(
            child: CarouselSlider.builder(
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                height: 50.w,
                initialPage: 0,
                enableInfiniteScroll: true,
                enlargeFactor: 0.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    textIndex = index;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
              itemCount: text.length,
              carouselController: _scrollController,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Center(
                  child: SizedBox(
                    width: 500.w,
                    child: Text(
                      textAlign: TextAlign.center,
                      text[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                scrollForward();
              });
            },
            icon: Image.network(
              'assets/images/rightarrow.png',
              color: Colors.white,
              height: 10.w,
              width: 10.w,
            )),
      ],
    );
  }
}
