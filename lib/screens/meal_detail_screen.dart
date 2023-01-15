import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isMealFavorite;
  const MealDetailScreen(this.isMealFavorite, this.toggleFavorite, {super.key});

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(12)),
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle('Ingredients', context),
          buildContainer(ListView.builder(
              itemBuilder: ((context, index) => Card(
                    color: Theme.of(context).cardColor,
                    child: Text(selectedMeal.ingredients[index]),
                  )),
              itemCount: selectedMeal.ingredients.length)),
          buildSectionTitle('Steps', context),
          buildContainer(ListView.builder(
              itemBuilder: ((context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            (index + 1).toString(),
                          ),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const Divider()
                    ],
                  )),
              itemCount: selectedMeal.steps.length))
        ],
      ),
      floatingActionButton: IconButton(
        icon: Icon(
            isMealFavorite(selectedMeal.id) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorite(selectedMeal.id),
      ),
    );
  }
}
