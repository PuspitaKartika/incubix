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
        body: Container(
          margin: EdgeInsets.all(30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello", style: TextStyle(
                fontSize: 30
              ),),
              Text("Hi",style: TextStyle(
                  fontSize: 30
              ),),
              SizedBox(height: 30,),
              Text("spaceEvenly"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Hello", style: TextStyle(
                      fontSize: 30
                  ),),
                  Text("Hi",style: TextStyle(
                      fontSize: 30
                  ),),
                ],
              ),
              SizedBox(height: 30,),
              Text("spaceBetween"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.red,
                    child: Text("Hello", style: TextStyle(
                        fontSize: 30
                    ),),
                  ),
                  Container(
                    color: Colors.green,
                    child: Text("Hi",style: TextStyle(
                        fontSize: 30
                    ),),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text("Hello", style: TextStyle(
                      fontSize: 30
                  ),),
                  SizedBox(width: 30,),
                  Text("Hi",style: TextStyle(
                      fontSize: 30
                  ),),
                ],
              )
            ],
          ),
        ),

      )

    );
  }
}




