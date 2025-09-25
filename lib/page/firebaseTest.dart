import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firebasetestpage extends StatefulWidget {
  const Firebasetestpage({super.key});

  @override
  State<Firebasetestpage> createState() => _FirebasetestpageState();
}

class _FirebasetestpageState extends State<Firebasetestpage> {
  var docCtl = TextEditingController();
  var nameCtl = TextEditingController();
  var messageCtl = TextEditingController();
  var db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: docCtl,
          decoration: InputDecoration(labelText: 'Document'),
        ),
        TextField(
          controller: nameCtl,
          decoration: InputDecoration(labelText: 'Name'),
        ),
        TextField(
          controller: messageCtl,
          decoration: InputDecoration(labelText: 'Message'),
        ),
        Row(
          children: [
            FilledButton(onPressed: adddata, child: Text("Add data")),
            FilledButton(onPressed: readData, child: Text("Read data")),
          ],
        ),
      ],
    );
  }

  adddata() {
    var data = {
      'name': nameCtl.text,
      'message': messageCtl.text,
      'createAt': DateTime.timestamp(),
    };
    db.collection('index').doc('room').set(data);
  }

  readData() async {
    DocumentSnapshot result = await db
        .collection('index')
        .doc(docCtl.text)
        .get();
    var data = result.data();
    log(data.toString());
  }
}
