import 'package:pixel_app/model/category_model.dart';

class Product{
  int id;
  String title;
  num price;
  String description;
  Category category;
  List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images
  });

  factory Product.fromMap(Map<String, dynamic> map){
    return Product(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      description: map['description'],
      category: Category.fromMap(map['category'] as Map<String, dynamic>),
      images: (map['images'] as List<dynamic>)
        .map((e) => e as String)
        .toList()
    );
  }

  factory Product.forCreate( String title, num price, String description, String image,Category category){
    return Product(id:0, title: title, price: price, description: description, images:[image], category: category);  
  }
  Map<String, dynamic> toStringMap(){
    return {
      'categoryId': category.id,
      'title': title,
      'price': price,
      'description': description,
      'images': images
    };
  }
}