import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String first = '';
  String last = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'First',
            ),
            onChanged: (text) {
              first = text;
            },
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Last',
            ),
            onChanged: (text) {
              last = text;
            },
          ),
          ElevatedButton(
            onPressed: () async {
              await _addToFirebase();
              Navigator.pop(context);
            },
            child: Text('追加する'),
          ),
        ]),
      ),
    );
  }

  Future _addToFirebase() async {
    final db = FirebaseFirestore.instance;

    final user = <String, dynamic>{
      "first": first,
      "last": last,
      "born": 1991,
    };

    await db.collection("users").add(user);
  }
}
