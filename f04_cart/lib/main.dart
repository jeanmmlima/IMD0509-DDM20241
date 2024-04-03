import 'dart:io';



import 'package:f04_cart/utils/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart.store.dart';
import 'models/catalog.dart';
import 'views/cart_screen.dart';
import 'views/catalog_screen.dart';
import 'views/login.dart';

void main() {
  runApp(const MyApp());
}

final CatalogModel _catalog = CatalogModel();
final CartModelX cartModelX = CartModelX(_catalog);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => CartModelX(_catalog),
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const MyLogin(),
          '/catalog': (context) => const MyCatalog(),
          '/cart': (context) => const MyCart(),
        },
      ),
    );
  }
}
