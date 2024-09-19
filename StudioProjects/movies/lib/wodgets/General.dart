import 'package:flutter/material.dart';
import 'package:movies/screens/movie.dart';
class General extends StatelessWidget {
  String title='';
  List movies=[];
   General({super.key,required this.title,required this.movies});

  @override
  Widget build(BuildContext context) {

    return SizedBox(height:300,child:Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                final item=movies[index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>
                        MovieDetails(
                            original_title: item['original_title'],
                            id:  item['id'],
                            backdrop_path:  item['backdrop_path'],
                            overview:  item['overview'],
                            vote_average:item['vote_average'].toString()
                        )

                    ));
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.network(
                          cacheHeight: 300,
                          cacheWidth: 200,
                          fit: BoxFit.cover,
                          "https://image.tmdb.org/t/p/w500${movies[index]['poster_path']}")),
                );
              },
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ))
          ],
        ));
  }
}




