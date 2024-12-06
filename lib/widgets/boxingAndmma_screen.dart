import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxingandmmaScreen extends StatefulWidget {
  const BoxingandmmaScreen({super.key});

  @override
  State<BoxingandmmaScreen> createState() => _BoxingandmmaScreenState();
}

class _BoxingandmmaScreenState extends State<BoxingandmmaScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.w, bottom: 50.w),
      height: 750.sp,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.orange[200],
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('assets/images/boxingImage.jpg'))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Boxing and MMA Essentials',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.sp,
                  fontWeight: FontWeight.w400)),
          SizedBox(height: 20.w),
          InkWell(
            onTap: () {
              setState(() {});
            },
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              height: 50.w,
              width: 100.w,
              child: Center(
                child: Text(
                  'View All',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
