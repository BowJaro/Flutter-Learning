import 'package:dio_supabase/pages/product/product_detail_page.dart';
import 'package:dio_supabase/utils/product_api.dart';
import 'package:flutter/material.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  List<dynamic> productList = [];

  @override
  void initState() {
    super.initState();
    getAllProducts().then((value) {
      productList = value;
      productList.sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Product Page'),
      ),
      body: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            var product = productList[index];
            return Dismissible(
              key: Key(product.id),
              background: buildSlide(),
              secondaryBackground: buildSlide(),
              direction: DismissDirection.endToStart,
              confirmDismiss: (direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Delete'),
                      content: const Text(
                          'Are you sure you want to delete this item?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
              onDismissed: (direction) {
                deleteProduct(id: product.id).then((value) {
                  if (value) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete Successfully'),
                        content: const Text(
                            'You have deleted the item successfully.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                    setState(() {
                      productList.removeAt(index);
                    });
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Deletion Failed'),
                        content: const Text(
                            'An error occurred while deleting the item.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                });
              },
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ProductDetailPage(product: product);
                        }));
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.id,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              product.name,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              product.quantity.toString(),
                            )
                          ]),
                    ),
                  ),
                  const Divider(
                    height: 0,
                  )
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductDetailPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Container buildSlide() {
    return Container(
      color: Colors.red,
      child: const Padding(
        padding: EdgeInsets.only(top: 1, right: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
