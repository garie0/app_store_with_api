import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_store/pages/HomePage.dart';
import 'package:app_store/pages/CategoryPage.dart';
import 'package:app_store/pages/GamePage.dart';
import 'package:app_store/models/game.dart';

void main() {
  List<Game> games = [
    Game(title: "", category: "", rating: 4.8, description: ""),
  ];
  List<String> categories = games.map((game) => game.category).toSet().toList();
  runApp(MyApp(
    categories: categories,
    games: games,
  ));
}

class MyApp extends StatefulWidget {
  final List<String> categories;
  final List<Game> games;

  MyApp({required this.categories, required this.games});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0F111D),
      ),
      routes: {
        "/": (context) => HomePage(),
        "categoryPage": (context) => CategoryPage(categories: widget.categories, games: widget.games, recommendedGames: widget.games),
        "gamePage": (context) => GamePage(
          game: 
          {},
          recommendedGames: widget.games,
          selectedCategory: "RPG",
          games: widget.games,
        ),
      },
    );
  }
}
