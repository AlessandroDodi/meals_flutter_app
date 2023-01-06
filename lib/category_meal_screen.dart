import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  final String title;
  final String categoryId;
  final Color? color;
  const CategoryMealScreen(
      {required this.categoryId, required this.title, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(title),
        ));
  }
}
