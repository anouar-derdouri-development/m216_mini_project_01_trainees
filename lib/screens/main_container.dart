import 'package:flutter/material.dart';

Scaffold mainContainer(Widget content) {
  return Scaffold(
    backgroundColor: Colors.blue.shade50,
    appBar: AppBar(
      title: const Text("Mini-Project-01"),
    ),
    body: Padding(padding: const EdgeInsets.all(8.0), child: content),
  );
}
