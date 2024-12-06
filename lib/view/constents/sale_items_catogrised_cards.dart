import 'package:alisportspk/datamodels/productInfo.dart';
import 'package:alisportspk/view/constents/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SaleItemsCatogrisedCards extends StatefulWidget {
  List<Productinfo> productsList = <Productinfo>[];
  SaleItemsCatogrisedCards({super.key, required this.productsList});

  @override
  State<SaleItemsCatogrisedCards> createState() =>
      _SaleItemsCatogrisedCardsState();
}

class _SaleItemsCatogrisedCardsState extends State<SaleItemsCatogrisedCards> {
  bool togle = false;
  int? itemindex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2000.h,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Wrap(children: [
            ...widget.productsList.map((e) {
              int index = Productinfo.productinfo.indexOf(e);
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return OrderItemScreen(
                        productinfo: e,
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
                    color: Colors.red,
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
                                    e.image2.toString(),
                                    height: 250,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    e.image.toString(),
                                  )),
                        Wrap(
                          children: [
                            Text(
                                textAlign: TextAlign.left,
                                e.title.toString(),
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black)),
                          ],
                        ),
                        Text(
                            textAlign: TextAlign.left,
                            e.brand.toString(),
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w200,
                                color: Colors.black)),
                        Text(
                            textAlign: TextAlign.left,
                            e.textualPrice.toString(),
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
    );
  }
}
