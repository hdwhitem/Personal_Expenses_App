import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: use_key_in_widget_constructors
class NewBook extends StatefulWidget {
  final Function addTx;

  NewBook({Key? key, required this.addTx}) : super(key: key);

  @override
  State<NewBook> createState() => _NewBookState();
}

class _NewBookState extends State<NewBook> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  DateTime _selectDate = DateTime.now();

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredPrice = _priceController.text;

    if (enteredTitle.isEmpty || enteredPrice.isEmpty) {
      return;
    } else if (double.parse(enteredPrice) <= 0) {
      return;
    }

    widget.addTx(enteredTitle, double.parse(enteredPrice), _selectDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickDate) {
      if (pickDate == null) {
        return;
      }
      setState(() {
        _selectDate = pickDate;
      });
    });
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
            controller: _titleController,
            onSubmitted: (_) => _submitData,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Price'),
            controller: _priceController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData,
          ),
          Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Picked Date: ${DateFormat.yMEd().format(_selectDate)}',
                  ),
                ),
                TextButton(
                  child: Text('Choose Date'),
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  onPressed: _presentDatePicker,
                ),
              ],
            ),
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
