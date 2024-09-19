import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

class MovieProvider extends ChangeNotifier {
  List<dynamic> _topRated = [];

  List<dynamic> get topRatedMovies => _topRated;

  List<dynamic> _favorate = [];

  List<dynamic> get favorateMovies => _favorate;

  List<dynamic> _MostPopular = [];

  List<dynamic> get MostPopularMovies => _MostPopular;

  Future<void> fetchTopRated() async {
    var link = "https://api.themoviedb.org/3/movie/top_rated?api_key=6041be9c4f792aefd214e99c4c85f4aa";
    final response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _topRated = data['results'];

      notifyListeners();
    }
    else {
      throw Exception('Faild to fetch movies');
    }
  }

  Future<void> fetchMostPopularMovies() async {
    var link = "https://api.themoviedb.org/3/movie/popular?api_key=6041be9c4f792aefd214e99c4c85f4aa";
    final response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _MostPopular = data['results'];

      notifyListeners();
    }
    else {
      throw Exception('Faild to fetch movies');
    }
  }

  Future<void> fetchfavorateMovies() async {
    var link = "https://api.themoviedb.org/3/movie/top_rated?api_key=6041be9c4f792aefd214e99c4c85f4aa";
    final response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _favorate = data['results'];

      notifyListeners();
    }
    else {
      throw Exception('Faild to fetch movies');
    }
  }
}
