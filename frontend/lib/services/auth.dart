import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import '/main.dart';
import 'package:justice_bridge/models/user.dart';
class AuthService{

  final FirebaseAuth _auth =FirebaseAuth.instance;

  Users? _userFromFirebaseUser(User? user){
    if(user != null)
      {
        return Users(uid:user.uid);
      }
    else{
      return null;
    }
    // return user != null ? Users(uid:user.uid) : null;
  }

  //auth change user stream
  Stream<Users?> get user {
    return _auth.authStateChanges()
        // .map((User? user) => _userFromFirebaseUser(user!));
    .map(_userFromFirebaseUser);
  }


  Future signInAnon() async{
    try{
      UserCredential result=await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  Future<Users?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user != null ? Users(uid: user.uid) : null;
    } catch (e) {
      //print(e.toString());
      return null;
      }
    }

  Future<Users?> registerWithEmailPassword(String email, String password, String firstName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      if (user != null) {
        //await _auth.setCustomUserClaims(user.uid, {'firstName': firstName});
        return Users(uid: user.uid);
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }}
