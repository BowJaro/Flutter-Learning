import 'package:dio/dio.dart';
import 'package:dio_supabase/apikey.dart';
import 'package:dio_supabase/model/product.dart';

Future<List<MyProduct>> getAllProduct() async {
  Dio dio = Dio();
  // Set base URL and headers
  dio.options = BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
    },
  );
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
  Dio dio = Dio();
  // Set base URL and headers
  dio.options = BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
    },
  );

  try {
    final response = await dio.get(
      '/Product?id=eq.$id&select=*', // Use id=eq.$id syntax for filtering
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
  Dio dio = Dio();
  // Set base URL and headers
  dio.options = BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal', // Optional: Request minimal data on insert
    },
  );

  try {
    var productJson = product.toJson();
    print("This is productJson $productJson");
    final response = await dio.post(
      '/Product',
      data: productJson, // Convert product to a JSON map
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
