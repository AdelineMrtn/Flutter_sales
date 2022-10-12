import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Panier Flutter Sales"),),
      body: Column(
        children: [
          Text("votre panier contient ${context.watch<CartModel>().lsProducts.length} éléments"),
          const Text("Votre pannier total est de :"),
          Consumer<CartModel>(
            builder: (_,cart,__) => Expanded(
                child: ListView.builder(
                  itemCount: cart.lsProducts.length,
                  itemBuilder: (_,index,) =>
                      ListTile(
                        leading: Image.network(cart.lsProducts[index].image, width: 60, height: 60,),
                        title: Text(cart.lsProducts[index].nom),
                        trailing: IconButton(
                          onPressed: () => context.read<CartModel>().removeOneProduct(cart.lsProducts[index]),
                          icon:  const Icon(Icons.delete)
                        )
                      ),
                ),
              )
          ),
          TextButton(
            onPressed: () => context.read<CartModel>().removeProducts(),
            child: const Text("Remove"),
          )
        ],
      ),
    );
  }
}