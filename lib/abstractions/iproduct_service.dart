import 'package:pixel_app/model/product_model.dart';

abstract class IProductService{
  Future<List<Product>> getProductsByCategory(int catId, String? search);
  Future<Product> getProductById(int productId);
  Future<Product> createProduct(Product products);
}