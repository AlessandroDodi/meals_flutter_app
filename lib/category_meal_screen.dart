import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: Center(
          child: Text(title),
        ));
  }
}
