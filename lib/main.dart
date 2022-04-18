import 'widgets/book_list.dart';
import 'widgets/new_book.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/book.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  void _startAddNewBook(BuildContext ctx) {
    showModalBottomSheet(
        elevation: 2,
        backgroundColor: Colors.grey,
        context: ctx,
        builder: (ctx) => Container(
            width: 300,
            height: 550,
            child: GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewBook(
                addTx: _addNewBook,
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books.me',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _startAddNewBook(context),
            )
          ],
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
                BookList(books: _userBooks),
              ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _startAddNewBook(context),
        ),
      ),
    );
  }
}
