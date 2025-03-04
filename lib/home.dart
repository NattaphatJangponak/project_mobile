import 'package:flutter/material.dart';

void main() {
  runApp(const MushroomIOTApp());
}

class MushroomIOTApp extends StatelessWidget {
  const MushroomIOTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  final List<Map<String, dynamic>> weatherData = [
    {"day": "Day 1", "humidity": "33%", "temp": "32 / 22", "icon": Icons.wb_sunny},
    {"day": "Day 2", "humidity": "33%", "temp": "33 / 22", "icon": Icons.wb_cloudy},
    {"day": "Day 3", "humidity": "33%", "temp": "34 / 22", "icon": Icons.thunderstorm},
    {"day": "Day 2", "humidity": "33%", "temp": "32 / 22", "icon": Icons.cloud},
    {"day": "Day 2", "humidity": "33%", "temp": "37 / 22", "icon": Icons.wb_sunny},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Row(
          children: [
            Image.asset('assets/mushroom_icon.png', height: 30),
            const SizedBox(width: 8),
            const Text('App Mushroom IOT'),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: weatherData.length,
          itemBuilder: (context, index) {
            final item = weatherData[index];
            return WeatherCard(
              day: item["day"],
              humidity: item["humidity"],
              temperature: item["temp"],
              icon: item["icon"],
            );
          },
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String day;
  final String humidity;
  final String temperature;
  final IconData icon;

  const WeatherCard({
    super.key,
    required this.day,
    required this.humidity,
    required this.temperature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("Humidity: $humidity"),
                Text(
                  "$temperature °C",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Icon(icon, size: 50, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
