import 'package:flutter/material.dart';
import 'package:prak1_/hal_1.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:prak1_/splash.dart';

class register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Image.asset(
                  'img/qr.png',
                  width: 200,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: FormWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _nbiController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _igController = TextEditingController();

  Future<void> _submitForm(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String nama = _namaController.text;
      String nbi = _nbiController.text;
      String email = _emailController.text;
      String alamat = _alamatController.text;
      String ig = _igController.text;

      await prefs.setString('nama', nama);
      await prefs.setString('nbi', nbi);
      await prefs.setString('email', email);
      await prefs.setString('alamat', alamat);
      await prefs.setString('ig', ig);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Hal_1()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _namaController,
            decoration: InputDecoration(
              labelText: 'Masukkan Nama',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Form wajib diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 12.0),
          TextFormField(
            controller: _nbiController,
            decoration: InputDecoration(
              labelText: 'Masukkan NBI',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Form wajib diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 12.0),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Masukkan email',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Form wajib diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 12.0),
          TextFormField(
            controller: _alamatController,
            decoration: InputDecoration(
              labelText: 'Masukkan alamat',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Form wajib diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 12.0),
          TextFormField(
            controller: _igController,
            decoration: InputDecoration(
              labelText: 'Masukkan ig',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Form wajib diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () => _submitForm(context),
            child: Text('Daftar'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
