import 'package:smartsoil/Feature/plantClassifiction/data/models/classfiction_model.dart';

class ProductModel {
  final int id;
  final String description;
  final List<String> images;
  final String name;
  final double price;
  final SellerModel seller;
  final String tags;

  ProductModel({
    required this.id,
    required this.description,
    required this.images,
    required this.name,
    required this.price,
    required this.seller,
    required this.tags,
  });

  factory ProductModel.fromProduct(Product product) {
    final seller = SellerModel.fromSeller(product.seller);
    final images = List<String>.from(product.images);

    return ProductModel(
      id: product.id,
      description: product.description,
      images: images,
      name: product.name,
      price: product.price,
      seller: seller,
      tags: product.tags,
    );
  }
}

// Define the Seller model
class SellerModel {
  final int id;
  final String city;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String profilePic;

  SellerModel({
    required this.id,
    required this.city,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.profilePic,
  });

  factory SellerModel.fromSeller(Seller seller) {
    return SellerModel(
      id: seller.id,
      city: seller.city,
      email: seller.email,
      fullName: seller.fullName,
      phoneNumber: seller.phoneNumber,
      profilePic: seller.profilePic,
    );
  }
}
