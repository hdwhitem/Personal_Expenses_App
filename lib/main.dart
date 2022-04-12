import '/widgets/user_book.dart';
import 'package:flutter/material.dart';

void main() => runApp(BooksOverviewScreen());

// ignore: use_key_in_widget_constructors
class BooksOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
        body: SingleChildScrollView(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: const Card(
                    color: Colors.blue,
                    elevation: 5,
                    child: Text('Chart'),
                  ),
                ),
                UserBook(),
              ]),
        ),
      ),
    );
  }
}
