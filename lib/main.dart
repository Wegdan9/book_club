import 'package:book_club/utlis/our_theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/sign_in/sign_in.dart';
import 'firebase_options.dart';
import 'states/current_user.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());

}

class MyApp extends StatelessWidget{

  Widget build (BuildContext context){
    return ChangeNotifierProvider(
      create: (BuildContext context) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OurTheme().buildTheme(),
        home: Scaffold(
          body: SignInScreen(),
        ),
      ),
    );
  }

}