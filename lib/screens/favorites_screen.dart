import 'package:flutter/material.dart';
import 'package:meals_flutter_app/models/meal.dart';
import 'package:meals_flutter_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favorites;
  const FavoriteScreen(this.favorites, {super.key});
  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return const Center(
          child: Text('There are no favorites. Start adding some!'));
    }
    return ListView.builder(
      itemBuilder: ((context, index) {
        return MealItem(
          id: favorites[index].id,
          title: favorites[index].title,
          imageUrl: favorites[index].imageUrl,
          duration: favorites[index].duration,
          affordability: favorites[index].affordability,
          complexity: favorites[index].complexity,
        );
      }),
      itemCount: favorites.length,
    );
  }
}
