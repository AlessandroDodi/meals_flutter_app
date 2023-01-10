import 'package:flutter/material.dart';
import 'package:meals_flutter_app/widgets/main_drawer.dart';
import 'favorites_screen.dart';
import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Widget>> _pages = [
    {'page': const CategoriesScreen(), 'title': const Text('Categories')},
    {'page': const FavoriteScreen(), 'title': const Text('Favorites')},
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  //Tabs at the bottom
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (_pages[_selectedPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
    );

    // Tabs at the top
    // Widget build(BuildContext context) {
    //   return DefaultTabController(
    //       length: 2,
    //       child: Scaffold(
    //         appBar: AppBar(
    //           title: const Text('Meals'),
    //           bottom: TabBar(
    //             onTap: (value) {},
    //             tabs: const [
    //               Tab(
    //                 icon: Icon(Icons.category),
    //                 text: "Categories",
    //               ),
    //               Tab(
    //                 icon: Icon(Icons.star),
    //                 text: "Favorites",
    //               ),
    //             ],
    //           ),
    //         ),
    //         body: const TabBarView(
    //             children: [CategoriesScreen(), FavoriteScreen()]),
    //       ));
    // }
  }
}
