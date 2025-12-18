import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/custom_text.dart';
import '../models/product.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              product.isFavorite 
                  ? Icons.favorite 
                  : Icons.favorite_border,
              color: product.isFavorite 
                  ? AppColors.accent 
                  : AppColors.textPrimary,
            ),
            onPressed: () {
              // TODO: Implement favorite toggle
            },
          ),
          IconButton(
            icon: const Icon(Icons.share, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image - FIXED: Use product.imageUrl
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.grey,
                image: DecorationImage(
                  image: AssetImage(product.imageUrl), // FIXED HERE
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomText.heading1(product.name),
                      ),
                      CustomText.price('₱${product.price.toStringAsFixed(2)}'),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Rating and Seller
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.secondary,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      CustomText.bodyLarge(
                        '${product.rating} (${product.reviewCount} reviews)',
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.store,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      CustomText.bodyLarge(product.seller),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // ENHANCEMENT 3: Added category and stock
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CustomText.bodyMedium(
                          product.category,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: product.stock > 10 
                              ? Colors.green.withOpacity(0.1)
                              : Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CustomText.bodyMedium(
                          product.stock > 10 ? 'In Stock' : 'Low Stock',
                          color: product.stock > 10 ? Colors.green : Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Description
                  CustomText.heading2('Description'),
                  const SizedBox(height: 8),
                  CustomText.bodyLarge(product.description),
                  
                  const SizedBox(height: 24),
                  
                  // Sizes
                  CustomText.heading2('Available Sizes'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: product.sizes.map((size) {
                      return Chip(
                        label: Text(size),
                        backgroundColor: AppColors.grey,
                      );
                    }).toList(),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Colors
                  CustomText.heading2('Available Colors'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: product.colors.map((color) {
                      return Chip(
                        label: Text(color),
                        backgroundColor: AppColors.grey,
                      );
                    }).toList(),
                  ),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.grey)),
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Add to cart
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.name} added to cart!'),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const CustomText('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Buy now
                },
                child: const CustomText('Buy Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: AppColors.textPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}