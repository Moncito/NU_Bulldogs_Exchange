class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  final String seller;
  final double rating;
  final int reviewCount;
  bool isFavorite;
  final List<String> sizes;
  final List<String> colors;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.seller,
    required this.rating,
    required this.reviewCount,
    this.isFavorite = false,
    required this.sizes,
    required this.colors,
    required this.stock,
  });

  // Sample data for testing
  static List<Product> sampleProducts = [
    Product(
      id: '1',
      name: 'NU Bulldogs Jersey 2024',
      description: 'Official NU Bulldogs basketball jersey with player number option',
      price: 1499.99,
      category: 'Jerseys',
      imageUrl: 'assets/jersey1.jpg',
      seller: 'NU Official Store',
      rating: 4.8,
      reviewCount: 124,
      sizes: ['S', 'M', 'L', 'XL'],
      colors: ['Navy Blue', 'White', 'Gold'],
      stock: 50,
    ),
    Product(
      id: '2',
      name: 'NU Hoodie Premium',
      description: 'Comfortable hoodie with NU Bulldogs embroidery',
      price: 1299.99,
      category: 'Hoodies',
      imageUrl: 'assets/hoodie1.jpg',
      seller: 'NU Official Store',
      rating: 4.7,
      reviewCount: 89,
      sizes: ['S', 'M', 'L', 'XL', 'XXL'],
      colors: ['Navy Blue', 'Black', 'Gray'],
      stock: 35,
    ),
    Product(
      id: '3',
      name: 'Bulldogs Snapback Cap',
      description: 'Adjustable snapback cap with embroidered logo',
      price: 499.99,
      category: 'Caps',
      imageUrl: 'assets/cap1.jpg',
      seller: 'NU Merchandise',
      rating: 4.5,
      reviewCount: 67,
      sizes: ['One Size'],
      colors: ['Navy Blue', 'Black', 'White'],
      stock: 100,
    ),
    Product(
      id: '4',
      name: 'NU Backpack',
      description: 'Water-resistant backpack for students',
      price: 899.99,
      category: 'Accessories',
      imageUrl: 'assets/backpack.jpg',
      seller: 'NU Campus Store',
      rating: 4.6,
      reviewCount: 45,
      sizes: ['Standard'],
      colors: ['Navy Blue', 'Black'],
      stock: 25,
    ),
    Product(
      id: '5',
      name: 'Limited Edition Jacket',
      description: 'Windproof jacket with Bulldogs logo',
      price: 1999.99,
      category: 'Jackets',
      imageUrl: 'assets/jacket.jpg',
      seller: 'NU Official Store',
      rating: 4.9,
      reviewCount: 32,
      sizes: ['M', 'L', 'XL'],
      colors: ['Navy Blue', 'Black'],
      stock: 15,
    ),
    Product(
      id: '6',
      name: 'NU Tumbler',
      description: 'Insulated tumbler with NU logo',
      price: 299.99,
      category: 'Accessories',
      imageUrl: 'assets/tumbler.jpg',
      seller: 'NU Merchandise',
      rating: 4.4,
      reviewCount: 56,
      sizes: ['500ml'],
      colors: ['Blue', 'White', 'Gold'],
      stock: 200,
    ),
  ];
}