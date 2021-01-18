import 'package:flutter/material.dart';
import 'package:movie_info/backend.dart';
import 'package:movie_info/models/movie.dart';
import 'package:movie_info/screens/DisplayPage.dart';
import 'package:movie_info/screens/movienotfound.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _title="";
  Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar:  AppBar(title: Text("Movie Info",style: TextStyle(color: Colors.white),),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Expanded(
             flex: 1,
             child: Row(
               children: [
                 Expanded(
                   flex: 9,
                   child: Container(
                     margin: EdgeInsets.symmetric(horizontal: 10.0),
                     child: TextField(

                       onChanged: (title){_title=title;},
                       decoration: InputDecoration(border: OutlineInputBorder(),fillColor: Colors.white,filled: true),
                       style: TextStyle(color: Colors.black),
                     ),
                   ),
                 ),
                 Expanded(
                   flex: 1,
                   child: Card(
                     color: Colors.white,
                     child: InkWell(
                       child: Padding(
                         padding: const EdgeInsets.symmetric(vertical:12.0),
                         child: Icon(Icons.arrow_forward,color: Colors.teal,size: 30.0,),
                       ),
                       onTap: (){
                             Provider.of<Backend>(context,listen: false).fetchMovie(_title);
                       },
                     ),
                   ),
                 )
               ],
             ),
           ),
          Expanded(
            flex: 9,
            child: ((movie=Provider.of<Backend>(context).movieinfo)==null? MovieNotFound(): DisplayPage(movie)),
          )
        ],
      ),
    );
  }
}
