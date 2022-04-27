import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'widgets/chart.dart';

import 'widgets/book_list.dart';
import 'widgets/new_book.dart';
import 'package:flutter/material.dart';

import 'models/book.dart';

void main() {
  /*WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);*/
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
          // ignore: deprecated_member_use
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                  button: const TextStyle(
                color: Colors.white,
              ))),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
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
  bool _showChart = false;
  final List<Book> _userBooks = [
    Book(
      id: 'p1',
      title: 'Beginning Flutter',
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
    return _userBooks.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
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
          return SizedBox(
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

  List<Widget> _buildLandscapeContent(AppBar appBar, Widget txListWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Show Chart',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Switch.adaptive(
            // ignore: deprecated_member_use
            activeColor: Theme.of(context).accentColor,
            value: _showChart,
            onChanged: (val) {
              setState(() {
                _showChart = val;
              });
            },
          ),
        ],
      ),
      if (_showChart)
        Container(
          height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  -MediaQuery.of(context).padding.top) *
              0.5,
          child: Chart(recentTransactions: _recentTransactions),
        ),
      if (!_showChart) txListWidget
    ];
  }

  List<Widget> _buildPortraitContent(AppBar appBar, Widget txListWidget) {
    return [
      Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                -MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom) *
            0.2,
        child: Chart(recentTransactions: _recentTransactions),
      ),
      txListWidget
    ];
  }

  Widget _buildAppBar() {
    if (Platform.isIOS) {
      return CupertinoNavigationBar(
        middle: const Text('Personal Expenses'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              child: const Icon(CupertinoIcons.add),
              onTap: () => _startAddNewBook(context),
            )
          ],
        ),
      );
    } else {
      return AppBar(
        title: const Text('Flutter App'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startAddNewBook(context),
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    // ignore: prefer_typing_uninitialized_variables
    final appBar = _buildAppBar() as PreferredSizeWidget;

    final txListWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              -mediaQuery.padding.top -
              mediaQuery.padding.bottom) *
          0.7,
      child: BookList(
        books: _userBooks,
        deleteTx: _deleteTransaction,
      ),
    );

    final pageBody = SafeArea(
        child: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              ..._buildLandscapeContent(appBar as AppBar, txListWidget),
            if (!isLandscape)
              ..._buildPortraitContent(appBar as AppBar, txListWidget),
          ]),
    ));

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar as ObstructingPreferredSizeWidget,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () => _startAddNewBook(context),
                  ),
          );
  }
}
