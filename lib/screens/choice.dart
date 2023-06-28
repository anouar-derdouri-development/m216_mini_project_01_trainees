import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mini_project_01_trainees/classes/Operation.dart';
import 'package:mini_project_01_trainees/screens/calculation.dart';
import 'package:mini_project_01_trainees/screens/main_container.dart';

class ChoiceScreen extends StatefulWidget {
  late List<Operation> _operations;

  ChoiceScreen(List<Operation> operations) {
    _operations = operations;
  }

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  final List<DropdownMenuItem<String>> _items = [];
  final TextEditingController _numberController = TextEditingController();
  late List<Operation> _operations;

  late String? _operation;

  @override
  void initState() {
    super.initState();

    _operations = widget._operations;

    for (Operation op in _operations) {
      _items.add(DropdownMenuItem(
        value: op.value,
        child: Text(op.text),
      ));
    }

    _operation = _operations[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _numberController,
          decoration: const InputDecoration(
            hintText: 'Number',
          ),
        ),
        DropdownButton<String>(
          items: _items,
          onChanged: (value) {
            setState(() {
              print(value);
              _operation = value;
            });
          },
          value: _operation,
        ),
        ElevatedButton(
          onPressed: () {
            try {
              int number = int.parse(_numberController.text);

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      mainContainer(CalculationScreen(number, _operation))));
            } on Exception {
              SnackBar snackBar = const SnackBar(
                content: Row(
                  children: [
                    Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    Text(" You should enter an integer!!!"),
                  ],
                ),
                duration: Duration(seconds: 1),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calculate,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Go",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
