import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_horizontal_product_card.dart';
import '../models/product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
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
                          // ENHANCEMENT 1: Changed to your name
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
              
              // Featured Products List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Product.sampleProducts.take(3).length,
                itemBuilder: (context, index) {
                  final product = Product.sampleProducts[index];
                  return CustomHorizontalProductCard(
                    product: product,
                    onTap: () {
                      Navigator.pushNamed(
                        context, 
                        '/detail',
                        arguments: product,
                      );
                    },
                    onFavoriteTap: () {
                      // TODO: Implement favorite toggle
                    },
                  );
                },
              ),
              
              const SizedBox(height: 24),
              
              // Categories
              CustomText.heading2('Categories'),
              const SizedBox(height: 16),
              
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConstants.categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 120,
                      margin: EdgeInsets.only(
                        right: index < AppConstants.categories.length - 1 ? 12 : 0,
                      ),
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
                      child: Center(
                        child: CustomText.heading3(
                          AppConstants.categories[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}