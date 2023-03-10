import 'package:flutter/material.dart';
import 'package:meals_flutter_app/models/meal.dart';
import 'package:meals_flutter_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meal';
  final List<Meal> availableMeals;
  const CategoryMealScreen(this.availableMeals, {super.key});

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late List<Meal> displayedMeals;
  String title = '';
  var _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      title = routeArgs['title']!;
      displayedMeals = widget.availableMeals
          .where((element) => element.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        }),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
