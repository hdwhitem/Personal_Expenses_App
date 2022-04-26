import '/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import '../models/book.dart';

// ignore: use_key_in_widget_constructors
class BookList extends StatelessWidget {
  final List<Book> books;
  final Function deleteTx;

  const BookList({Key? key, required this.books, required this.deleteTx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return books.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No Books added yet',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
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
              return TransactionItem(book: books[index], deleteTx: deleteTx);
            },
            itemCount: books.length,
          );
  }
}
