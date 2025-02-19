import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < 10; i++) box(),
            Text(
              "Top News",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 10; i++) smallBox(),
                ],
              ),
            ),
            for (int i = 0; i < 10; i++) box(),
          ],
        ),
      )),
    );
  }
}

Widget box() {
  return Container(
    height: 200,
    width: double.infinity,
    color: Colors.blueAccent,
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.all(10.0),
  );
}

Widget smallBox() {
  return Container(
    height: 150,
    width: 200,
    color: Colors.red,
    margin: EdgeInsets.all(10.0),
    padding: EdgeInsets.all(10.0),
  );
}
