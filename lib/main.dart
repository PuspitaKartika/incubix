import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        body: Row(
          children: [
            Column(
              children: [
                //BIASA
                Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  child: Text(
                    "Hiiii", style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                ),

                //circle
                Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Text(
                    "Hiiii", style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  ),
                ),

                //radius
                Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      "Hiiii", style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 5,
                      color: Colors.green
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Hiiii", style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),


              ],
            ),

            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(30,10)

                      )
                    ]
                  ),
                  child: Text(
                    "Hiiii", style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}




