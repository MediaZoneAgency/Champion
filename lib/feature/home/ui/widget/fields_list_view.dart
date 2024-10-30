import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'field_circle.dart';

class CategoryListView extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.design_services, 'label': 'Design'},
    {'icon': Icons.code, 'label': 'Programming'},
    {'icon': Icons.business_center, 'label': 'Business'},
    {'icon': Icons.more_horiz, 'label': 'More'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CategoryItem(
              icon: categories[index]['icon'],
              label: categories[index]['label'],
            ),
          );
        },
      ),
    );
  }
}