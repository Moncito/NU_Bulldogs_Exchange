import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_horizontal_product_card.dart';
import '../widgets/custom_vertical_product_card.dart';
import '../models/product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final featuredProducts = Product.sampleProducts.take(3).toList();
    final recommendedProducts = Product.sampleProducts.skip(3).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: CustomText.heading2(AppConstants.appName),
        backgroundColor: AppColors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.textPrimary),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: AppColors.textPrimary),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.secondary,
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.heading3(
                            'Welcome, ${AppConstants.yourName}!',
                            color: AppColors.white,
                          ),
                          const SizedBox(height: 4),
                          CustomText.bodyMedium(
                            AppConstants.appDescription,
                            color: AppColors.white.withOpacity(0.8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Featured Products
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText.heading2('Featured Products'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/shop');
                    },
                    child: const Text('See All'),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: featuredProducts.length,
                itemBuilder: (context, index) {
                  final product = featuredProducts[index];
                  return CustomHorizontalProductCard(
                    product: product,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: product,
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 24),

              // Recommended Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText.heading2('Recommended For You'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/shop');
                    },
                    child: const Text('See All'),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // ✅ FIXED HEIGHT
SizedBox(
  height: 300, // ✅ safe height
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: recommendedProducts.length,
    itemBuilder: (context, index) {
      final product = recommendedProducts[index];
      return Padding(
        padding: EdgeInsets.only(
          right: index < recommendedProducts.length - 1 ? 12 : 0,
        ),
        child: SizedBox(
          width: 160,
          child: CustomVerticalProductCard(
            product: product,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: product,
              );
            },
          ),
        ),
      );
    },
  ),
),


              const SizedBox(height: 24),

              // Popular Categories
              CustomText.heading2('Popular Categories'),
              const SizedBox(height: 12),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: AppConstants.categories.map((category) {
                  return ChoiceChip(
                    label: Text(category),
                    selected: false,
                    onSelected: (_) {
                      Navigator.pushNamed(context, '/shop');
                    },
                    selectedColor: AppColors.secondary,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
