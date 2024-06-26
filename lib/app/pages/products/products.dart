import 'package:flutter/material.dart';
import 'package:listedin/app/components/card/card.dart';
import 'package:listedin/app/components/header/header.dart';
import 'package:listedin/app/components/input/input.dart';
import 'package:listedin/app/data/http/http_client.dart';
import 'package:listedin/app/data/model/user.dart';
import 'package:listedin/app/data/repositories/product_repository.dart';
import 'package:listedin/app/pages/products/store/products_store.dart';
import 'package:listedin/app/styles/colors.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, required this.user});
  final User user;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late ProductsStore store;

  @override
  void initState() {
    super.initState();
    store = ProductsStore(
      user: widget.user,
      repository: ProductRepository(HttpClient()),
    );
    store.getProducts();
    // print();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: Text(
              "Suas Listas!",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      store.searchProducts(value);
                    },
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                      color: Color(0xFFA8A8A8),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600, // Semibold
                      fontSize: 10,
                    ),
                    decoration: getInputDecoration('Busque aqui!'),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation:
                  Listenable.merge([store.isLoading, store.state, store.error]),
              builder: (context, child) {
                if (store.isLoading.value) {
                  return const CircularProgressIndicator();
                }

                if (store.state.value.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: ListView.builder(
                      itemCount: store.state.value.length,
                      itemBuilder: (context, index) {
                        final item = store.state.value[index];
                        return Column(
                          children: [
                            CardBuy(
                              isList: false,
                              product: item,
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
