import 'package:alisportspk/datamodels/productInfo.dart';
import 'package:alisportspk/view/constents/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsLaptopScreen extends StatefulWidget {
  const ItemsLaptopScreen({super.key});

  @override
  State<ItemsLaptopScreen> createState() => _ItemsLaptopScreenState();
}

class _ItemsLaptopScreenState extends State<ItemsLaptopScreen> {
  bool togle = false;
  int? itemindex;
  // Productinfo myProduct = Productinfo();
  // final List<Productinfo> itemsUrlsMap = Productinfo().productinfo;
  //////////////////////////////
  // final List<Map<String, String>> itemsUrlsMap = [
  //   {
  //     "image": "assets/images/armguard.png",
  //     "image2": "assets/images/armguard.png",
  //     "title": "CA Gold Cricket Arm Guard",
  //     "brand": "CA",
  //     "Price": "Rs.1,450.00 PKR",
  //   },
  //   {
  //     "image": "assets/images/chestGuard.png",
  //     "image2": "assets/images/chestguard2.png",
  //     "title": "CA Plus Cricket chest Guard",
  //     "brand": "CA",
  //     "Price": "Rs.1,950.00 PKR",
  //   },
  //   {
  //     "image": "assets/images/cricket_helmet.png",
  //     "image2": "assets/images/crickethelmet2.png",
  //     "title": "CA Plus Cricket Helmet",
  //     "brand": "CA",
  //     "Price": "Rs.4,500.00 PKR",
  //   },
  //   {
  //     "image": "assets/images/thighGuard.png",
  //     "image2": "assets/images/thightguard3.png",
  //     "title": "CA Performance 15000 Thigh Pad",
  //     "brand": "CA",
  //     "Price": "Rs.5,450.00 PKR",
  //   },
  //   {
  //     "image": "assets/images/thighguard2.png",
  //     "image2": "assets/images/thighguard4.png",
  //     "title": "CA Performance 10000 Thigh Pad",
  //     "brand": "CA",
  //     "Price": "Rs.4,650.00 PKR",
  //   },
  //   {
  //     "image": "assets/images/shoes.png",
  //     "image2": "assets/images/shoes2.png",
  //     "title": "CA Kamo Cricket Shoes",
  //     "brand": "CA",
  //     "Price": "Rs.6,500.00 PKR",
  //   },
  //   {
  //     "image": "assets/images/rollerStick2.png",
  //     "image2": "assets/images/rollerStick.png",
  //     "title":
  //         "Deep Tissue Muscle Massage Roller Stick for Pain Relief & Recovery ",
  //     "brand": "ALI SPORTS",
  //     "Price": "Rs.1,550.00 PKR",
  //   },
  //   {
  //     "image2": "assets/images/yogaball2.png",
  //     "image": "assets/images/yogaball.png",
  //     "title": "Anti-Burst Exercise Gym Ball for Yoga & Fitness",
  //     "brand": "ALI SPORTS",
  //     "Price": "Rs.1,850.00 PKR",
  //   },
  // ];
////////////////////////
  ///
  // List<Map<String, dynamic>> itemsUrlsMap = [
  //   {
  //     "image": "assets/images/armguard.png",
  //     "image2": "assets/images/armguard.png",
  //     "title": "CA Gold Cricket Arm Guard",
  //     "brand": "CA",
  //     "textualPrice": "Rs.1,450.00 PKR",
  //     "price": 1450.00,
  //     "mainCategory": "cricket ",
  //     "subCategory": "leg wear",
  //     "size": "Large",
  //     "discount": 25.0,
  //     "quantity": 25,
  //   },
  //   {
  //     "image": "assets/images/saleItem7-removebg-preview.png",
  //     "image2": "assets/images/saleItem7_1-removebg-preview.png",
  //     "title": "CA Kamo Cricket Shoes",
  //     "brand": "CA",
  //     "textualPrice": "Rs.6,500.00 PKR",
  //     "price": 6500.00,
  //     "mainCategory": "cricket ",
  //     "discount": 25.0,
  //     "quantity": 25,
  //   },
  //   {
  //     "image": "assets/images/saleItem1_1-removebg-preview.png",
  //     "image2": "assets/images/saleItem1_2-removebg-preview.png",
  //     "title": "Summer Sports V2 T-Shirt",
  //     "brand": "Psl",
  //     "textualPrice": "Rs.1,450.00 PKR",
  //     "price": 1450.00,
  //     "mainCategory": "cricket ",
  //     "discount": 11.0,
  //     "quantity": 25,
  //   },
  //   {
  //     "image": "assets/images/saleItem2_1-removebg-preview.png",
  //     "image2": "assets/images/saleItem2_2-removebg-preview.png",
  //     "title": "Summer Sports V3 T-Shirt",
  //     "brand": "Psl",
  //     "textualPrice": "Rs.1,450.00 PKR",
  //     "price": 1450.00,
  //     "mainCategory": "cricket ",
  //     "discount": 22.0,
  //     "quantity": 25,
  //   },
  //   {
  //     "image": "assets/images/saleItem3_1-removebg-preview.png",
  //     "image2": "assets/images/saleItem3_2-removebg-preview.png",
  //     "title": "Summer Sports V4 T-Shirt",
  //     "brand": "Psl",
  //     "textualPrice": "Rs.1,490.00 PKR",
  //     "price": 1490.00,
  //     "mainCategory": "cricket ",
  //     "discount": 19.0,
  //     "quantity": 25,
  //   },
  //   {
  //     "image": "assets/images/saleItem4_1-removebg-preview.png",
  //     "image2": "assets/images/saleItem4_2-removebg-preview.png",
  //     "title": "Dual Tone Dry Sports T-Shirt",
  //     "brand": "Psl",
  //     "textualPrice": "Rs.1,490.00 PKR",
  //     "price": 1490.00,
  //     "mainCategory": "cricket ",
  //     "discount": 16.0,
  //     "quantity": 25,
  //   },
  //   {
  //     "image": "assets/images/saleItem5_1-removebg-preview.png",
  //     "image2": "assets/images/saleItem5_2-removebg-preview.png",
  //     "title": "Dual Tone Dry Sports V2 T-Shirt",
  //     "brand": "Psl",
  //     "textualPrice": "Rs.1,490.00 PKR",
  //     "price": 1490.00,
  //     "mainCategory": "cricket",
  //     "discount": 25.0,
  //     "quantity": 25,
  //   },
  //   {
  //     "image": "assets/images/saleItem8_1-removebg-preview.png",
  //     "image2": "assets/images/saleItem8-removebg-preview.png",
  //     "title": "CA PRO Boost Cricket Shoes",
  //     "brand": "CA",
  //     "textualPrice": "Rs.1,550.00 PKR",
  //     "price": 1550.00,
  //     "mainCategory": "cricket",
  //     "discount": 25.0,
  //     "quantity": 25,
  //   },
  //   {
  //     "image": "assets/images/saleItem6_1-removebg-preview.png",
  //     "image2": "assets/images/saleItem6_2-removebg-preview.png",
  //     "title": "Dual Tone Dry Sports V8 T-Shirt",
  //     "brand": "Psl",
  //     "textualPrice": "Rs.1,490.00 PKR",
  //     "price": 1490.00,
  //     "mainCategory": "cricket ",
  //     "discount": 20.0,
  //     "quantity": 25,
  //   },
  //   {
  //     "image": "assets/images/chestGuard.png",
  //     "image2": "assets/images/chestguard2.png",
  //     "title": "CA Plus Cricket chest Guard",
  //     "brand": "CA",
  //     "textualPrice": "Rs.1,950.00 PKR",
  //     "price": 1950.00,
  //     "mainCategory": "cricket",
  //     "discount": 12.0,
  //     "quantity": 25,
  //   },
  //   {
  //     "image": "assets/images/cricket_helmet.png",
  //     "image2": "assets/images/crickethelmet2.png",
  //     "title": "CA Plus Cricket Helmet",
  //     "brand": "CA",
  //     "textualPrice": "Rs.4,500.00 PKR",
  //     "price": 4500.00,
  //     "mainCategory": "cricket",
  //     "discount": 19.0,
  //     "quantity": 25,
  //   },
  //   {
  //     "image": "assets/images/thighGuard.png",
  //     "image2": "assets/images/thightguard3.png",
  //     "title": "CA Performance 15000 Thigh Pad",
  //     "brand": "CA",
  //     "textualPrice": "Rs.5,450.00 PKR",
  //     "price": 5450.00,
  //     "mainCategory": "cricket",
  //     "discount": 25.0,
  //     "quantity": 25,
  //   },
  //   {
  //     "image": "assets/images/thighguard2.png",
  //     "image2": "assets/images/thighguard4.png",
  //     "title": "CA Performance 10000 Thigh Pad",
  //     "brand": "CA",
  //     "textualPrice": "Rs.4,650.00 PKR",
  //     "price": 4650.00,
  //     "mainCategory": "cricket",
  //     "discount": 25.0,
  //     "quantity": 25,
  //   },
  //   {
  //     "image": "assets/images/shoes.png",
  //     "image2": "assets/images/shoes2.png",
  //     "title": "CA Kamo Cricket Shoes",
  //     "brand": "CA",
  //     "textualPrice": "Rs.6,500.00 PKR",
  //     "price": 6500.00,
  //     "mainCategory": "cricket",
  //     "discount": 18.0,
  //     "quantity": 25,
  //   },
  //   {
  //     "image": "assets/images/rollerStick2.png",
  //     "image2": "assets/images/rollerStick.png",
  //     "title":
  //         "Deep Tissue Muscle Massage Roller Stick for Pain Relief & Recovery",
  //     "brand": "ALI SPORTS",
  //     "textualPrice": "Rs.1,550.00 PKR",
  //     "price": 1550.00,
  //     "mainCategory": "massage",
  //     "discount": 14.0,
  //     "quantity": 25,
  //   },
  //   {
  //     "image": "assets/images/yogaball.png",
  //     "image2": "assets/images/yogaball2.png",
  //     "title": "Anti-Burst Exercise Gym Ball for Yoga & Fitness",
  //     "brand": "ALI SPORTS",
  //     "textualPrice": "Rs.1,850.00 PKR",
  //     "price": 1850.00,
  //     "mainCategory": "exercise",
  //     "discount": 25.0,
  //     "quantity": 25,
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 1010.w,
        child: ListView(
          children: [
            Wrap(children: [
              ...Productinfo.productinfo.map((e) {
                int index = Productinfo.productinfo.indexOf(e);
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return OrderItemScreen(
                          productinfo: e,
                          // textualPrice: itemsUrlsMap.elementAt(index)["Price"]!,
                          // brand: itemsUrlsMap.elementAt(index)["brand"]!,
                          // title: itemsUrlsMap.elementAt(index)["title"]!,
                          // image2: itemsUrlsMap.elementAt(index)["image2"]!,
                          // image: itemsUrlsMap.elementAt(index)["image"]!,
                          // discount: itemsUrlsMap.elementAt(index)["discount"]!,
                          // mainCategory:
                          //     itemsUrlsMap.elementAt(index)["mainCategory"]!,
                          // price: itemsUrlsMap.elementAt(index)["price"]!,
                          // totalQuantity:
                          //     itemsUrlsMap.elementAt(index)["quantity"]!,

                          // productinfo: itemsUrlsMap[itemindex!],
                        );
                      },
                    ));
                    togle = true;
                    itemindex = index;
                    setState(() {});
                  },
                  child: MouseRegion(
                    onEnter: (event) {
                      togle = true;
                      itemindex = index;
                      setState(() {});
                    },
                    onExit: (event) {
                      togle = false;
                      itemindex = null;

                      setState(() {});
                    },
                    child: Container(
                      height: 400.w,
                      width: MediaQuery.of(context).size.width * 0.20,
                      margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 45.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 30.w),
                              height: 250.w,
                              child: itemindex == index
                                  ? Image.network(
                                      //itemsUrlsMap[index].image2!,
                                      e.image2.toString(),
                                      // itemsUrlsMap.elementAt(index)["image2"],
                                      height: 250,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      // itemsUrlsMap[index].image!,
                                      //itemsUrlsMap.elementAt(index)["image"]
                                      e.image.toString(),
                                    )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.20,
                            child: Text(
                                // itemsUrlsMap[index].title!,
                                textAlign: TextAlign.left,
                                //itemsUrlsMap.elementAt(index)["title"],
                                e.title.toString(),
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black)),
                          ),
                          Text(
                              // itemsUrlsMap[index].brand!,
                              textAlign: TextAlign.left,
                              e.brand.toString(),
                              //itemsUrlsMap.elementAt(index)["brand"],
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black)),
                          Text(
                              // itemsUrlsMap[index].textualPrice!,
                              textAlign: TextAlign.left,
                              e.textualPrice.toString(),
                              // itemsUrlsMap.elementAt(index)["Price"],
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                );
              })
            ]),
          ],
        ),
      ),
      InkWell(
        onTap: () {
          setState(() {});
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 40.w),
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
      )
    ]);
  }
}
