import 'package:dio_supabase/utl/api_call.dart';
import 'package:flutter/material.dart';
import 'package:dio_supabase/model/product.dart';

class OneProductPage extends StatefulWidget {
  const OneProductPage({super.key});

  @override
  State<OneProductPage> createState() => _OneProductPageState();
}

class _OneProductPageState extends State<OneProductPage> {
  TextEditingController idController = TextEditingController();
  MyProduct? product;

  Future<void> getProductById() async {
    String id = idController.text;
    MyProduct? product = await getProduct(id: id);

    setState(() {
      this.product = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One Product Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: 'Product ID',
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: getProductById,
              child: const Text('Get Product'),
            ),
            product != null
                ? Row(
                    children: [
                      Text('Name: ${product!.name}'),
                      const SizedBox(width: 16.0),
                      Text('Quantity: ${product!.quantity}'),
                    ],
                  )
                : Text("There is no product with id ${idController.text}")
          ],
        ),
      ),
    );
  }
}
