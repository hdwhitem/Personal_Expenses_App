import 'widgets/chart.dart';

import 'widgets/book_list.dart';
import 'widgets/new_book.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                  button: const TextStyle(
                color: Colors.white,
              ))),
      debugShowCheckedModeBanner: false,
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
      date: DateTime.now(),
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/09/05/18/32/old-books-436498_960_720.jpg',
    ),
  ];

  void _addNewBook(String txTitle, double txPrice, DateTime chosenDate) {
    setState(() {
      newBk = Book(
        title: txTitle,
        price: txPrice,
        description: 'Flutter State Management',
        id: DateTime.now().toString(),
        imageUrl:
            'https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010_960_720.jpg',
        date: chosenDate,
      );
      _userBooks.add(newBk);
    });
  }

  List<Book> get _recentTransactions {
    return _userBooks.where((Tx) {
      return Tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _startAddNewBook(BuildContext ctx) {
    showModalBottomSheet(
        elevation: 2,
        backgroundColor: Colors.grey,
        context: ctx,
        builder: (BuildContext ctx) {
          return Container(
            width: 300,
            height: 550,
            child: GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewBook(
                addTx: _addNewBook,
              ),
            ),
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userBooks.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Flutter App'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => _startAddNewBook(context),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.25,
                  child: Chart(recentTransactions: _recentTransactions)),
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        -MediaQuery.of(context).padding.top) *
                    0.75,
                child: BookList(
                  books: _userBooks,
                  deleteTx: _deleteTransaction,
                ),
              ),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewBook(context),
      ),
    );
  }
}
