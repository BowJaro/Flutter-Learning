import 'package:dio/dio.dart';
import 'package:dio_supabase/utils/apikey.dart';
import 'package:dio_supabase/model/product.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    },
  ),
);

Future<List<MyProduct>> getAllProducts() async {
  try {
    final response = await dio.get('/Product?select=*');
    if (response.statusCode == 200) {
      // Cast the response data to a list of dynamic for flexibility
      final result = (response.data as List)
          .map((productMap) => MyProduct.fromJson(productMap))
          .toList();
      return result;
    } else {
      throw Exception('Failed to fetch products: ${response.statusCode}');
    }
  } on DioException catch (e) {
    throw Exception('Error fetching products: ${e.message}');
  }
}

Future<MyProduct?> getProduct({required String id}) async {
  try {
    final response = await dio.get(
      '/Product?id=eq.$id&select=*',
    );
    if (response.statusCode == 200) {
      // Check if data is empty (no product found)
      if (response.data.isEmpty) {
        return null; // Return null if no product found
      } else {
        // Expecting only one product since ID is unique
        final productMap = response.data[0] as Map<String, dynamic>;
        return MyProduct.fromJson(productMap);
      }
    } else {
      throw Exception('Failed to fetch product: ${response.statusCode}');
    }
  } on DioException catch (e) {
    throw Exception('Error fetching product: ${e.message}');
  }
}

Future<bool> addProduct({required MyProduct product}) async {
  try {
    final response = await dio.post(
      '/Product',
      data: product.toJson(),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to add product: ${response.statusCode}');
    }
  } on DioException catch (e) {
    throw Exception('Error adding product: ${e.message}');
  }
}

Future<bool> updateProduct({required MyProduct product}) async {
  try {
    var productJson = product.toJson();

    final response = await dio.patch(
      '/Product?id=eq.${product.id}',
      data: productJson,
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      return true;
    } else {
      throw Exception('Failed to update product: ${response.statusCode}');
    }
  } on DioException catch (e) {
    throw Exception('Error updating product: ${e.message}');
  }
}

Future<bool> deleteProduct({required String id}) async {
  try {
    final response = await dio.delete(
      '/Product?id=eq.$id',
    );
    if (response.statusCode == 200 || response.statusCode == 204) {
      return true;
    } else {
      throw Exception('Failed to delete product: ${response.statusCode}');
    }
  } on DioException catch (e) {
    throw Exception('Error deleting product: ${e.message}');
  }
}
