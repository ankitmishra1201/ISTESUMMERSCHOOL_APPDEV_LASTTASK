

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'authentication_service.dart';
import 'insta_home.dart';
import 'signin.dart';
import 'package:provider/provider.dart';

// void main() => runApp(new MyApp());

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
      Provider<AuthenticationService>(
      create: (_) => AuthenticationService(FirebaseAuth.instance),
      ),
          StreamProvider(
              create: (context) => context.read<AuthenticationService>().authStateChanges,
              initialData: null),
     ],
     child:MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          buttonColor: Colors.black,
          primaryIconTheme: IconThemeData(color: Colors.black),
          primaryTextTheme: TextTheme(
              bodyText1: TextStyle(color: Colors.black, fontFamily: "Aveny")),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))),
      home: AuthenticationWrapper(),
    )
    );
  }
}


class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser=context.watch<User>();

    if(firebaseUser != null){
      return InstaHome();
    }
    return SignInPage();
  }
}
