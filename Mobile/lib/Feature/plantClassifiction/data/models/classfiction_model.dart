class Seller {
  final int id;
  final String city;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String profilePic;

  Seller({
    required this.id,
    required this.city,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.profilePic,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      id: json['id'],
      city: json['city'],
      email: json['email'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      profilePic: json['profilePic'],
    );
  }
}

class Product {
  final int id;
  final String description;
  final List<String> images; // Modified to store list of image URLs
  final String name;
  final double price;
  final Seller seller;
  final String tags;

  Product({
    required this.id,
    required this.description,
    required this.images, // Modified parameter
    required this.name,
    required this.price,
    required this.seller,
    required this.tags,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Parse images string into a list of URLs
    List<String> parsedImages = [];
    if (json['images'] != null) {
      // Extracting the URLs from the JSON string using regular expression
      RegExp regExp = RegExp(r"'(.*?)'");
      Iterable<Match> matches = regExp.allMatches(json['images']);
      for (Match match in matches) {
        parsedImages.add(match.group(1)!);
      }
    }

    return Product(
      id: json['id'],
      description: json['description'],
      images: parsedImages, // Store parsed images
      name: json['name'],
      price: json['price'].toDouble(),
      seller: Seller.fromJson(json['seller']),
      tags: json['tags'],
    );
  }
}

class ClassfictionModel {
  final bool status;
  final String message;
  final double confidence;
  final String description;
  final String image;
  final String predictions;
  final List<List<Product>> products;

  ClassfictionModel({
    required this.description,
    required this.status,
    required this.message,
    required this.confidence,
    required this.image,
    required this.predictions,
    required this.products,
  });

  factory ClassfictionModel.fromJson(Map<String, dynamic> json) {
    return ClassfictionModel(
      description: json['data']['information'] ?? 'No description',
      status: json['status'],
      message: json['message'],
      confidence: json['data']['confidence'],
      image: json['data']['image'],
      predictions: json['data']['predictions'],
      products: List<List<Product>>.from(
        json['data']['products'].map<List<Product>>(
          (products) => List<Product>.from(
            products.map((product) => Product.fromJson(product)),
          ),
        ),
      ),
    );
  }
}
