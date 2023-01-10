import 'package:flutter/material.dart';
import 'package:meals_flutter_app/widgets/category_item.dart';
import 'package:meals_flutter_app/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: [
        ...DUMMY_CATEGORIES.map((e) => CategoryItem(
              id: e.id,
              title: e.title,
              color: e.color,
            ))
      ],
    );
  }
}
