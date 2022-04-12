import '/widgets/book_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'new_book.dart';
import '../models/book.dart';

// ignore: use_key_in_widget_constructors
class UserBook extends StatefulWidget {
  @override
  State<UserBook> createState() => _UserBookState();
}

class _UserBookState extends State<UserBook> {
  late Book newBk;
  final List<Book> _userBooks = [
    Book(
      id: 'p1',
      title: 'Beginning Flutter With Dart',
      description: 'You can learn Flutter as well Dart.',
      price: 9.99,
      date: DateFormat.yMMMEd().format(
        DateTime.now(),
      ),
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/09/05/18/32/old-books-436498_960_720.jpg',
    ),
    Book(
      id: 'p2',
      title: 'Flutter State Management',
      description: 'Everything you should know about Flutter State.',
      price: 9.99,
      date: DateFormat.yMMMEd().format(
        DateTime.now(),
      ),
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/09/10/17/18/book-1659717_960_720.jpg',
    ),
    Book(
      id: 'p3',
      title: 'WordPress Coding',
      description:
          'WordPress coding is not difficult, in fact it is interesting.',
      price: 9.99,
      date: DateFormat.yMMMEd().format(
        DateTime.now(),
      ),
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010_960_720.jpg',
    ),
  ];

  void _addNewBook(String txTitle, double txPrice) {
    setState(() {
      newBk = Book(
        title: txTitle,
        price: txPrice,
        description: 'Flutter State Management',
        id: '2222',
        imageUrl:
            'https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010_960_720.jpg',
        date: DateFormat.yMMMEd().format(DateTime.now()).toString(),
      );
      _userBooks.add(newBk);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewBook(addTx: _addNewBook),
        BookList(books: _userBooks)
      ],
    );
  }
}
