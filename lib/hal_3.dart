import 'package:flutter/material.dart';
import 'package:prak1_/api/apiController.dart';
import 'package:prak1_/hal_2.dart';
import 'package:prak1_/hal_4.dart';

class Hal_3 extends StatefulWidget {
  final List<String> imageUrls;

  const Hal_3({Key? key, required this.imageUrls}) : super(key: key);

  @override
  _Hal3State createState() => _Hal3State();
}

class _Hal3State extends State<Hal_3> {
  Future<List<dynamic>>? _data;

  @override
  void initState() {
    _data = apiController().getdatas() as Future<List<dynamic>>?;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<List<dynamic>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final datas = snapshot.data!;

            return ListView.builder(
              itemCount: datas.length,
              itemBuilder: (BuildContext context, int index) {
                final imageUrl =
                    'https://saiyaapi.site/${snapshot.data![index]['photo']}';
                final title = snapshot.data![index]['desc'];

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        imageUrl,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 20),
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
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
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_circle_rounded, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Hal_4(
                      listOfImageUrls: widget.imageUrls,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
