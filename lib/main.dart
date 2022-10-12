import 'package:flu/cart_model.dart';
import 'package:flu/product_check_page.dart';
import 'package:flu/review_page.dart';
import 'package:flutter/material.dart';
import 'package:flu/product_model.dart';
import 'package:provider/provider.dart';
import 'cart_page.dart';
import 'package:flu/list_product_page.dart';
import 'detail_product_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
      ChangeNotifierProvider<CartModel>(
        create: (_)=> CartModel([]),
        child: MyApp())
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
   final GoRouter _router = GoRouter(
     initialLocation: '/list',
     routes: <GoRoute>[
       GoRoute(
           path: '/list',
           builder: (_, state) => ListProductPage(),
           //builder: (_, state) => const ProductCheckPage(),
           routes : [
             GoRoute(
               path: 'detail',
               builder: (_, state) => DetailProductPage(state.extra as Product),
               routes: [
                 GoRoute(
                   path: 'avis',
                   builder: (_, state) => ReviewPage(state.extra as Product),
                 ),
               ]
             ),
             GoRoute(
               path: 'cart',
               builder: (_, state) => const CartPage(),
             ),
           ]
       ),
     ],
   );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router (
      routerConfig: _router,
      title: 'GoRouter Example',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      //home: const CartPage(),
    );
  }

}


