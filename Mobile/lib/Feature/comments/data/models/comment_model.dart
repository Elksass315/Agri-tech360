class CommentModel {
  final String comment;
  final Commenter commenter;
  final String prediction;
  final Product product;

  CommentModel({
    required this.comment,
    required this.commenter,
    required this.prediction,
    required this.product,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      comment: json['comment'],
      commenter: Commenter.fromJson(json['commenter']),
      prediction: json['prediction'],
      product: Product.fromJson(json['product']),
    );
  }
}

class Commenter {
  final int id;
  final String city;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String profilePic;

  Commenter({
    required this.id,
    required this.city,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.profilePic,
  });

  factory Commenter.fromJson(Map<String, dynamic> json) {
    return Commenter(
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
  final String image;
  final String name;
  final double price;
  final Seller seller;
  final String tags;

  Product({
    required this.id,
    required this.description,
    required this.image,
    required this.name,
    required this.price,
    required this.seller,
    required this.tags,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      description: json['description'],
      image: json['image'],
      name: json['name'],
      price: json['price'].toDouble(),
      seller: Seller.fromJson(json['seller']),
      tags: json['tags'],
    );
  }
}

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
