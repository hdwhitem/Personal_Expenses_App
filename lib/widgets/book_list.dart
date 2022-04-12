import 'package:flutter/material.dart';
import '../models/book.dart';

// ignore: use_key_in_widget_constructors
class BookList extends StatelessWidget {
  final List<Book> books;

  const BookList({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: books.map((e) {
        return Card(
            child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2)),
              padding: const EdgeInsets.all(10),
              child: Text(
                '\$${e.price}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  e.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  e.date,
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}
