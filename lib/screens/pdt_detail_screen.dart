import 'package:flutter/material.dart';
import 'package:flutter_ecom/models/cart.dart';
import 'package:flutter_ecom/utils/database_helper.dart';
import '../models/products.dart';
import 'package:provider/provider.dart';
//import '../models/cart.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/product_detail_screen';

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  DataBaseHelper _dbHelper;
  CartItem _cartpdt = CartItem();
  List<CartItem> cartlist = [];


  @override
  void initState(){
    super.initState();
    setState(() {
      _dbHelper= DataBaseHelper.instance;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedPdt = Provider.of<Products>(context).findById(productId);
    //final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedPdt.name),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network(loadedPdt.imgUrl),
            ),
          ),
          Text(
            'Price: \$${loadedPdt.price}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              '${loadedPdt.description}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: Icon(
          Icons.shopping_cart,
          size: 30,
        ),
      ),
    );
  }
}
