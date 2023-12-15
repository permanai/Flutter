import 'package:flutter/material.dart';
import 'package:prak1_/hal_3.dart';
import 'package:prak1_/hal_4.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Hal_2(),
    );
  }
}

class Hal_2 extends StatelessWidget {
  final List<String> listOfImageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9bDliN9fYFNPTrZngkI3ZnEsjU1yyOck_Uw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_7bygejK-jsCwVBRLdhNVDzR57p_CC32sQQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbRqKquszQj-UuPxAMQOJgQt4t_Cd3r9rF5w&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ4_I-1oUXMukop2nATt3HQ-9kumBSj05wmw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbna2G6_4-6i-akgORc4MqFs5FYYhj2XWVVWhOz0dn6EYG7ZH2Lwe84z1Ffi2Htr5Aneg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMLJ2h2llHorJV1WEgAi6BpA9ttes9Ie3Rbw&usqp=CAU',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              'NETFLIX',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: EdgeInsets.all(30),
              children: listOfImageUrls.map((imageUrl) {
                return _buildImageRow(context, imageUrl);
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.movie, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Hal_3(
                      imageUrls: [
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9bDliN9fYFNPTrZngkI3ZnEsjU1yyOck_Uw&usqp=CAU',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_7bygejK-jsCwVBRLdhNVDzR57p_CC32sQQ&usqp=CAU',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMLJ2h2llHorJV1WEgAi6BpA9ttes9Ie3Rbw&usqp=CAU'
                      ],
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle_rounded, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Hal_4(
                            listOfImageUrls: listOfImageUrls,
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageRow(BuildContext context, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Hal_3(imageUrls: listOfImageUrls),
          ),
        );
      },
      child: Container(
        height: 200,
        width: 200,
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
