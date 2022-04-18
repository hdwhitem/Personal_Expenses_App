import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class NewBook extends StatefulWidget {
  final Function addTx;

  NewBook({Key? key, required this.addTx}) : super(key: key);

  @override
  State<NewBook> createState() => _NewBookState();
}

class _NewBookState extends State<NewBook> {
  final titleController = TextEditingController();

  final priceController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredPrice = priceController.text;

    if (enteredTitle.isEmpty || enteredPrice.isEmpty) {
      return;
    } else if (double.parse(enteredPrice) <= 0) {
      return;
    }

    widget.addTx(enteredTitle, double.parse(enteredPrice));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: titleController,
            onSubmitted: (_) => submitData,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Price'),
            controller: priceController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text('Add Book'),
                style: TextButton.styleFrom(
                  primary: Colors.purple,
                ),
                onPressed: () {
                  submitData();
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
