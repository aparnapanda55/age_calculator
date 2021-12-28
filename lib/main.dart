import 'package:flutter/material.dart';
import 'calculator.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

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
  DateTime? dataSelected = DateTime.now();

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
            ElevatedButton(
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Your birthday is on '),
                  MyText(DateFormat.yMMMMEEEEd().format(dataSelected!)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ResultPane(
                items: formatDuration(
                  DateTime.now().difference(dataSelected!),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText(this.value, {Key? key}) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: value)).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).primaryColor,
              content: const Text('Copied to clipboard!'),
              duration: const Duration(seconds: 1),
            ),
          );
        });
      },
      child: Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ResultPane extends StatelessWidget {
  const ResultPane({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('You are '),
                  MyText(item),
                  const Text(' old.'),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
