import 'package:book_club/screens/home/home.dart';
import 'package:book_club/screens/sign_up/sign_up.dart';
import 'package:book_club/states/current_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/our_container.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _loginUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    
    try{
      if(await _currentUser.signInUser(email, password)){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(),));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Incorrect email'),
                duration: Duration(seconds: 2),
            ));
      }
    }catch(e){
      print(e);
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
              'Sign In',
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
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
                Icons.lock_open_outlined,
              ),
              hintText: 'Password',
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Text('Sign In', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
            ),
            onPressed: () {
                _loginUser(_emailController.text, _passwordController.text, context);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account !'),
              TextButton(
                  child: Text('Sign Up'),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen(),));
                  },)
            ],
          )
        ],
      ),
    );
  }


}
