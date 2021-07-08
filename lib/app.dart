import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_db_browser/pages/home_page.dart';
import 'package:sqlite_db_browser/pages/read_record_page.dart';

import 'config/values.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqlite Db',
      navigatorKey: Values.navigatorKey,
      initialRoute: '/',
      home: HomePage(),
      routes: {
        '/read_record':(context)=>ReadRecordPage(),
      },


    );
  }
}
