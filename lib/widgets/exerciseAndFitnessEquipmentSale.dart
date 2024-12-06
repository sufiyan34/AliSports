import 'package:alisportspk/view/constents/bottom_page.dart';
import 'package:alisportspk/view/constents/laptop_app_bar.dart';
import 'package:alisportspk/widgets/brands_scrolling_list.dart';
import 'package:alisportspk/widgets/exerciseAndFitnesstSaleItems.dart';
import 'package:alisportspk/widgets/mobile_ap_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ExerciseAndFitnessEquipmentSale extends StatelessWidget {
  const ExerciseAndFitnessEquipmentSale({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            flexibleSpace: ResponsiveBuilder(
              builder: (context, sizingInformation) {
                if (sizingInformation.deviceScreenType ==
                    DeviceScreenType.desktop) {
                  return const LaptopAppBar(
                      // scaffoldKey: scaffoldKey,
                      );
                } else {
                  return const MobileAppBar();
                }
              },
            ),
            toolbarHeight: 280.w,
            backgroundColor: Colors.red,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ExerciseAndFitnesstSaleItems(),
                    BrandsScrollingList(),
                    BottomPage(),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
