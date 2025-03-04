import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GrowType(),
    );
  }
}

class GrowType extends StatelessWidget {
  final List<Map<String, String>> mushrooms = [
    {'id': 'M001', 'name': 'Shiitake'},
    {'id': 'M002', 'name': 'Oyster Mushroom'},
    {'id': 'M003', 'name': 'Portobello'},
    {'id': 'M004', 'name': 'Button Mushroom'},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 400, // เพิ่มความสูงเพื่อให้พอดีกับ 2x2 cards
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columns
                    crossAxisSpacing: 10, // ระยะห่างระหว่างคอลัมน์
                    mainAxisSpacing: 10, // ระยะห่างระหว่างแถว
                    childAspectRatio: 0.8, // สัดส่วนของ width ต่อ height
                  ),
                  itemCount: mushrooms.length,
                  itemBuilder: (context, index) {
                    var mushroom = mushrooms[index];
                    return Card(
                      color: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 8,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/realmush.png', height: 80), // รูปภาพ
                            SizedBox(height: 10),
                            Text(mushroom['name'] ?? '', style: TextStyle(color: Colors.white, fontSize: 16)), // ชื่อเห็ด
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey[800],
//         title: Row(
//           children: [
//             Icon(Icons.menu, color: Colors.white),
//             SizedBox(width: 10),
//             Text('App Mushroom IOT', style: TextStyle(color: Colors.white)),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Mushroom Type',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search...',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 2.2,
//                 ),
//                 itemCount: mushrooms.length,
//                 itemBuilder: (context, index) {
//                   return MushroomCard(mushroom: mushrooms[index]);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         backgroundColor: Colors.amber,
//         child: Icon(Icons.add, color: Colors.black),
//       ),
//     );
//   }
// }

class MushroomCard extends StatelessWidget {
  final Map<String, String> mushroom;

  MushroomCard({required this.mushroom});
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/realmush.png',
                height: 40, width: 40), // รูปภาพ
            SizedBox(height: 8), // ให้ระยะห่างระหว่างรูปภาพและข้อความ
            Text(
              mushroom['id'] ?? '',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              mushroom['name'] ?? '',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8), // ให้ระยะห่างระหว่างข้อความและปุ่ม
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
