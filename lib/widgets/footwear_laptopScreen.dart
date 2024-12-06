import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FootwearLaptopscreen extends StatefulWidget {
  const FootwearLaptopscreen({super.key});

  @override
  State<FootwearLaptopscreen> createState() => _FootwearLaptopscreenState();
}

class _FootwearLaptopscreenState extends State<FootwearLaptopscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 120.w),
      height: 980.w,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.red[100],
          image: const DecorationImage(
              image: NetworkImage('assets/images/sportswear.png'),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sportswear',
            style: TextStyle(
                fontSize: 60.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(height: 25.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80.w,
                width: 300.w,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: Center(
                  child: Text(
                      textAlign: TextAlign.center,
                      'Activewear',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
              SizedBox(width: 50.w),
              Container(
                height: 80.w,
                width: 300.w,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: Center(
                  child: Text(
                      textAlign: TextAlign.center,
                      'Footewear',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
