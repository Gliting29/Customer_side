import 'package:flutter/foundation.dart';

class CartItem {
  static const tblCart = 'Carttable';
  static const colid = 'id';
  static const colName = 'name';
  static const colQuan = 'quantity';
  static const colpri = 'price';

  int id;
  String name;
  int quantity;
  double price;

  CartItem({this.id, this.name, this.quantity, this.price});

  //map to object for retrieving
  CartItem.fromMap(Map<String, dynamic> map){
    id=map[colid];
    name=map[colName];
    quantity=map[colQuan];
    price=map[colpri];
  }
  
  
  
  
  //making objects into map to store them sq lite for saving 



  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'quantitiy': quantity,
      'price': price
    };
    if (id != null) map[colid] = id;
    return map;
  }
}

/*class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String pdtid, String name, double price) {
    if (_items.containsKey(pdtid)) {
      _items.update(
          pdtid,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
          pdtid,
          () => CartItem(
                name: name,
                id: DateTime.now().toString(),
                quantity: 1,
                price: price,
              ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price));
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}*/
