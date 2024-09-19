import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  String original_title='';
  String original_language='';
  String poster_path='';
  String backdrop_path='';

  Future getTopRated()async{
    Random random=Random();
    int randomNumber=random.nextInt(9);
    final rasponse=await http.get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=6041be9c4f792aefd214e99c4c85f4aa'));

    if(rasponse.statusCode==200){

    final data=json.decode(rasponse.body);
    var result=data['results'];

    setState(() {
      original_title=data['results'][randomNumber]['original_title'];
      original_language=data['results'][randomNumber]['original_language'];
      poster_path=data['results'][randomNumber]['poster_path'];
      backdrop_path=data['results'][randomNumber]['backdrop_path'];


    });
  }
  else{
    if(kDebugMode){print("network error");}
  }
  }
  @override void initState() {
    // TODO: implement initState
    super.initState();
    getTopRated();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: Colors.black,
          height: MediaQuery.sizeOf(context).height / 2,
          child: poster_path == ''
              ? Container()
              : Image.network(
                  "https://image.tmdb.org/t/p/w500$poster_path",
                  fit: BoxFit.cover,
                ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(gradient: LinearGradient(begin:Alignment.topCenter ,end:Alignment.bottomCenter ,colors: [Colors.transparent,Colors.black])),
            width: MediaQuery.sizeOf(context).width,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  original_title,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Text(
                  "language:  $original_language",
                  style: TextStyle(color: Colors.yellow, fontSize: 30),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}





