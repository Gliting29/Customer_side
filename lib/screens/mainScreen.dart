import 'package:flutter/material.dart';
import 'package:flutter_ecom/screens/homepage.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

   List<String> names = ["Shop 1", "Shop 2", "Shop 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      
        title: Text(
          "Shops In Your Locality",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 20.0,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.5),
              child: Card(
                color: Colors.white30,
                child: ListTile(
                  leading: Image.asset(
                    "images/download.jpg",
                    height: double.infinity,
                  ),
                  title: Text(
                    names[index],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text("Address"),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ),
            );
          }),
    );
  }
}