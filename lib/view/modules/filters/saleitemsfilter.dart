import 'package:flutter/material.dart';

class SaleItemsFilter extends StatelessWidget {
  const SaleItemsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Filter'),
        //DropdownButton(items: items, onChanged: onChanged)
      ],
    );
  }
}
