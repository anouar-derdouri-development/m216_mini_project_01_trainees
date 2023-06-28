import 'dart:math';

import 'package:flutter/material.dart';

class CalculationScreen extends StatelessWidget {
  late int _number;
  late String? _operation;
  late String _message;

  CalculationScreen(int number, String? operation) {
    int? result;

    _number = number;
    _operation = operation;

    if (_operation == "opposite")
      result = -_number;
    else if (_operation == "absolute_value")
      result = _number.abs();
    else if (_operation == "square")
      result = pow(_number, 2) as int?;
    else {
      _message = "The operation \"$_operation\" isn't supported!!!";
      return;
    }

    _message = "The $_operation of $_number is $result";
  }

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onTap: () {
    //     Navigator.of(context).pop();
    //   },
    //   child: Icon(
    //     Icons.arrow_back,
    //   ),
    // );

    return Container(
      margin: EdgeInsets.all(80.0),
      padding: EdgeInsets.all(20.0),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Go Back"),
          ),
          const Image(image: AssetImage('assets/calculator.png')),
          const Spacer(),
          Text(
            _message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
