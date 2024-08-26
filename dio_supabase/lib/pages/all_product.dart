import 'package:dio_supabase/utl/api_call.dart';
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
    getAllProduct().then((value) {
      setState(() {
        productList = value;
      });
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
                // setState(() {
                //   productList.removeAt(index);
                // });
              },
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
                  const Divider()
                ],
              ),
            );
          }),
    );
  }

  Container buildSlide() {
    return Container(
      color: Colors.red,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
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
