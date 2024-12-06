import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FitnessScreen extends StatefulWidget {
  const FitnessScreen({super.key});

  @override
  State<FitnessScreen> createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750.w,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
              image: NetworkImage('assets/images/fitness.png'),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Fitness & Recovery Gear",
              style: TextStyle(
                  fontSize: 60.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
          InkWell(
            onTap: () {
              setState(() {});
            },
            child: Container(
              height: 60.w,
              width: 600.w,
              margin: EdgeInsets.symmetric(vertical: 30.w),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              child: Center(
                child: Text("Fitness Equipment",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {});
            },
            child: Container(
              height: 60.w,
              width: 600.w,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              child: Center(
                child: Text("Recovery Support Gear",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
