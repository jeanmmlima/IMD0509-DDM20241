import 'package:f06_eshop/components/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../model/product_list.dart';

class ProductGrid extends StatelessWidget {
  final bool _showOnlyFavoritos;
  ProductGrid(this._showOnlyFavoritos);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    /* final List<Product> loadedProducts =
        _showOnlyFavoritos ? provider.favoriteItems : provider.items; */

    late Future<List<Product>> _products = provider.fetchProducts();

    return FutureBuilder<List<Product>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Exibe um indicador de progresso enquanto os produtos estão sendo carregados
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else {
            // Se os produtos foram carregados com sucesso, você pode acessá-los aqui
            List<Product> products = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: products.length,
              //# ProductItem vai receber a partir do Provider
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                //create: (ctx) => Product(),
                value: products[i],
                //child: ProductItem(product: loadedProducts[i]),
                child: ProductItem(),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //2 produtos por linha
                childAspectRatio: 3 / 2, //diemnsao de cada elemento
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            );
          }
        });
  }
}
