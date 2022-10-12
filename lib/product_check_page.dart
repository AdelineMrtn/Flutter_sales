import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../product_model.dart';

class ProductCheckPage extends StatelessWidget {
  const ProductCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<http.Response>(
            future : http.get(Uri.parse("https://fakestoreapi.com/products/")),
            builder:(_,snapshot){
              if(snapshot.hasData && snapshot.data !=null){
                String body = snapshot.data!.body;
                final List<dynamic> lsProductsJSON= (jsonDecode(body) as List);
                List<Product> lsProducts = List.empty(growable: true);
                for (var mapProduct in lsProductsJSON) {
                  lsProducts.add(Product.fromJson(mapProduct));
                }
                return
                  ListView.builder(
                      itemCount: lsProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell (
                          onTap: () => context.go('/list/detail', extra: lsProducts[index]),
                          child: ListTile(
                            title: Text(lsProducts[index].nom),
                            subtitle: Text("${lsProducts[index].prix} €",
                                style: Theme.of(context).textTheme.titleLarge),
                            leading: Hero(
                              tag: lsProducts[index].id,
                              child: Image.network(
                                  lsProducts[index].image, width: 80, height: 80),
                            ),
                          ),
                        );
                      });
              }
              return const CircularProgressIndicator();
            }
        ),
      ),
    );
  }
}