import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class SaleitemBrandFilter extends StatefulWidget {
  SaleitemBrandFilter({super.key});

  static List<BrandItemMap> brandItemMap = [
    BrandItemMap(items: 23, brandName: "Nike"),
    BrandItemMap(items: 48, brandName: "Adidas"),
    BrandItemMap(items: 35, brandName: "Puma"),
    BrandItemMap(items: 60, brandName: "Under Armour"),
    BrandItemMap(items: 15, brandName: "Reebok"),
    BrandItemMap(items: 80, brandName: "New Balance"),
    BrandItemMap(items: 45, brandName: "Asics"),
    BrandItemMap(items: 22, brandName: "Fila"),
    BrandItemMap(items: 37, brandName: "Converse"),
    BrandItemMap(items: 90, brandName: "Jordan"),
    BrandItemMap(items: 67, brandName: "Skechers"),
    BrandItemMap(items: 55, brandName: "Mizuno"),
    BrandItemMap(items: 12, brandName: "Columbia"),
    BrandItemMap(items: 74, brandName: "Champion"),
    BrandItemMap(items: 33, brandName: "Patagonia"),
    BrandItemMap(items: 88, brandName: "North Face"),
    BrandItemMap(items: 29, brandName: "Brooks"),
    BrandItemMap(items: 66, brandName: "Vans"),
    BrandItemMap(items: 18, brandName: "Oakley"),
    BrandItemMap(items: 42, brandName: "Umbro"),
    BrandItemMap(items: 51, brandName: "Kappa"),
    BrandItemMap(items: 39, brandName: "Diadora"),
    BrandItemMap(items: 25, brandName: "Lululemon"),
    BrandItemMap(items: 58, brandName: "Salomon"),
    BrandItemMap(items: 92, brandName: "Speedo"),
    BrandItemMap(items: 77, brandName: "Decathlon"),
  ];

  @override
  State<SaleitemBrandFilter> createState() => _SaleitemBrandFilterState();
}

class _SaleitemBrandFilterState extends State<SaleitemBrandFilter> {
  final _items = SaleitemBrandFilter.brandItemMap
      .map((e) => MultiSelectItem(e, e.brandName!))
      .toList();

  final _multiSelectKey = GlobalKey<FormFieldState>();

  List<BrandItemMap> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      child: MultiSelectDialogField(
        dialogHeight: 600.h,
        confirmText: const Text('Ok'),
        dialogWidth: 600.w,
        items: _items,
        key: _multiSelectKey,
        searchable: true,
        initialValue: _selectedItems, // Set initial selected values
        onConfirm: (values) {
          setState(() {
            // _selectedItems.add(values);
            _selectedItems =
                values.cast<BrandItemMap>(); // Update selected items
          });
        },

        chipDisplay: MultiSelectChipDisplay(
          scroll: true,
          textStyle: const TextStyle(color: Colors.black87),
          chipColor: Colors.white70,
          scrollBar: HorizontalScrollBar(),
          onTap: (value) {
            setState(() {
              _selectedItems.remove(value); // Update selected items
            });
          },
        ),
        title: Text(' ${_selectedItems.length} selected'),
        selectedColor: Colors.blue,
        decoration: null,
        buttonIcon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey,
        ),
        buttonText: Text(
          "Brand",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}

class BrandItemMap {
  final int? items;
  final String? brandName;

  BrandItemMap({
    this.items,
    this.brandName,
  });
}
