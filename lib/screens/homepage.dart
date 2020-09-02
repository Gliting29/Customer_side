import 'package:flutter/material.dart';
import 'package:flutter_ecom/widgets/home_body.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Flutter E-com'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, size: 30,), onPressed: (){}),
        ],
      ),
      body: HomeBody()
    );
  }
}