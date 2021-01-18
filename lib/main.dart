import 'package:flutter/material.dart';
import 'package:movie_info/screens/HomeScreen.dart';
import 'package:provider/provider.dart';

import 'backend.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.dark(),
      home: ChangeNotifierProvider<Backend>(
        create: (_)=>Backend(),
          child: HomeScreen()),
    );
  }
}
