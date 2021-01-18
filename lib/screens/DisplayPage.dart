import 'package:flutter/material.dart';
import 'package:movie_info/models/movie.dart';

class DisplayPage extends StatelessWidget {

  Movie movie;

  String changeToPercent(String rating)
  {
    List<String> strs = rating.split("/");
    if(strs.length<=1)
      return rating;
    double total = double.parse(strs[1]);
    double obtained = double.parse(strs[0]);
    double rat = (obtained/total)*100;
    String st = rat.toStringAsPrecision(2);
    st=st+"%";
    return st;
  }

  DisplayPage(this.movie);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Container( // Poster Image
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
            height: 400.0,
            child: Card(
              margin: EdgeInsets.all(5.0),
              elevation: 10.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
              child: Image.network(movie.poster,fit: BoxFit.fill,),
            ),
          ),
          Container( // Title
            height: 100.0,
            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(40.0)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: Text(movie.title,style: TextStyle(fontSize: 30.0),),
          ),
          Container( // Rated
            height: 100.0,
            decoration: BoxDecoration(color: Colors.white12,borderRadius: BorderRadius.circular(40.0)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: Text("Rated : ${movie.rated}",style: TextStyle(fontSize: 30.0),),
          ),
          Container( // Release Date
            height: 100.0,
            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(40.0)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: Text("Released on: ${movie.released}",style: TextStyle(fontSize: 30.0),),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(color: Colors.white10,borderRadius: BorderRadius.circular(40.0)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: Text("${movie.runtime} long",style: TextStyle(fontSize: 30.0),),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(40.0)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Plot : \n${movie.plot}",style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
            ),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(color: Colors.white10,borderRadius: BorderRadius.circular(40.0)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: Text("Directed by:\n ${movie.director}",textAlign: TextAlign.center,style: TextStyle(fontSize: 30.0),),
          ),
          Container( // Actors
            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(40.0)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Actors:\n${movie.actors}",textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0),),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white10,borderRadius: BorderRadius.circular(40.0)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Genre :\n${movie.genre}",textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0),),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.teal,borderRadius: BorderRadius.circular(40.0)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(movie.awards=="N/A"?"No Awards":movie.awards,style: TextStyle(color:Colors.white,fontSize: 20.0),textAlign: TextAlign.center,),
            ),
          ),
          Container(
            height: 300.0,

            decoration: BoxDecoration(color: Colors.transparent,borderRadius: BorderRadius.circular(40.0)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Container(
                    decoration: BoxDecoration(color: Colors.greenAccent,borderRadius: BorderRadius.circular(50.0)),
                    width: 200.0,
                    margin: EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(movie.ratings[index].source,style: TextStyle(color: Colors.black,fontSize: 30.0),textAlign: TextAlign.center,),
                        Text(changeToPercent(movie.ratings[index].value),style: TextStyle(color: Colors.red,fontSize: 40.0),)
                      ],
                    ),
                  );
                },
                itemCount: movie.ratings.length,
                )
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(40.0)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Produced By: \n ${movie.production}",style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
            ),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(40.0)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: Text("IMDB Rating : ${movie.imdbRating}",style: TextStyle(fontSize: 20.0),),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(40.0)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: Text("IMDB Votes : ${movie.imdbVotes}",style: TextStyle(fontSize: 20.0),),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(40.0)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: Text("Box Office Collection :\n ${movie.boxOffice=="N/A"?"Not Known":movie.boxOffice}",textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0),),
          ),
        ],
      ),
    );
  }
}
