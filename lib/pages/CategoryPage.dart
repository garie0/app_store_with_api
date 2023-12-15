import 'package:app_store/models/game.dart';
import 'package:app_store/models/game_model.dart';
import 'package:app_store/pages/GamePage.dart';
import 'package:app_store/services/service.dart';
import 'package:app_store/widgets/CustomNavBar.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final List<String> categories;
  final List<Game> games;
  final List<Game> recommendedGames;

  CategoryPage(
      {required this.categories,
      required this.games,
      required this.recommendedGames});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(
                top: 30), // Sesuaikan dengan margin yang Anda inginkan
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color:
                        Colors.white, // Ubah warna tombol kembali menjadi putih
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: ApiService().fetchgenre(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text("Error"),
                );
              }

              Set<String> uniqueGenres = Set.from(snapshot.data ?? []);
              List<String> uniqueGenreList = uniqueGenres.toList();

              return Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: uniqueGenreList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameListPage(
                              category: uniqueGenreList[index],
                              games: games,
                              recommendedGames: recommendedGames,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 3.0,
                        margin: EdgeInsets.all(16.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 8.0),
                              Text(
                                uniqueGenreList[index],
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

class GameListPage extends StatelessWidget {
  final String category;
  final List<Game> games;
  final List<Game> recommendedGames;

  GameListPage(
      {required this.category,
      required this.games,
      required this.recommendedGames});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(
                top: 24), 
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color:
                        Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Games - $category',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: ApiService().fetchapi(category),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error"),
                    );
                  }
                  List<GameModel> filteredGames =
                  (snapshot.data as List<GameModel>).where((game) => game.genre == category).toList();

                  return ListView.builder(
                    itemCount: filteredGames.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              "${filteredGames[index].thumbnail}",
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            "${filteredGames[index].title}",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            _truncateDescription(
                                "${filteredGames[index].shortDescription}"),
                            style: TextStyle(
                              fontSize: 14.0,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GamePage(
                                  game: filteredGames[index].toJson(),
                                  recommendedGames: recommendedGames,
                                  selectedCategory: category,
                                  games: games,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  String _truncateDescription(String description) {
    if (description.length > 50) {
      return description.substring(0, 50) + '...';
    }
    return description;
  }
}
