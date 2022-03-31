import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scopetik/firebase_options.dart';

import 'features/login/presentation/login.dart';

void main() {
  WidgetsBinding.instance;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('error'),
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const Login(),
            );
          }

          return const MaterialApp(
            home: Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
                value: 8.0,
              )),
            ),
          );
        });
  }
}

