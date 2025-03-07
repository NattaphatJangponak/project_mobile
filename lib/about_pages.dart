import 'package:flutter/material.dart';
import 'Master_data.dart';
import 'home.dart';
import 'register.dart';
import 'device.dart';
import 'farm_type.dart';
import 'grow.dart';

class AboutPages extends StatelessWidget {
  const AboutPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            debugPrint("Leading clicked");
          },
          icon: const Icon(Icons.ev_station),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint("Button pressed");
            },
            icon: const Icon(Icons.add_alert),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/display_page');
                debugPrint("ElevatedButton in AppBar pressed");
              },
              child: const Text('Display!'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Info",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              // Center(
              //   child: Image.network(
              //     "https://cdn.grange.co.uk/assets/new-cars/lamborghini/revuelto/revuelto-1_20241107093150469.png",
              //     height: 150,
              //   ),
              // ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text('home'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Master_data');
                },
                child: const Text('MushroomTypeScreen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text('Register'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/device');
                },
                child: const Text('device'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/farm_type');
                },
                child: const Text('farmtype'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/grow');
                },
                child: const Text('grow_type'),
              ),
              // IconButton(
              //     icon: Icon(Icons.display_settings),
              //     onPressed: () {
              //       Navigator.pushNamed(
              //         context,
              //         '/display_page',
              //       );
              //     })
            ],
          ),
        ),
      ),
    );
  }
}
