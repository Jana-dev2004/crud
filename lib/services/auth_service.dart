
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService
{
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  Future<User?> Register(String email,String password,context) async
  {
    try{
    UserCredential userCredential=await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
    }on FirebaseAuthException catch(e)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString()),backgroundColor: Colors.red,));
    }
    catch(e)
    {
      print(e);
    }
    return null;
  }
   Future<User?> login(String email,String password,BuildContext context) async
  {
    try{
    UserCredential userCredential=await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
    }on FirebaseAuthException catch(e)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString()),backgroundColor: Colors.red,));
    }
    return null;
  }
}