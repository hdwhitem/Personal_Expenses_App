import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class NewBook extends StatelessWidget {
  final Function addTx;

  final titleController = TextEditingController();
  final priceController = TextEditingController();

  NewBook({Key? key, required this.addTx}) : super(key: key);

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
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Price'),
            controller: priceController,
          ),
          TextButton(
            child: const Text('Add Book'),
            style: TextButton.styleFrom(primary: Colors.blue),
            // ignore: avoid_print
            onPressed: () {
              addTx(titleController.text, double.parse(priceController.text));
              // ignore: avoid_print
              print('${titleController.text} y ${priceController.text}');
            },
          ),
        ]),
      ),
    );
  }
}
