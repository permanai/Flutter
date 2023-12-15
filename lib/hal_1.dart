import 'package:flutter/material.dart';
import 'package:prak1_/loginPass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:prak1_/register.dart';
// import 'package:prak1_/hal_2.dart';

class Hal_1 extends StatelessWidget {
  Future<void> clearPreferences(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('nama');
    await prefs.remove('nbi');
    await prefs.remove('alamat');
    await prefs.remove('email');
    await prefs.remove('ig');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => register()),
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
    return FutureBuilder<Map<String, String>>(
      future: getPreferences(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else {
          return Scaffold(
            body: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Welcome to',
                      style:
                          TextStyle(fontSize: 47, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'PRAKTIKUM PAB 2023',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 10),
                  Text(
                    snapshot.data!['nbi'] ?? '',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTghOYDp4eWqUCedRB7MSKO-taFk-3ZY9azkA&usqp=CAU',
                    height: 300,
                  ),
                  SizedBox(height: 10),
                  Text(
                    snapshot.data!['nama'] ?? '',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    snapshot.data!['alamat'] ?? '',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    snapshot.data!['email'] ?? '',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    snapshot.data!['ig'] ?? '',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 120),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => loginpass(
                                    registeredPassword: '',
                                  )),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 1),
                        backgroundColor:
                            const Color.fromARGB(255, 130, 238, 134),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: Text(
                          'Masuk',
                          style: TextStyle(fontSize: 23),
                        ),
                      ),
                    ),
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
            ),
          );
        }
      },
    );
  }
}
