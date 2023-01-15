import 'package:flutter/material.dart';
import 'package:meals_flutter_app/data/dummy_data.dart';
import 'package:meals_flutter_app/models/meal.dart';
import 'package:meals_flutter_app/screens/filters_sreen.dart';
import './screens/tabs_screen.dart';
import '/screens/categories_screen.dart';
import '/screens/category_meal_screen.dart';
import '/screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    _filters = filterData;
    _availableMeals = DUMMY_MEALS.where((meal) {
      if (_filters['gluten']! && !meal.isGlutenFree) {
        return false;
      } else if (_filters['lactose']! && !meal.isLactoseFree) {
        return false;
      } else if (_filters['vegan']! && !meal.isVegan) {
        return false;
      } else if (_filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  void _toggleFavorite(String mealId) {
    final existMeal =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existMeal >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existMeal);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(secondary: Colors.amber),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyMedium: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            titleMedium: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
      ),
      home: TabsScreen(_favoriteMeals),
      routes: {
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_isMealFavorite, _toggleFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Text('test'),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
