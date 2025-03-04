import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FarmType(),
    );
  }
}

class FarmType extends StatelessWidget {
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
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(4, (index) => GaugeWidget(value: 31)),
              ),
            ),
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

class GaugeWidget extends StatelessWidget {
  final double value;

  GaugeWidget({required this.value});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 100,
          axisLabelStyle: GaugeTextStyle(color: Colors.black, fontSize: 12),
          pointers: [NeedlePointer(value: value)],
          annotations: [
            GaugeAnnotation(
              widget: Text('$value%',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              angle: 90,
              positionFactor: 0.5,
            )
          ],
        ),
      ],
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(mushroom['id'] ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(mushroom['name'] ?? ''),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
