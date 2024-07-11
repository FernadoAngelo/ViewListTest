import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String?> OptionSave = List.empty(growable: true);
  List<TextEditingController?> OptionControler = List.empty(growable: true);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<String> list = ['One', 'Two', 'Three', 'Four'];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                OptionSave.add(list.first);
                OptionControler.add(TextEditingController());
              });
            },
          )
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('teste'),
          Expanded(
            child: ListView.builder(
              itemCount: OptionSave.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            OptionSave.removeAt(index);
                            OptionControler.removeAt(index);
                          });

                        },
                      ),
                      DropdownButton<String>(
                        value: OptionSave[index],
                        onChanged: (String? value) {
                          setState(() {
                            OptionSave[index] = value;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      Expanded(
                        child: TextField(
                          controller: OptionControler[index],
                            decoration: const InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
