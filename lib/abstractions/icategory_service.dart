import 'package:pixel_app/model/category_model.dart';

abstract class ICategoryService {
  Future<List<Category>> getCategories();
}

