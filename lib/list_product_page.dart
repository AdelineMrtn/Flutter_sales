import 'dart:convert';

import 'package:flu/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'product_model.dart';
import 'package:http/http.dart' as http;

class ListProductPage extends StatelessWidget {
   const ListProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text("Liste des produits"),
          actions: [
            IconButton(
              onPressed: () => context.go('/list/cart'),
              icon : const Icon(Icons.shopping_cart)
            )
          ],
      ),
      body: FutureBuilder<http.Response>(
          future : http.get(Uri.parse("https://fakestoreapi.com/products/")),
          builder:(_,snapshot){
            if(snapshot.hasData && snapshot.data !=null){
              String body = snapshot.data!.body;
              final List<dynamic> lsProductsJSON= (jsonDecode(body) as List);
              List<Product> lsProducts = List.empty(growable: true);
              for (var mapProduct in lsProductsJSON) {
                lsProducts.add(Product.fromJson(mapProduct));
              }
              return ListViewBuilder(lsProducts: lsProducts);
            }
            return const Center(child : CircularProgressIndicator());
          }
      ),
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    Key? key,
    required this.lsProducts,
  }) : super(key: key);

  final List<Product> lsProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lsProducts.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => context.go('/list/detail',extra: lsProducts[index]),
            child: ListTile(
              title: Text(lsProducts[index].nom),
              subtitle: Text("${lsProducts[index].prix} €",
                  style: Theme.of(context).textTheme.titleLarge),
              leading: Hero(
                tag: lsProducts[index].id,
                child: Image.network(lsProducts[index].image,
                    width: 80, height: 80),
              ),
              //ajout produit à la liste
              trailing: TextButton(
                onPressed: () => context.read<CartModel>().addProduct(lsProducts[index]),
                child: const Text("Add"),
              )
            ),
          );
        }
    );
  }
}
