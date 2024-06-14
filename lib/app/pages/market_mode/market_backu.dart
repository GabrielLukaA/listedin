import 'package:flutter/material.dart';
import 'package:listedin/app/components/card/card.dart';
import 'package:listedin/app/components/header/header.dart';
import 'package:listedin/app/components/input/input.dart';
import 'package:listedin/app/components/listStats/list_stats.dart';
import 'package:listedin/app/data/model/product_list.dart';
import 'package:listedin/app/pages/list/store/list_store.dart';
import 'package:listedin/app/styles/colors.dart';
import 'package:listedin/app/styles/icons/arrow.dart';
import 'package:listedin/app/styles/texts.dart';

class ProductsBuy {
  final ProductList product;
  bool isBuy;

  ProductsBuy(this.product, this.isBuy);
}

class MarketMode extends StatefulWidget {
  final ListStore store;

  const MarketMode({super.key, required this.store});

  @override
  State<MarketMode> createState() => _MarketModeState();
}

class _MarketModeState extends State<MarketMode> {
  late List<ProductsBuy> products = [];

  @override
  void initState() {
    super.initState();
    products = widget.store.state.value!.products!
        .map((e) => ProductsBuy(e, false))
        .toList();
    // print();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: ArrowIcon(color: text, size: 24)),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Expanded(
                      child: Text(
                    "Cancelar modo mercado",
                    style: textSmMedium,
                  )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
              child: TextField(
                onChanged: (value) {
                  widget.store.searchProducts(value);
                },
                keyboardType: TextInputType.name,
                style: const TextStyle(
                  color: Color(0xFFA8A8A8),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600, // Semibold
                  fontSize: 10,
                ),
                decoration:
                    getInputDecoration('Busque por seus produtos aqui!'),
              ),
            ),
           const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Itens a comprar!",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primary),
              ),
            ),
            Expanded(
              child:
               Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final item = products[index];
                      // return Text(task.product.name);
                      if (!item.isBuy) {
                        return Dismissible(
                          // direction: DismissDirection.endToStart,
                          background: Container(
                            padding: const EdgeInsets.fromLTRB(48, 16, 48, 16),
                            color: red,
                            alignment: Alignment.centerLeft,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          secondaryBackground: Container(
                            padding: const EdgeInsets.fromLTRB(48, 16, 48, 16),
                            color: primary,
                            alignment: Alignment.centerRight,
                            child: const Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                            ),
                          ),
                          onDismissed: (direction) {
                            setState(() {
                              products[index].isBuy = true;
                            });
                          },
                          key: Key(index.toString()),
                          child: CardBuy(
                            productList: item.product,
                            product: item.product.product,
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Itens já comprados!",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primary),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final item = products[index];
                      // return Text(task.product.name);
                      if (item.isBuy) {
                        return Dismissible(
                          // direction: DismissDirection.endToStart,
                          background: Container(
                            padding: const EdgeInsets.fromLTRB(48, 16, 48, 16),
                            color: red,
                            alignment: Alignment.centerLeft,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          secondaryBackground: Container(
                            padding: const EdgeInsets.fromLTRB(48, 16, 48, 16),
                            color: primary,
                            alignment: Alignment.centerRight,
                            child: const Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                            ),
                          ),
                          onDismissed: (direction) {
                            setState(() {
                              products[index].isBuy = false;
                            });
                          },
                          key: Key(index.toString()),
                          child: CardBuy(
                            productList: item.product,
                            product: item.product.product,
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
              ),
            ),
            const ListStats(price: "0,00", quantity: " 4"),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}