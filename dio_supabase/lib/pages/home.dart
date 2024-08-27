import 'package:dio_supabase/pages/product/all_product.dart';
import 'package:dio_supabase/pages/product/one_product.dart';
import 'package:dio_supabase/pages/profile/all_profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AllProductPage();
                  }));
                },
                child: const Text("All products")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const OneProductPage();
                  }));
                },
                child: const Text("View 1 product")),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AllProfilePage();
                  }));
                },
                child: const Text("All profiles")),
          ],
        ),
      ),
    );
  }
}
