import 'package:flutter/material.dart';
import '../models/product.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<String> _favoriteIds = [];
  
  List<String> get favoriteIds => _favoriteIds;
  
  bool isFavorite(String productId) {
    return _favoriteIds.contains(productId);
  }
  
  void toggleFavorite(Product product) {
    if (_favoriteIds.contains(product.id)) {
      _favoriteIds.remove(product.id);
    } else {
      _favoriteIds.add(product.id);
    }
    notifyListeners();
  }
  
  List<Product> getFavoriteProducts(List<Product> allProducts) {
    return allProducts.where((product) => _favoriteIds.contains(product.id)).toList();
  }
  
  int get favoriteCount => _favoriteIds.length;
}