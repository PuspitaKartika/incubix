import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String bulan = 'Januari';
  List<String> kalender = ['Januari', 'Februari', 'Maret'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title : "Mentoring Beginner FLutter",
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Mentoring Beginner Flutter"),
          actions: [
            Icon(Icons.search),
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(30),
              width: double.infinity,
              //elevatedbutton
              child: ElevatedButton(
                onPressed: (){},
                child: Text("tombol"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: TextButton(
                onPressed: (){},
                child: Text ("lupa password"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: OutlinedButton(
                onPressed: (){},
                child: Text ("lupa password"),
              ),
            ),
            Container(
              child: IconButton(onPressed: (){},
                  icon: Icon(Icons.point_of_sale, color: Colors.green,)),
            ),

           // drop down
            DropdownButton<String>(
              value: bulan,
              onChanged: (newValue){
                setState(() {
                  bulan = newValue!;
                });
              },
              items: kalender.map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                    child: Text(value));
              }).toList(),
               )
          ],
        ),

      )

    );
  }
}




