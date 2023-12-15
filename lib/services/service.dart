import 'dart:convert';
import 'package:app_store/models/game.dart';
import 'package:app_store/models/game_model.dart';
import 'package:http/http.dart';

class ApiService {
  Future<List> fetchapi2 () async {
    try {
      Response response = await get(Uri.parse("https://www.freetogame.com/api/games"));
      List datasnew = jsonDecode(response.body);
      return datasnew;
    } catch (e) {
      return [];
    }
  }

  Future<List<GameModel>> fetchapi (String genre) async {
    try {
      Response response = await get(Uri.parse("https://www.freetogame.com/api/games"));
      List datasnew = jsonDecode(response.body);
      List<GameModel> listData = [];
      datasnew.forEach((element) {listData.add(GameModel.fromJson(element));});
      listData.where((element) => element.genre == genre);
      return listData;
    } catch (e) {
      return [];
    }
  }

  Future<List> fetchgenre () async {
    try {
      Response response = await get(Uri.parse("https://www.freetogame.com/api/games"));
      List datasnew = jsonDecode(response.body);
      List<GameModel> listData = [];
      datasnew.forEach((element) {listData.add(GameModel.fromJson(element));});
      List listGenres = [];
      listData.forEach((element) {listGenres.add(element.genre);});
      
      print("genre"+listGenres[1]);
      return listGenres;
    } catch (e) {
      return [];
    }
  }



  Future<List> fetchapi3 () async {
    try {
      Response response = await get(Uri.parse("https://www.freetogame.com/api/games?sort-by=relevance"));
      List datasnew = jsonDecode(response.body);
      return datasnew;
    } catch (e) {
      return [];
    }
  }
}