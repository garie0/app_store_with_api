import 'package:app_store/pages/GamePage.dart';
import 'package:app_store/services/service.dart';
import 'package:flutter/material.dart';
import 'package:app_store/models/game.dart';

class NewGamesWidget extends StatelessWidget {
  final List<Game> games;

  NewGamesWidget({required this.games});

  @override
  Widget build(BuildContext context) {
    Game game = Game(category: "", description: "", rating: 0, title: "");
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Games",
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
            future: ApiService().fetchapi3(),
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GamePage(
                                game: data[i],
                                recommendedGames: games,
                                selectedCategory:
                                    "", 
                                games: [],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 190,
                          // height: 300,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFF292B37),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF292B37).withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.network(
                                  data[i]["thumbnail"] ??
                                  "https://awsimages.detik.net.id/community/media/visual/2023/05/10/ilustrasi-kucing-oren.jpeg?w=1200", // Gambar sesuai judul game
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 5,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[i]["title"], // Tampilkan judul game
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      data[i]["genre"] ?? "", // Tampilkan tipe game
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      data[i]["developer"], // Tampilkan rating game
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
