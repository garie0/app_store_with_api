import 'package:app_store/pages/GamePage.dart';
import 'package:app_store/services/service.dart';
import 'package:flutter/material.dart';
import 'package:app_store/models/game.dart';
import 'dart:math';

class RecommendWidget extends StatelessWidget {
  final List<Game> games;
  final Function(Game) onGameSelected;

  RecommendWidget({required this.games, required this.onGameSelected});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final List<Game> shuffledGames = List.from(games)..shuffle(random);
    print(shuffledGames.length);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        FutureBuilder(
            future: ApiService().fetchapi2(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else {
                List data = snapshot.data!;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    for (int i = 1; i < data.length; i++)
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GamePage(
                                    game: data[i],
                                    recommendedGames: games,
                                    selectedCategory: "",
                                    games: [],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  data[i]["thumbnail"] ??
                                      "https://awsimages.detik.net.id/community/media/visual/2023/05/10/ilustrasi-kucing-oren.jpeg?w=1200",
                                  height: 100,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                  ]),
                );
              }
            }),
      ],
    );
  }
}
