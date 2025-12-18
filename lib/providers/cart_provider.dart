import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];
  
  List<CartItem> get cartItems => _cartItems;
  
  int get itemCount {
    return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  }
  
  double get subtotal {
    return _cartItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }
  
  double get total => subtotal + 50.0; // 50 pesos shipping
  
  void addToCart(Product product, {int quantity = 1}) {
    final existingIndex = _cartItems.indexWhere((item) => item.product.id == product.id);
    
    if (existingIndex >= 0) {
      // Update quantity if already in cart
      _cartItems[existingIndex] = CartItem(
        product: product,
        quantity: _cartItems[existingIndex].quantity + quantity,
      );
    } else {
      // Add new item to cart
      _cartItems.add(CartItem(product: product, quantity: quantity));
    }
    
    notifyListeners();
  }
  
  void removeFromCart(String productId) {
    _cartItems.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }
  
  void updateQuantity(String productId, int newQuantity) {
    final index = _cartItems.indexWhere((item) => item.product.id == productId);
    
    if (index >= 0) {
      if (newQuantity > 0) {
        _cartItems[index] = CartItem(
          product: _cartItems[index].product,
          quantity: newQuantity,
        );
      } else {
        _cartItems.removeAt(index);
      }
      notifyListeners();
    }
  }
  
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

class CartItem {
  final Product product;
  int quantity;
  
  CartItem({
    required this.product,
    required this.quantity,
  });
  
  double get totalPrice => product.price * quantity;
}