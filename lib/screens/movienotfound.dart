import 'package:flutter/material.dart';

class MovieNotFound  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("OOPS! MOVIE NOT FOUND",style: TextStyle(fontSize: 30.0),),
    );
  }
}
