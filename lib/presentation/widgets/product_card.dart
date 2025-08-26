import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_assets.dart';
import '../../../data/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                product.image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // Rectangle + Heart Icon (Top Right)
            Positioned(
              top: 8,
              right: 8,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.rectangle94,
                    height: 32,
                  ),
                  SvgPicture.asset(
                    AppAssets.heartIcon,
                    height: 16,
                  ),
                ],
              ),
            ),

            // Bag Icon Curve (Bottom Center Overlapping)
            Positioned(
              bottom: -5, // slight overlap inside image
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.group1167,
                      height: 50,
                    ),
                    SvgPicture.asset(
                      AppAssets.bagIcon,
                      height: 18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 30), // account for curve bag space

        // Title
        Text(
          product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center, // 🔥 centered
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),

        const SizedBox(height: 4),

        // Price
        Text(
          "\$${product.price.toStringAsFixed(2)}",
          textAlign: TextAlign.center, // 🔥 centered
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
