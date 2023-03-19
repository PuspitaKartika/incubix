import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

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
  bool _isTextInput = true; //ini untuk switch
  String? selectedOption;  //ini untuk radio

  bool option1 = false; //ini untuk checkbox
  bool option2 = false;//ini untuk checkbox

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
            //text field
            Container(
              margin: EdgeInsets.all(30),
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.green
                )
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "masukan e-mail",hintStyle: TextStyle(
                    color: Colors.grey),

                ),
              ),
            ),

            //switch
            Container(
              margin: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contoh switch"),
                  Row(
                    children: [
                      Switch(
                        value: _isTextInput, // nilai boolean dari switch
                        onChanged: (value) {
                          setState(() {
                            _isTextInput = value;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      _isTextInput
                          ? Text("member")
                          : Text("nonmember"

                      ),
                    ],
                  ),
                ],
              ),
            ),

            //Radio
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contoh Radio"),
                  ListTile(
                    title: const Text('Option 1'),
                    leading: Radio(
                      value: 'option1',
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Option 2'),
                    leading: Radio(
                      value: 'option2',
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            //CheckBox
            Column(
              children: <Widget>[
                CheckboxListTile(
                  title: const Text('Option 1'),
                  value: option1,
                  onChanged: (value) {
                    setState(() {
                      option1 = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Option 2'),
                  value: option2,
                  onChanged: (value) {
                    setState(() {
                      option2 = value!;
                    });
                  },
                ),

              ],
            ),


          ],
        ),

      )

    );
  }
}




