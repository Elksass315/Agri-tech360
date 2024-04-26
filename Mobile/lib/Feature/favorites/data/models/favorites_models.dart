class FavoriteModle {
  final List<FavoriteData> data;
  final String message;
  final bool status;

  FavoriteModle({
    required this.data,
    required this.message,
    required this.status,
  });

  factory FavoriteModle.fromJson(Map<String, dynamic> json) {
    List<FavoriteData> favoriteDataList = [];
    if (json['data'] != null) {
      if (json['data'] is List) {
        favoriteDataList = List<FavoriteData>.from(
          json['data'].map((item) => FavoriteData.fromJson(item['product'])),
        );
      } else {
        favoriteDataList.add(FavoriteData.fromJson(json['data']['product']));
      }
    }

    return FavoriteModle(
      data: favoriteDataList,
      message: json['message'] ?? '',
      status: json['status'] ?? false,
    );
  }
}

class FavoriteData {
  final String description;
  final int id;
  final String image;
  final List<String> images;
  final String name;
  final double price;
  final Seller seller;
  final String tags;

  FavoriteData({
    required this.description,
    required this.id,
    required this.image,
    required this.images,
    required this.name,
    required this.price,
    required this.seller,
    required this.tags,
  });

  factory FavoriteData.fromJson(Map<String, dynamic> json) {
    List<String> parsedImages = [];
    if (json['images'] != null) {
      RegExp regExp = RegExp(r"'(.*?)'");
      Iterable<Match> matches = regExp.allMatches(json['images']);
      for (Match match in matches) {
        parsedImages.add(match.group(1)!);
      }
    }
    return FavoriteData(
      description: json['description'] ?? '',
      id: json['id'],
      image: json['image'],
      images: parsedImages,
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
