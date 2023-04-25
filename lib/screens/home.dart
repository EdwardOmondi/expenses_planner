import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? const Icon(
                    Icons.light_mode_outlined,
                  )
                : const Icon(
                    Icons.dark_mode_outlined,
                  ),
            onPressed: () {
              if (MediaQuery.of(context).platformBrightness ==
                  Brightness.dark) {
                MediaQuery.of(context).platformBrightness == Brightness.light;
                if (kDebugMode) {
                  print("Light");
                }
                setState(() {});
              } else {
                MediaQuery.of(context).platformBrightness == Brightness.dark;
                if (kDebugMode) {
                  print("Dark");
                }
                setState(() {});
              }
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            InputForm(),
          ],
        ),
      ),
    );
  }
}

class InputForm extends StatelessWidget {
  const InputForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: TextFormField(
                controller: dateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Date',
                ),
                onTap: () async {
                  DateTime? date = DateTime.now();
                  FocusScope.of(context).requestFocus(FocusNode());
                  date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2100));
                  dateController.text = date.toString();
                },
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Expense',
                ),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Category',
                ),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Amount',
                ),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size(100, 56),
                ),
              ),
              onPressed: () {},
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
