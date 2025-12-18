import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../models/product.dart';
import '../providers/favorite_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/custom_text.dart';

class CustomVerticalProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const CustomVerticalProductCard({
    Key? key,
    required this.product,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final isFavorite = favoriteProvider.isFavorite(product.id);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE + FAVORITE BUTTON
            Stack(
              children: [
                Container(
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: AssetImage(product.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: IconButton(
                      iconSize: 18,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        favoriteProvider.toggleFavorite(product);
                      },
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isFavorite
                            ? AppColors.accent
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // PRODUCT DETAILS
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.bodyLarge(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: CustomText.bodySmall(
                          product.category,
                          color: AppColors.primary,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 14,
                            color: AppColors.secondary,
                          ),
                          const SizedBox(width: 2),
                          CustomText.bodySmall(
                            product.rating.toString(),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  CustomText.price(
                    '₱${product.price.toStringAsFixed(2)}',
                  ),

                  const SizedBox(height: 2),

                  CustomText.bodySmall(
                    'by ${product.seller}',
                    color: AppColors.textSecondary,
                  ),

                  const SizedBox(height: 8),

                  // ADD TO CART BUTTON
SizedBox(
  width: double.infinity,
  child: ElevatedButton.icon(
    onPressed: () {
      cartProvider.addToCart(product);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${product.name} added to cart!'),
          duration: const Duration(seconds: 2),
        ),
      );
    },
    icon: const Icon(Icons.shopping_cart, size: 14),
    label: const Text(
      'Add to Cart',
      style: TextStyle(fontSize: 12),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.secondary,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      minimumSize: const Size(0, 30),
    ),
  ),
),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
