import 'package:flu/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailProductPage extends StatelessWidget {
  final Product product;
  const DetailProductPage(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.nom),),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: product.id,
                child: Center(
                  child: ClipOval(
                      child: Image.network(product.image, width: 80, height:80,)
                  )
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child : Text("Description",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline6
                )
              ),
              Text(product.description),
              const Divider(),
              TextButton(
                  onPressed: () => context.go('/list/detail/avis', extra: product),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child : Text("Avis",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.headline6
                          )
                      ),
                    ],
                  ),
              ),
              Text(product.description),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child : Text("Caractéristiques",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline6
                )
            ),
            Text(product.description),
            const Divider(),
          ]
        ),
      ),
    );
  }
}
