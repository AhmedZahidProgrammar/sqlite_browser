

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ReadRecordPage extends StatelessWidget {

  ReadRecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Read Record "),
      ),
      body: Container(
      ),
    );
  }

  readData() async {
    var db = await openDatabase('assets/database/test.db');
    print(db.runtimeType);


  }
}
