import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/book.dart';

// ignore: use_key_in_widget_constructors
class BookList extends StatelessWidget {
  final List<Book> books;
  final Function deleteTx;

  BookList({Key? key, required this.books, required this.deleteTx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return books.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                const Text(
                  'No Books added yet',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.4,
                  child: Image.asset(
                    'assets/zzz.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
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
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTx(books[index].id),
                  ),
                ),
              );
            },
            itemCount: books.length,
          );
  }
}
