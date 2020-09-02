
import 'package:flutter/material.dart';
import 'package:flutter_ecom/models/cart.dart';
import 'package:flutter_ecom/screens/pdt_detail_screen.dart';
import 'package:flutter_ecom/widgets/home_body.dart';
import 'package:provider/provider.dart';
import '../models/products.dart';

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {





 CartItem _cartItem=CartItem();

  @override
  Widget build(BuildContext context) {
    final productData=Provider.of<Products>(context);
    final pdts=productData.items;
    return Flexible(
          child: GridView.builder(
        //physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: pdts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (ctx, i)=>ChangeNotifierProvider.value(value: pdts[i],
        child: GestureDetector(
      onTap:()=>Navigator.of(context)
            .pushNamed(DetailPage.routeName, arguments: pdts[i].id),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridTile(
          child: Image.network(pdts[i].imgUrl),
          footer: GridTileBar(
            title: Text(pdts[i].name),
            trailing: IconButton( 
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                      print(pdts[i].name);
                        _cartItem.name = pdts[i].name;
                        print(_cartItem.name);
                        _cartItem.price = pdts[i].price;
                        _cartItem.quantity = 1;
                     

                    dataBaseHelper.insertCartItem(_cartItem);


                  Scaffold.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Item Added to Cart'),
                  ));
                  
                }),
            backgroundColor: Colors.black87,
          ),
        ),
      ),
    )
      ),
          ));
  }
}