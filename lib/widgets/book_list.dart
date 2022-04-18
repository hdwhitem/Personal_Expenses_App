import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/book.dart';

// ignore: use_key_in_widget_constructors
class BookList extends StatelessWidget {
  final List<Book> books;

  const BookList({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: books.isEmpty
          ? Column(
              children: <Widget>[
                const Text('No Books added yet'),
                Image.asset(
                  'assets/zzz.png',
                  fit: BoxFit.cover,
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${books[index].price}'),
                        ),
                      ),
                    ),
                    title: Text(
                      books[index].title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format((books[index].date)),
                    ),
                  ),
                );
              },
              itemCount: books.length,
            ),
    );
  }
}
