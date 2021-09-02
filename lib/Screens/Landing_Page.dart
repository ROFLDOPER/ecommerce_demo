// ignore: unused_import
import 'package:ecommerce_demo/Screens/Home_Page.dart';
// ignore: unused_import
import 'package:ecommerce_demo/Screens/Login_Page.dart';
// ignore: unused_import
import 'package:ecommerce_demo/Screens/Main_Page.dart';
// ignore: unused_import
import 'package:ecommerce_demo/Utilites/Url_lancher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import '../Constants/Constants.dart';
// ignore: unused_import
import 'Tab_bar.dart';
// ignore: unused_import
import 'card.dart';

class LandingPage extends StatelessWidget {
  // const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(
            child: Text(
              snapshot.toString(),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          //for checking authentication of the user
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamSnapshot) {
                if (streamSnapshot.hasError) {
                  return Scaffold(
                    body: Container(
                      child: Text(
                        "Error ${streamSnapshot.toString()}",
                      ),
                    ),
                  );
                }
                //if connection state active do the user login check
                if (streamSnapshot.connectionState == ConnectionState.active) {
                  //get user

                }

                //checking the authentication state
                return MainPage();
              });
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(child: CircularProgressIndicator());
      },
    );
  }
}
