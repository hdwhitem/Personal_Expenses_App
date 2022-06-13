import '/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

// ignore: use_key_in_widget_constructors
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(
      {Key? key, required this.transactions, required this.deleteTx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet',
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
              return TransactionItem(
                  transaction: transactions[index], deleteTx: deleteTx);
            },
            itemCount: transactions.length,
          );
  }
}
