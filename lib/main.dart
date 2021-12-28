import 'package:flutter/material.dart';
import 'calculator.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? dataSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () async {
                final d = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                setState(() {
                  dataSelected = d;
                });
              },
              child: const Text('Choose your birthday'),
            ),
            if (dataSelected != null) ...[
              const SizedBox(
                height: 20,
              ),
              Text(
                  'Your birthday is on ${DateFormat.yMMMMEEEEd().format(dataSelected!)}'),
              const SizedBox(
                height: 20,
              ),
              Text(
                  'You are ${formatDuration(DateTime.now().difference(dataSelected!))} old.'),
            ]
          ],
        ),
      ),
    );
  }
}
