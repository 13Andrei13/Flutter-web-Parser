import 'dart:convert';
import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xis/classes/petshop_class.dart';
import 'package:xml/xml.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proiect etapa a doua',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'XIS - Proiect etapa a doua'),
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
  String text1 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(
                50,
                10,
                25,
                0,
              ),
              child: Row(
                children: <Widget>[
                  MaterialButton(
                    onPressed: () async {
                      final FilePickerResult? result = await FilePicker.platform.pickFiles(
                        allowMultiple: false,
                        type: FileType.any,
                      );
                      if (result == null) {
                        print('null');
                        return;
                      }
                      List<int> byteList = <int>[];
                      for (int i = 0; i < result.files.first.bytes!.length; i++) {
                        byteList.add(result.files.first.bytes![i]);
                      }
                      String str = String.fromCharCodes(byteList);
                      Map<String, dynamic> json = jsonDecode(str);
                      Petshop petshop = Petshop.fromJson(json);
                      print(petshop);
                      // final file = File(result.files.)
                      // final file = File(result.files.first.path.toString() as List<Object>);
                      // final String fileContent = await file.readAsString();
                      // setState(() {
                      //   text1 = fileContent;
                      // });
                      //
                      // print(text1);
                    },
                    color: Colors.blue,
                    child: const Text(
                      'Upload json',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                    flex: 5,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      final FilePickerResult? result = await FilePicker.platform.pickFiles(
                        allowMultiple: false,
                        type: FileType.any,
                      );
                      if (result == null) {
                        return;
                      }
                      List<int> byteList = <int>[];
                      for (int i = 0; i < result.files.first.bytes!.length; i++) {
                        byteList.add(result.files.first.bytes![i]);
                      }
                      String str = String.fromCharCodes(byteList);
                      Petshop petshop = PetshopfromXML(str);
                    },
                    color: Colors.blue,
                    child: const Text(
                      'Upload xml',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                    flex: 5,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.blue,
                    child: const Text(
                      'Upload json',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(text1),
          ],
        ),
      ),
    );
  }
}
