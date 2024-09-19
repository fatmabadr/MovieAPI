import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/screens/video.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
class MovieDetails extends StatelessWidget {
  String backdrop_path="";
  int id;
  String original_title="";
  String overview="";
  String vote_average="";


   MovieDetails({super.key,required this.original_title,required this.id,required this.backdrop_path,required this.overview,required this.vote_average});

  @override

  Widget build(BuildContext context) {
    print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    print("https://image.tmdb.org/t/p/w500$backdrop_path");
    return  Scaffold(backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.black,
                    width:double.infinity,
                    height: 500,
                    child: Stack(children: [
                    Positioned.fill(child:
                    Image.network(
                      fit: BoxFit.cover,
                      "https://image.tmdb.org/t/p/w500$backdrop_path",)
              ),

                    Positioned(
                        bottom: 0,
                        child: Container(
                          height: 100,
                          width: 500,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Colors.black.withOpacity(0),
                                Colors.black
                              ])),
                        )),
                      Positioned(bottom:30,child:Text(original_title,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w700),)),
                      Positioned(bottom:0,child:Row(children: [
                        Text(vote_average ,style: TextStyle(color: Colors.white,fontSize: 20)),
                        SizedBox(width: 10,),
                        Icon(Icons.star,color: Colors.yellow,)

                        ],)),
                      Positioned(bottom:0,right:10,child:IconButton(onPressed: (){

    Share.share('https://www.themoviedb.org/movie/$id-the-shawshank-redemption');

  }, icon: Icon(Icons.share,color: Colors.white,size: 35,),)),


                    ],
                ),
              ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  width: double.infinity,
                  height: 60,
                  child: MaterialButton(
                    child: Text('Watch Trailer',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                    onPressed: ()async {

                      final response=await http.get(Uri.parse('https://api.themoviedb.org/3/movie/$id/videos?api_key=6041be9c4f792aefd214e99c4c85f4aa'));
                      final data=json.decode(response.body);
                      var source ="https://www.youtube.com/watch?v=${data['results'][1]['key']}";
                      print(source);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoScreen(video_id:data['results'][1]['key'])));

                    },
                  ),
                ),
              ),
                  SizedBox(height: 30,),
                  Text(overview,style: TextStyle(color: Colors.white,fontSize: 20),),
            ],
          ),
            )
          ]),
    );
  }
}



// https://www.themoviedb.org/movie/519182-despicable-me-4
//
// https://youtu.be/LtNYaH61dXY
