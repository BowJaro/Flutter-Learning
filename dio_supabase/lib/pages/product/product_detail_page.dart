import 'package:flutter/material.dart';
import 'package:dio_supabase/utils/product_api.dart';
import 'package:dio_supabase/model/product.dart';

class ProductDetailPage extends StatefulWidget {
  final MyProduct? product;

  const ProductDetailPage({this.product, super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      // If a product is provided, pre-fill the fields for editing
      idController.text = widget.product!.id;
      nameController.text = widget.product!.name;
      quantityController.text = widget.product!.quantity.toString();
    }
  }

  Future<void> saveProductHandler() async {
    String id = idController.text;
    String name = nameController.text;
    int quantity = int.parse(quantityController.text);

    if (widget.product != null) {
      // Update product if it exists
      MyProduct updatedProduct = MyProduct(
        id: widget.product!.id,
        name: name,
        quantity: quantity,
      );
      await _updateProduct(updatedProduct);
    } else {
      // Add new product if no product is passed
      MyProduct newProduct = MyProduct(id: id, name: name, quantity: quantity);
      await _addProduct(newProduct);
    }
  }

  Future<void> _updateProduct(MyProduct product) async {
    try {
      bool isSuccessful = await updateProduct(product: product);
      if (!mounted) return; // Check if the widget is still mounted
      if (isSuccessful) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product updated successfully')),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update product')),
        );
      }
    } catch (e) {
      if (!mounted) return; // Check if the widget is still mounted
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating product: $e')),
      );
    }
  }

  Future<void> _addProduct(MyProduct product) async {
    try {
      bool isSuccessful = await addProduct(product: product);
      if (!mounted) return;
      if (isSuccessful) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added successfully')),
        );
        idController.clear();
        nameController.clear();
        quantityController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add product')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding product: $e')),
      );
    }
  }

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEditing = widget.product != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Update Product' : 'Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: 'Product ID',
                fillColor: isEditing ? Colors.grey[300] : null,
                filled: isEditing,
              ),
              readOnly: isEditing,
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
              onPressed: saveProductHandler,
              child: Text(isEditing ? 'Update Product' : 'Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
