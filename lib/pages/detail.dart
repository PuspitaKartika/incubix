import 'package:flutter/material.dart';
import 'package:incubix/data/data.dart';

class DetailCard extends StatefulWidget {
  final index;
  const DetailCard({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  //image
                  Container(
                    height: MediaQuery.of(context).size.height *0.5,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(items[widget.index]['image'],
                    fit: BoxFit.cover),
                  ),
                  //button
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  },
                      icon: Icon(Icons.arrow_back), color: Colors.white,)
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(30),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(items[widget.index]['text'], style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                    SizedBox(height: 5,),
                    Text(items[widget.index]['address']),
                    SizedBox(height: 30,),
                    Text("Deskripsi", style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 5,),
                    Text('Wisata butterfly atau wisata kupu-kupu merupakan suatu jenis wisata yang memungkinkan pengunjung untuk melihat dan mempelajari tentang kehidupan kupu-kupu dari berbagai jenis yang berbeda. Tempat wisata ini biasanya memiliki area tertentu yang didesain khusus untuk menampung dan menjaga keberadaan kupu-kupu.')
                  ],
                ),

              ),
            )
          ],
        ),
      ),

    );
  }
}
