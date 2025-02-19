import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_page.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Method to Sign Up
  // Future<void> signUp() async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       // await _auth.createUserWithEmailAndPassword(
  //       //   email: _email.text.trim(),
  //       //   password: _password.text.trim(),
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Signup Successful!')),
  //       );
  //       // Optionally, navigate to another page
  //     } catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Signup Failed: $e')),
  //       );
  //     }
  //   }
  // }
  // Firebase sign-up function
  Future<void> signUp() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );

      if (userCredential.user != null) {
        // Navigate to HomePage on successful account creation
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => homePage()),
          (route) => false, // Remove all previous routes from the stack
        );
      }
    } on FirebaseAuthException catch (e) {
      String message = 'Error occurred. Please try again.';
      if (e.code == 'email-already-in-use') {
        message = 'The email is already in use by another account.';
      }

      // Show error message
      Fluttertoast.showToast(msg: message); // Show toast message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
              ),
              //----------- NAME FIELD -------------
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      label: Text("Name"),
                      prefixIcon: Icon(Icons.person_2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your name";
                    }
                    return null;
                  },
                ),
              ),

              //------- EMAIL FIELD------------
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      label: Text("Email"),
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your Email";
                    }
                    final emailPattern =
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                    if (!RegExp(emailPattern).hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null; // Valid email
                  },
                ),
              ),
              // -------- PASSWORD FIELD ----------
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _password,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon(Icons.visibility),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Password";
                    } else if (value.length < 8) {
                      return "Password should be 8 characters";
                    }
                    return null;
                  },
                ),
              ),
              // ---------- SUMBIT BUTTON ------------------
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) ;
                      signUp(); // Call the correct method
                    },
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white),
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              // ---------- ALRAEDY HAVE AN ACCOUNT ---------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginPage()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.blueAccent),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
