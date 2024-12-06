import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopCatogryLaptopView extends StatefulWidget {
  const ShopCatogryLaptopView({super.key});

  @override
  State<ShopCatogryLaptopView> createState() => _ShopCatogryLaptopViewState();
}

class _ShopCatogryLaptopViewState extends State<ShopCatogryLaptopView> {
  PageController _catogryController = PageController();
  bool hover = false;
  final List<Map<String, String>> CatagoryMap = [
    {
      "image": "assets/images/catagoryItem1.jpg",
      "title": "Cricket",
    },
    {
      "image": "assets/images/catagoryItem2.jpg",
      "title": "Badmintion",
    },
    {
      "image": "assets/images/catagoryItem3.jpg",
      "title": "Football",
    },
    {
      "image": 'assets/images/catagoryItem4.jpg',
      "title": "Basketball",
    },
    {
      "image": 'assets/images/catagoryItem5.jpg',
      "title": "Tennis",
    },
    {
      "image": "assets/images/catagoryItem6.jpg",
      "title": "Squash",
    },
    {
      "image": "assets/images/catagoryItem7.jpg",
      "title": "Table Tennis",
    },
    {
      "image": "assets/images/catagoryItem12.jpg",
      "title": "Snooker & Billiard",
    },
    {
      "image": "assets/images/catagoryItem9.jpg",
      "title": "Volleyball",
    },
    {
      "image": "assets/images/catagoryItem10.jpg",
      "title": "Swimming",
    },
    {
      "image": "assets/images/catagoryItem11.jpg",
      "title": "Skating & Scooty",
    },
    {
      "image": "assets/images/catagoryItem13.jpg",
      "title": "Indoor Games",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Column(
        children: [
          SizedBox(
            height: 2460.w,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              controller: _catogryController,
              itemCount: CatagoryMap.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.w,
                  mainAxisExtent: 600.w),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _catogryController = index as PageController;
                    setState(() {});
                  },
                  child: MouseRegion(
                    onEnter: (event) {
                      hover = true;
                      setState(() {});
                    },
                    onExit: (event) {
                      hover = false;
                      setState(() {});
                    },
                    child: Container(
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          Container(
                            height: 500.w,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              CatagoryMap.elementAt(index)["image"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.symmetric(
                                horizontal: 20.w),
                            height: 100.w,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(CatagoryMap.elementAt(index)["title"]!,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100,
                                        fontSize: 24.sp)),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Icon(
                                  Icons.east,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
