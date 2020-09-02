import 'package:flutter/material.dart';
import 'package:flutter_ecom/utils/database_helper.dart';
import '../widgets/all_pdts.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}
    DataBaseHelper dataBaseHelper;

class _HomeBodyState extends State<HomeBody> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      dataBaseHelper = DataBaseHelper.instance;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Center(
            child: Text(
          'Categories',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        SizedBox(
          height: 10,
        ),
       // Category(),
        Center(
            child: Text(
          'Products',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        AllProducts()
      ],
    );
  }
}
