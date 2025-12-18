import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../models/product.dart';
import '../widgets/custom_text.dart';
import '../providers/favorite_provider.dart';
import '../providers/cart_provider.dart';

class CustomHorizontalProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  
  const CustomHorizontalProductCard({
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
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.grey,
                image: DecorationImage(
                  image: AssetImage(product.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            const SizedBox(width: 12),
            
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomText.heading3(
                          product.name,
                          maxLines: 2,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          favoriteProvider.toggleFavorite(product);
                        },
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? AppColors.accent : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 4),
                  
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.secondary,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      CustomText.bodyMedium(
                        '${product.rating} (${product.reviewCount} reviews)',
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 4),
                  
                  CustomText.bodyMedium(
                    'Seller: ${product.seller}',
                    color: AppColors.textSecondary,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.price('₱${product.price.toStringAsFixed(2)}'),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
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
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Add to cart button
// Replace the current Add to Cart button with:
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
    icon: const Icon(Icons.shopping_cart, size: 16),
    label: const Text('Add to Cart'),
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.secondary,
      padding: const EdgeInsets.symmetric(vertical: 8),
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