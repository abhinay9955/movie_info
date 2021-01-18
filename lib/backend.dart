import 'package:movie_info/models/movie.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class Backend extends ChangeNotifier{

  Movie _movie=null;
  final String BASE_USRL = "https://www.omdbapi.com/?i=tt3896198&apikey=aacaa08&t=";

  Movie get movieinfo => _movie;

  Future<void> fetchMovie(String movie_title) async{
         String url = BASE_USRL+movie_title;
         var result = await http.get(url);
         var body = json.decode(result.body);
         if(body["Response"].toString().compareTo("True")==0)
           _movie = Movie.fromJson(body);
         else
           _movie=null;
         print(_movie);
         notifyListeners();
  }


}