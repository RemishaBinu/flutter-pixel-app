import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pixel_app/abstractions/icategory_service.dart';
import 'package:pixel_app/model/category_model.dart';
import 'package:pixel_app/service/base_api_service.dart';

import '../configs/httpservice_conf.dart';

class ApiCategoryService extends BaseApiService implements ICategoryService {
  @override
  Future<List<Category>> getCategories() async {
    var uri = HttpServiceConfig.getApiUri('categories');
    Response response = await client.get(uri);
    if(!isSuccess(response)){
      throw Exception("Cannot get categories");
    }

    List<Map<String, dynamic>> data = getArrayMap(response);
    return data
      .map((map) => Category.fromMap(map))
      .toList();
  }

 

}