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

  void _submitData() {
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

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now());
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
            onSubmitted: (_) => _submitData,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Price'),
            controller: priceController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextButton(
                child: Text('Choose Date'),
                style: TextButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
                onPressed: _presentDatePicker,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                child: Text('Add Book'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Theme.of(context).textTheme.button!.color,
                ),
                onPressed: () {
                  _submitData();
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
