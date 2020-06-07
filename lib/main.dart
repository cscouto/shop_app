import 'package:flutter/material.dart';
import 'package:shop_app/widget/product_detail_page.dart';
import './pages/products_overview_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.purpleAccent,
      ),
      home: ProductOverviewPage(),
      routes: {
        ProductDetailPage.routeName: (ctx) => ProductDetailPage() 
      },
    );
  }
}