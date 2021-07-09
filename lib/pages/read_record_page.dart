

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_db_browser/config/screen_config.dart';
import 'package:sqlite_db_browser/models/customer_model.dart';

class ReadRecordPage extends StatelessWidget {

  ReadRecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Read Record "),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Table(
              children: [
                TableRow(
                    children: [
                      Text("Name"),
                      Text("ID"),
                    ]
                )
              ],
            ),
            FutureBuilder(
              future: readData(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  List<dynamic> list= snapshot.data as List;
                  return SizedBox(
                    width: ScreenConfig.screenWidth,
                    height: ScreenConfig.screenHeight,
                    child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context,index){
                          CustomerModel customerModel=CustomerModel.fromJson(list[index]);
                          return Table(
                            children: [
                              TableRow(
                                  children: [
                                    Text(customerModel.name),
                                    Text(customerModel.id),
                                  ]
                              )
                            ],
                          );

                        }),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<List<dynamic>> readData() async {
    // var db = await openDatabase('assets/database/test.db');
    // print(db.runtimeType);
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'asset_test.db');
    print(path);
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound){
      print("File not found");
      //ByteData data = await rootBundle.load(join('assets/database', 'test.db'));
      ByteData data = await rootBundle.load(join('assets/database/test.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Save copied asset to documents
      await new File(path).writeAsBytes(bytes);

    }
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'asset_test.db');
    var db = await openDatabase(databasePath);
    String query = '''
      SELECT * FROM Customer
      ''';
    print(await db.rawQuery(query));
    return await db.rawQuery(query);


  }
}
