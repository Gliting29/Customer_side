import 'package:flutter/material.dart';
import 'package:flutter_ecom/models/cart.dart';
import 'package:flutter_ecom/models/products.dart';
import 'package:flutter_ecom/widgets/home_body.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> _cartItem = List<CartItem>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState((){
      _cartItem = dataBaseHelper.fecthCartItem() as List<CartItem>;
    });
  }


  @override
  Widget build(BuildContext context) {
    final loadedPdt = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(fontSize: 30, color: Theme.of(context).accentColor),
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemBuilder: (context,index){
                return Container(
                  child: ListTile(
                    title: Text(_cartItem[index].name),
                  ),
                );
              },
              itemCount: _cartItem.length,

            ),
          ),
        ],
      ),
    );
  }
}
