import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  String city = "London";
  double temperature = 0.0;
  String description = "Fetching...";
  String iconCode = "01d";

  final String apiKey =
      "32dad33d232034168ffa2d044ef96b93"; // Replace with your OpenWeatherMap API key

  Future<void> fetchWeather(String cityName) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          temperature = data['main']['temp'];
          description = data['weather'][0]['description'];
          iconCode = data['weather'][0]['icon'];
        });
      } else {
        setState(() {
          temperature;
          description = "City not found!";
        });
      }
    } catch (error) {
      setState(() {
        temperature = 0;
        description = "Failed to fetch weather!";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) {
                city = value;
                fetchWeather(city);
              },
              decoration: InputDecoration(
                labelText: "Enter city name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "$city",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "${temperature.toStringAsFixed(1)}°C",
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            Image.network(
              "https://openweathermap.org/img/wn/$iconCode@2x.png",
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
