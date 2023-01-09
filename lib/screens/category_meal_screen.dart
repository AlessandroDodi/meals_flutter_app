import 'package:flutter/material.dart';
import 'package:meals_flutter_app/widgets/meal_item.dart';
import '../data/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meal';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(id))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity);
        }),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
