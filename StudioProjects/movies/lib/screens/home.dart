import 'package:flutter/material.dart';
import 'package:movies/provider/movieProvider.dart';
import 'package:movies/wodgets/General.dart';
import 'package:movies/wodgets/header.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<MovieProvider>(context).fetchTopRated();
    Provider.of<MovieProvider>(context).fetchMostPopularMovies();


    return  Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(children: [
          Header(),
          General(title: 'Top Rated',movies: Provider.of<MovieProvider>(context).topRatedMovies,),
          General(title: 'Most Popular Movies',movies: Provider.of<MovieProvider>(context).MostPopularMovies,),

        ],),
      ),
    );
  }
}




//https://image.tmdb.org/t/p/w500/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg