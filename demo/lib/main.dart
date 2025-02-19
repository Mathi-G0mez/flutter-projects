import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';
import 'create_account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthCheck(), // Set the auth check as the home widget
    );
  }
}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check if the user is logged in
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return StreamBuilder<User?>(
      stream: _auth
          .authStateChanges(), // Listens for changes in user authentication
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child:
                  CircularProgressIndicator()); // Show loading while checking auth state
        }
        if (snapshot.hasData) {
          return homePage(); // User is logged in, navigate to home
        } else {
          return CreateAccount(); // No user, show create account page
        }
      },
    );
  }
}
