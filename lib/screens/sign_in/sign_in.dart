import 'package:book_club/screens/sign_in/local_widgets/sign_in_form.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: ListView(
                padding: EdgeInsets.all(20.0),
                children: [
                  Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Image.asset('assets/images/logo.png'),
                  ),
                  SizedBox(height: 20.0,),
                  SignInForm(),

                ],
              )
          )
        ],
      ),
    );
  }
}
