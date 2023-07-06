import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nineheartz_assignment/home_page.dart';

class LoginIn extends StatefulWidget {
  const LoginIn({Key? key}) : super(key: key);

  @override
  State<LoginIn> createState() => _LoginInState();
}

class _LoginInState extends State<LoginIn> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isLoggedIn = false;
  late GoogleSignInAccount _userObj;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _isLoggedIn
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(_userObj.photoUrl!),
              const SizedBox(height: 20,),
              Text(_userObj.displayName!),
              const SizedBox(height: 20,),
              Text(_userObj.email),
              const SizedBox(height: 20,),
              MaterialButton(
                onPressed: () {
                  _googleSignIn.signOut().then((value) {
                    setState(() {
                      _isLoggedIn = false;
                    });
                  }).catchError((e) {});
                },
                height: 50,
                minWidth: 100,
                color: Colors.red,
                child: const Text('Logout',style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ) : Center(
            child: MaterialButton(
              onPressed: () {
                _googleSignIn.signIn().then((userData) {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const HomePage()));
                  setState(() {
                    _isLoggedIn = true;
                    _userObj = userData!;
                  });
                }).catchError((e) {
                  print(e);
                });
              },
              height: 50,
              minWidth: 100,
              color: Colors.red,
              child: const Text('Google Signin',style: TextStyle(color: Colors.white),),
            )
        ),
      ),
    );
  }
}