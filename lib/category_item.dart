import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  const CategoryItem({required this.title, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.3), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Text(title),
    );
  }
}
