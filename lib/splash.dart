import 'package:flutter/material.dart';
// import 'package:prak1_/pass.dart';
import 'dart:async';

import 'package:prak1_/register.dart';

// import 'package:prak1_/register.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => register()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(200, 112, 3, 3),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height / 2 - 75,
              child: Image.asset(
                'img/amerika.png',
                width: 150,
                height: 150,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2 + 80,
              child: Text(
                'Praktikum PAB 2023',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2 - 550,
              child: Image.asset(
                'img/dunia.png',
                width: 500,
                height: 500,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2 + 50,
              child: Transform.rotate(
                angle: 3.14,
                child: Image.asset(
                  'img/dunia.png',
                  width: 500,
                  height: 500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
