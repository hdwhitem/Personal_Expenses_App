import 'package:flutter/material.dart';
import '../models/transaction.dart';

// ignore: use_key_in_widget_constructors
class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  late final Transaction newTrans;
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'p1',
      title: 'Beginning Flutter With Dart',
      description: 'You can learn Flutter as well Dart.',
      price: 9.99,
      date: DateTime.now(),
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/09/05/18/32/old-Transactions-436498_960_720.jpg',
    ),
    Transaction(
      id: 'p2',
      title: 'Flutter State Management',
      description: 'Everything you should know about Flutter State.',
      price: 9.99,
      date: DateTime.now(),
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/09/10/17/18/Transaction-1659717_960_720.jpg',
    ),
    Transaction(
      id: 'p3',
      title: 'WordPress Coding',
      description:
          'WordPress coding is not difficult, in fact it is interesting.',
      price: 9.99,
      date: DateTime.now(),
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010_960_720.jpg',
    ),
  ];

  // ignore: unused_element
  void _addNewTransaction(String txTitle, double txPrice) {
    setState(() {
      newTrans = Transaction(
        title: txTitle,
        price: txPrice,
        description: 'Flutter State Management',
        id: '2222',
        imageUrl:
            'https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010_960_720.jpg',
        date: DateTime.now(),
      );
      _userTransactions.add(newTrans);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        // NewTransaction(addTx: _addNewTransaction),
      ],
    );
  }
}
