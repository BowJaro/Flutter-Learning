import 'package:dio_supabase/utl/api_call.dart';
import 'package:flutter/material.dart';
import 'package:dio_supabase/model/product.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  Future<void> addProductHandler() async {
    String id = idController.text;
    String name = nameController.text;
    int quantity = int.parse(quantityController.text);

    MyProduct newProduct = MyProduct(id: id, name: name, quantity: quantity);

    try {
      bool isSuccessful = await addProduct(product: newProduct);
      if (isSuccessful) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added successfully')),
        );
        // Clear input fields
        idController.clear();
        nameController.clear();
        quantityController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add product')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding product: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
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
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
              ),
            ),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Product Quantity',
              ),
            ),
            ElevatedButton(
              onPressed: addProductHandler,
              child: const Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
