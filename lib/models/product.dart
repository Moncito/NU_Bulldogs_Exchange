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
      description: 'Official NU Bulldogs Shirt',
      price: 1499.99,
      category: 'T-Shirt',
      imageUrl: 'assets/shirt1.webp',
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
      imageUrl: 'assets/hoodie1.webp',
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
      imageUrl: 'assets/cap1.webp',
      seller: 'NU Merchandise',
      rating: 4.5,
      reviewCount: 67,
      sizes: ['One Size'],
      colors: ['Navy Blue', 'Black', 'White'],
      stock: 100,
    ),
    Product(
      id: '4',
      name: 'NU Scarf V2',
      description: 'Scarf backpack for students',
      price: 399.99,
      category: 'Accessories',
      imageUrl: 'assets/scarf1.webp',
      seller: 'NU Campus Store',
      rating: 4.6,
      reviewCount: 45,
      sizes: ['Standard'],
      colors: ['Navy Blue', 'Black'],
      stock: 25,
    ),
    Product(
      id: '5',
      name: 'Limited Edition Sweat Shirt',
      description: 'Windproof Sweat Shirt with Bulldogs logo',
      price: 1999.99,
      category: 'Jackets',
      imageUrl: 'assets/s-shirt.webp',
      seller: 'NU Official Store',
      rating: 4.9,
      reviewCount: 32,
      sizes: ['M', 'L', 'XL'],
      colors: ['Navy Blue', 'Black'],
      stock: 15,
    ),
    Product(
      id: '6',
      name: 'NU Baler',
      description: 'Insulated Baller with NU logo',
      price: 299.99,
      category: 'Accessories',
      imageUrl: 'assets/baller.webp',
      seller: 'NU Merchandise',
      rating: 4.4,
      reviewCount: 56,
      sizes: ['500ml'],
      colors: ['Blue', 'White', 'Gold'],
      stock: 200,
    ),
  ];
}