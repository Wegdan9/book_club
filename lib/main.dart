import 'package:book_club/utlis/our_theme.dart';
import 'package:flutter/material.dart';

import '/screens/sign_in/sign_in.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: OurTheme().buildTheme(),
      home: Scaffold(
        body: SignInScreen(),
      ),
    );
  }

}