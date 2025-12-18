import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_vertical_product_card.dart';
import '../models/product.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);
  
  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String selectedCategory = 'All';
  
  @override
  Widget build(BuildContext context) {
    final filteredProducts = selectedCategory == 'All'
        ? Product.sampleProducts
        : Product.sampleProducts
            .where((product) => product.category == selectedCategory)
            .toList();
    
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: CustomText.heading2('Shop'),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Category Filter
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: AppConstants.categories.length,
              itemBuilder: (context, index) {
                final category = AppConstants.categories[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: selectedCategory == category,
                    selectedColor: AppColors.primary,
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Products Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return CustomVerticalProductCard(
                    product: product,
                    onTap: () {
                      Navigator.pushNamed(
                        context, 
                        '/detail',
                        arguments: product,
                      );
                    },
                    // REMOVED: onFavoriteTap parameter
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}