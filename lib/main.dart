import 'package:flutter/material.dart';
import 'package:mini_project_01_trainees/screens/choice.dart';
import 'package:mini_project_01_trainees/screens/main_container.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'classes/Operation.dart';

late List<Operation> operations;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'operations.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE operations(text TEXT PRIMARY KEY, value TEXT)',
      );
    },
    version: 1,
  );

  Future<void> insertOperation(Operation operation) async {
    final db = await database;

    await db.insert(
      'operations',
      operation.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  await insertOperation(Operation("Opposite", "opposite"));
  await insertOperation(Operation("Absolute Value", "absolute_value"));
  await insertOperation(Operation("Square", "square"));

  Future<List<Operation>> getAllOperations() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('operations');

    return List.generate(maps.length, (i) {
      return Operation(
        maps[i]['text'],
        maps[i]['value'],
      );
    });
  }

  operations = await getAllOperations();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainContainer(ChoiceScreen(operations)),
    );
  }
}
