import 'dart:convert';

import 'package:http/http.dart';
import 'package:pixel_app/abstractions/iproduct_service.dart';
import 'package:pixel_app/configs/httpservice_conf.dart';
import 'package:pixel_app/model/product_model.dart';
import 'package:pixel_app/service/base_api_service.dart';
import 'package:pixel_app/widget/search.dart';

class ApiProductService extends BaseApiService implements IProductService {
  @override
  Future<List<Product>> getProductsByCategory(int catId, String? search) async {
    var queryParams = {'categoryId': "$catId"};
    if (search != null) {
      queryParams['title'] = search;
    }
    var uri = HttpServiceConfig.getApiUri('products', queryParams: queryParams);
    Response response = await client.get(uri);
    if (!isSuccess(response)) {
      throw Exception("Cannot get products");
    }

    return getArrayMap(response).map((e) => Product.fromMap(e)).toList();
  }

  @override
  Future<Product> getProductById(int productId) async {
    var uri = HttpServiceConfig.getApiUri('products/$productId');
    Response response = await client.get(uri);
    if (!isSuccess(response)) {
      throw Exception('Cannot get products');
    }

    return Product.fromMap(getMap(response));
  }
  
  @override
  Future<Product> createProduct(Product product) async{
    var uri = HttpServiceConfig.getApiUri('products');
    var headers = {
      'Content-Type': 'application/json'
    };
    Response response = await client.post(
      uri, headers: headers,
      body: jsonEncode(product.toStringMap())
    );
    print(response.statusCode);
    if(!isSuccess(response)){
      throw Exception('Could not create product');
    }
    return Product.fromMap(getMap(response));
  }

}
