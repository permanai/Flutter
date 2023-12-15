import 'package:flutter/material.dart';
import 'package:prak1_/hal_1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:prak1_/hal_2.dart';
import 'package:prak1_/hal_3.dart';

class Hal_4 extends StatefulWidget {
  final List<String> listOfImageUrls;
  const Hal_4({Key? key, required this.listOfImageUrls}) : super(key: key);

  @override
  State<Hal_4> createState() => _Hal_4State();
}

class _Hal_4State extends State<Hal_4> {
  late Future<Map<String, String>> _preferences;

  @override
  void initState() {
    super.initState();
    _preferences = getPreferences();
  }

  Future<void> clearPreferences(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('nama');
    await prefs.remove('nbi');
    await prefs.remove('alamat');
    await prefs.remove('email');
    await prefs.remove('ig');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Hal_1()),
    );
  }

  Future<Map<String, String>> getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nama = prefs.getString('nama') ?? '';
    String nbi = prefs.getString('nbi') ?? '';
    String email = prefs.getString('email') ?? '';
    String alamat = prefs.getString('alamat') ?? '';
    String ig = prefs.getString('ig') ?? '';

    return {
      'nama': nama,
      'nbi': nbi,
      'alamat': alamat,
      'email': email,
      'ig': ig
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<Map<String, String>>(
        future: _preferences,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'PROFILE',
                        style: TextStyle(
                            fontSize: 47,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 6),
                      ClipOval(
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTghOYDp4eWqUCedRB7MSKO-taFk-3ZY9azkA&usqp=CAU',
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70),
                  Row(
                    children: [
                      Icon(Icons.tag, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        snapshot.data!['nbi'] ?? '',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.sentiment_satisfied_rounded,
                          color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        snapshot.data!['nama'] ?? '',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.place_rounded, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        snapshot.data!['alamat'] ?? '',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.mail_rounded, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        snapshot.data!['email'] ?? '',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.photo_camera_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        snapshot.data!['ig'] ?? '',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => clearPreferences(context),
                    child: Text('Keluar', style: TextStyle(fontSize: 23)),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 45),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Hal_2()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.movie, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Hal_3(
                      imageUrls: widget.listOfImageUrls,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle_rounded, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
