import 'package:book_club/states/current_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/our_container.dart';

class SignUpForm extends StatefulWidget {
    SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController  _fullNameController = TextEditingController();
  TextEditingController  _emailController = TextEditingController();
  TextEditingController  _passwordController = TextEditingController();
  TextEditingController  _confrimPasswordController = TextEditingController();

  void _signUpUser(String email, String password, BuildContext context) async {
        CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

        try{
        if(await _currentUser.signUpUser(email, password)){
          Navigator.pop(context);
        }
        }catch(e){
        print('error from navigator ${e}');
    }
  }

  @override
  Widget build(BuildContext context) {

    return OurContainer(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Text(
              'Sign Up',
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
          ),
          TextFormField(
            controller: _fullNameController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
              ),
              hintText: 'Full Name',
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.alternate_email,
              ),
              hintText: 'Email',
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outlined,
              ),
              hintText: 'Password',
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _confrimPasswordController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_open_outlined,
              ),
              hintText: 'Confirm Password',
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Text('Sign Up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
            ),
            onPressed: () {
                  if(_passwordController.text == _confrimPasswordController.text){
                    _signUpUser(_emailController.text, _passwordController.text, context);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Passwords dont match'),
                        duration: Duration(seconds: 2),
                      )
                    );
                  }
            },
          ),
        ],
      ),
    );
  }


}
