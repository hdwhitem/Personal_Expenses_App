import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/book.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.book,
    required this.deleteTx,
  }) : super(key: key);

  final Book book;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
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
              child: Text('\$${book.price}'),
            ),
          ),
        ),
        title: Text(
          book.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format((book.date)),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                label: const Text('Delete'),
                icon: const Icon(Icons.delete),
                style: TextButton.styleFrom(
                  primary: Theme.of(context).errorColor,
                ),
                onPressed: () => deleteTx(book.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(book.id),
              ),
      ),
    );
  }
}
