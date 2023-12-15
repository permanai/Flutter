import 'package:flutter/material.dart';
import 'package:prak1_/api/apiController.dart';
import 'package:prak1_/hal_2.dart';
// import 'package:prak1_/register.dart';

class loginpass extends StatefulWidget {
  const loginpass({Key? key, required String registeredPassword})
      : super(key: key);

  @override
  State<loginpass> createState() => _loginpassState();
}

class _loginpassState extends State<loginpass> {
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter Your PIN',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Please enter your pin that you have created',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              child: Icon(
                Icons.lock_outline_rounded,
                size: 50,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '               Password',
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      width: 0.2,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                if (_passwordController.text == '2001') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Hal_2(),
                    ),
                  );

                  apiController()
                      .getdatas()
                      .then((datas) {})
                      .catchError((error) {});
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Password salah'),
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.lock_open_rounded,
              ),
              label: Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
