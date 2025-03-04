import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Device(),
    );
  }
}

class Device extends StatelessWidget {
  final List<Map<String, String>> mushrooms = [
    {'id': 'M001', 'name': 'Shiitake'},
    {'id': 'M002', 'name': 'Oyster Mushroom'},
    {'id': 'M003', 'name': 'Portobello'},
    {'id': 'M004', 'name': 'Button Mushroom'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Row(
          children: [
            Icon(Icons.menu, color: Colors.white),
            SizedBox(width: 10),
            Text('App Mushroom IOT', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mushroom Type',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.2,
                ),
                itemCount: mushrooms.length,
                itemBuilder: (context, index) {
                  return MushroomCard(mushroom: mushrooms[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.amber,
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}

class MushroomCard extends StatelessWidget {
  final Map<String, String> mushroom;

  MushroomCard({required this.mushroom});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: Card(
        elevation: 3,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    mushroom['id'] ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(mushroom['name'] ?? ''),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.cut, color: Colors.green),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
