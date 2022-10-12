import 'package:flu/product_model.dart';
import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier{
  final List<Product> lsProducts;
  CartModel(this.lsProducts);

  addProduct(Product product){
    lsProducts.add(product);
    //notifier les observateurs
    notifyListeners();
  }
  removeProducts(){
    lsProducts.clear();
    notifyListeners();
  }

  removeOneProduct(Product product){
    lsProducts.remove(product);
    notifyListeners();
  }

  totalPrice() {
    num total = 0;
    for (Product mapProduct in lsProducts) {
      total += mapProduct.prix;
      notifyListeners();
    }
    return total;
  }
}