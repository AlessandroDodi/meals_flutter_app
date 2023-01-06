import 'package:flutter/material.dart';
import 'package:meals_flutter_app/screens/categories_screen.dart';
import 'package:meals_flutter_app/screens/category_meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const CategoriesScreen(),
      routes: {CategoryMealScreen.routeName: (context) => CategoryMealScreen()},
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
