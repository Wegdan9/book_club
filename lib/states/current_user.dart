import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier{
  String? _userId;
  String? _userEmail;

  String get getUserId => _userId!;
  String get getUserEmail => _userEmail!;

  ///Firebase provides Library that provides properties and method to make the authentication process easy
  ///so we created an instance from that class by calling constructor and accessing a static getter
  ///which we can access it without initializing the the whole class.
  ///NOW we can access the class members after initializing an instance
  ///to help us for signIn and signUp
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password) async{
    bool retValue = false;

    try{
      UserCredential _userCredential= await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if(_userCredential.user != null){
        retValue = true;
        print('USER CREDENTIAL.USER ${_userCredential.user}');
      }
    }catch(e){
      print('error from state ${e}');
    }

    return retValue;

  }

  Future<bool> signInUser(String email, String password) async{
    bool retValue = false;

    try{
      UserCredential _userCredential= await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if(_userCredential.user != null){
        _userId = _userCredential.user?.uid;
        _userEmail = _userCredential.user?.email;
        retValue = true;
        print('USER CREDENTIAL.USER ${_userCredential.user}');
      }
    }catch(e){
      print('error from state ${e}');
    }

    return retValue;

  }


}