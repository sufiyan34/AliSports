import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturesLaptopScreen extends StatefulWidget {
  const FeaturesLaptopScreen({super.key});

  @override
  State<FeaturesLaptopScreen> createState() => _FeaturesLaptopScreenState();
}

class _FeaturesLaptopScreenState extends State<FeaturesLaptopScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.w,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 60.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.local_shipping_outlined,
                  color: Colors.black,
                ),
                iconSize: 50.w,
              ),
              SizedBox(height: 15.w),
              Text(
                "Free Shipping",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "For order above Rs 4999/- ",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color:
                        const Color.fromARGB(255, 32, 32, 32).withOpacity(0.7)),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.network(
                  'assets/images/tag.png',
                  height: 50.w,
                  width: 50.w,
                ),
                color: Colors.black,
              ),
              SizedBox(height: 15.w),
              Text(
                "Lowest Prices Guaranteed",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "Save money when ordering with us ",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color:
                        const Color.fromARGB(255, 32, 32, 32).withOpacity(0.7)),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.network(
                  'assets/images/turn-back.png',
                  height: 50.w,
                  width: 50.w,
                ),
                color: Colors.black,
              ),
              SizedBox(height: 15.w),
              Text(
                "Hassel-free Exchange",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "7 days return and Exchange Policy ",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color:
                        const Color.fromARGB(255, 32, 32, 32).withOpacity(0.7)),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.star_border_outlined,
                  color: Colors.black,
                ),
                iconSize: 50.w,
              ),
              SizedBox(height: 15.w),
              Text(
                "4.7/5 Verified Reviews Rating",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "Customer satisfacyion #1 priority",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color:
                        const Color.fromARGB(255, 32, 32, 32).withOpacity(0.7)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
