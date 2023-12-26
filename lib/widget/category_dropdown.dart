import 'package:budget_tracker/utils/icon_list.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryDropDown extends StatelessWidget {
  final String? cattype;
  final ValueChanged<String?> onChanged;
  var appIcons = AppIcon();
  CategoryDropDown({super.key, this.cattype, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: cattype,
        isExpanded: true,
        hint: const Text('Select Category'),
        items: appIcons.homeExpansesCategories
            .map((e) => DropdownMenuItem<String>(
              value: e['name'],
              child: Row(
                children: [
                  Icon(e['icon'],color: Colors.black45,),
                  const SizedBox(width: 10,),
                  Text(e['name'], style: const TextStyle(color: Colors.black45),),
                ],
              )))
            .toList(),
        onChanged: onChanged);
  }
}
