import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'constants.dart';

class createAccount extends StatefulWidget {
  const createAccount({super.key});

  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              appTitle,
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
              ),
            ),
            // ------- TEXTFIELD PERSON -----------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: Text(userName),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                // ------- VALIDATOR FOR USERNAME ---------------
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please pick an username";
                  }
                  return null;
                },
              ),
            ),
            // ---------- EMAIL ------------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: Text(email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                // ---------  EMAIL VALIDATOR ------------
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter an email address";
                  } else if (!RegExp(
                          r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$')
                      .hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                },
              ),
            ),
            // -------- PASSWORD ------------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.lock, color: Theme.of(context).primaryColor),
                  label: Text(password),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                //   ---------- PASSWORD VALIDATOR -----------------
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a password";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  }
                },
              ),
            ),
            // ----------- CREATE ACCOUNT BUTTON TO SUBMIT -----------
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate())
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (builder) => homePage()));
                  },
                  child: Text(CreateAccount),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  )),
            ),
            // --------- BUTTON TO LOGIN PAGE -----------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => loginPage()));
                  },
                  child: Text(login),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
