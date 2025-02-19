import 'package:chatapp/create_account.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usernameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          key: formKey,
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
            // ---------- USERNAME FIELD --------------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: usernameTextController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: Text(userName),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                // -------- VALIDATOR FOR USERNAME --------
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter an username";
                  }
                },
              ),
            ),
            // -------- PASSWORD FIELD -------------------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordTextController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                  ),
                  suffixIcon: Icon(Icons.visibility),
                  label: Text(password),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                // -------- VALIDATOR FOR PASSWORD --------
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a password";
                  }
                },
              ),
            ),
            // ---------- FORGET PASSWORD -------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: Text(forgetPassword)),
              ],
            ),
            // ---------- LOGIN BUTTON ------------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(login),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            // -------------- FOR NEW USER -------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => createAccount()));
                    },
                    child: Text(CreateAccount))
              ],
            )
          ],
        ),
      ),
    );
  }
}
