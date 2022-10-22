import 'package:flutter/material.dart';
import 'package:mystoreapp/Component/add.dart';
import 'package:mystoreapp/Component/delete.dart';
import 'package:mystoreapp/Component/read.dart';
import 'package:mystoreapp/Component/update.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xffe46b10),
            bottom: TabBar(tabs: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              IconButton(onPressed: () {}, icon: Icon(Icons.update)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              IconButton(onPressed: () {}, icon: Icon(Icons.read_more))
            ])),
        body: TabBarView(
          children: [
            Add_Com(),
            Update_Com(),
            Delete_Com(),
            Read_Com(),
          ],
        ),
      ),
    );
  }
}
