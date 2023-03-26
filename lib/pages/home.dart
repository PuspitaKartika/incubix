import 'package:flutter/material.dart';
import 'package:incubix/data/data.dart';
import 'package:incubix/pages/detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffF1F1F1)
          ),
          child: Center(
            child: TextField(
              onChanged: (value){},
              decoration: InputDecoration.collapsed(hintText: 'search'),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
          itemBuilder: (BuildContext context, int index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailCard(index: index)));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0,3)
                )
              ]
            ),
            child: Column(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage(items[index]['image']),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10))
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(items[index]['text'], style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Alamat"),
                          Text(items[index]['address'])
                        ],
                      )
                    ],
                  ),

                )

              ],
            ),

          ),
        );
      }),
    );
  }
}
