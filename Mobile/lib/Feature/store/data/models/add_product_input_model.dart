// import 'package:image_picker/image_picker.dart';

// class AddProductInputModel {
//   final String? name;
//   final String? description;
//   final XFile image;
//   final List<XFile>? images;
//   final String? price;
//   final String? tags;
//   final String? seller;

//   AddProductInputModel({
//     required this.image,
//     required this.name,
//     required this.description,
//     required this.images,
//     required this.price,
//     required this.tags,
//     required this.seller,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['image'] = image.path;
//     data['name'] = name;
//     data['description'] = description;
//     // Assuming images are needed as paths, adjust accordingly
//     data['images'] = images?.map((image) => image.path).toList();
//     data['price'] = price;
//     data['tags'] = tags;
//     data['seller'] = seller;
//     return data;
//   }
// }
