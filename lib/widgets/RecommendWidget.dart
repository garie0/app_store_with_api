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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          
          
          child: Row(
            children: shuffledGames.take(7).map((game) {
           
              return Container(
                
               
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      // Notify the GamePage about the selected game  
                      onGameSelected(game);
                    },
                    child: Container(
              
                      child: ClipRRect(
                        
                        borderRadius: BorderRadius.circular(10),

                        child: Image.asset(
                          "assets/${game.title}.jpg",
                          height: 100,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
