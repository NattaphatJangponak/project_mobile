import 'package:flutter/material.dart';
import 'package:mobile_project/about_pages.dart';
import 'package:mobile_project/Master_data.dart';
import 'package:mobile_project/home.dart';
import 'package:mobile_project/register.dart';
import 'package:mobile_project/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:
             const AppBarTheme(color: Color(0xFF616161)),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF616161)),
        useMaterial3: true,
      ),
      initialRoute: "/",
      // routes: {
      //   '/': (context) => WelcomePage2(),
      //   '/welcome_page2': (context) => WelcomePage2(),
      // },

      routes: {
        '/about_pages': (context) => AboutPages(),
        '/home': (context) => WeatherScreen(),
        '/Master_data': (context) => MushroomTypeScreen(),
        '/register': (context) => RegisterScreen(),
        // '/display_page': (context) => DisplayPage(
        //       name: '',
        //     ),
      },
      home: const AboutPages(),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: const Center(
        child: Text(
          'This is the About Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
