import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import '../../../core/constants/app_assets.dart';
import '../../../data/product_model.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_chip.dart';
import '../widgets/promo_banner.dart';
import '../widgets/product_card.dart';
import '../widgets/bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      setState(() {
        products = data.map((json) => Product.fromJson(json)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🟢 Top Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back!",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          "Falcon Thought",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SvgPicture.asset(AppAssets.bagIcon, height: 28),
                  ],
                ),

                const SizedBox(height: 20),

                // 🔎 Search
                const CustomSearchBar(),

                const SizedBox(height: 20),

                // 📢 Promo
                const PromoBanner(),

                const SizedBox(height: 20),

                // 🏷 Categories
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CategoryChip(label: "All", selected: true),
                      CategoryChip(label: "Jackets"),
                      CategoryChip(label: "Jeans"),
                      CategoryChip(label: "Shoes"),
                      CategoryChip(label: "Shirts"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🛒 Products Grid
                products.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,   // smaller column gap
                          mainAxisSpacing: 8,    // smaller row gap
                          childAspectRatio: 0.72, // taller cards (fit products better)
                        ),
                        itemBuilder: (context, index) {
                          return ProductCard(product: products[index]);
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}