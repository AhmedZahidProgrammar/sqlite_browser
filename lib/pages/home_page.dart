import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){

          }, child: Text("Add record")),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/read_record');
          }, child: Text("Read record")),
          ElevatedButton(onPressed: (){}, child: Text("Update record")),

        ],
      ),
    );
  }
}
