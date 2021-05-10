import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/signin.dart';
import 'screens/signup.dart';
//import 'screens/feeds.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

//splash screen
class MyApp extends StatelessWidget {
  //root
  @override
  Widget build(BuildContext context) {
    /// Logo with Typer Animated Text example
    ///
    Widget splash = SplashScreenView(
      //package: splash_screen_view
      home: FBinit(), //SignInPage
      duration: 3000,
      imageSize: 100,
      imageSrc: "logo.png",
      text: "FoodGook",
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
        color: Colors.white,
      ),
      backgroundColor: Color(0xffff6240),
    );


    return MaterialApp(
      title: 'FoodGook',
      home: splash,
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage()
      },
    );
  }
}

class Loading extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff6240),
    );
  }
}

class ErrorLoading extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}

class FBinit extends StatelessWidget
{
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('Init Error');
          return ErrorLoading();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print('Init Complete');
          return MyHomePage();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        print('Loading');
        return Loading();
      },
    );
  }

}

