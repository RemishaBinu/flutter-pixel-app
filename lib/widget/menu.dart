import 'package:flutter/material.dart';
import 'package:pixel_app/model/category_model.dart';

class Menu extends StatelessWidget {
  final List<Category> categories;
  final Category? selectedCategory;
  final Function(Category category) onCategorySelect;
  Menu({
    super.key,
    required this.categories,
    required this.onCategorySelect,
    required this.selectedCategory
  });

  bool isSelected(int id){
    return selectedCategory != null && selectedCategory!.id == id;
  }

  List<Widget> getCategoryWidgets() {
    return categories
      .map((category) {
        return Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: GestureDetector(
                  onTap: () => onCategorySelect(category),
                  child: Text(category.name.toString(),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: isSelected(category.id) ? FontWeight.bold : FontWeight.normal
                      ),
                      textAlign: TextAlign.center),
                )
                      
                  );
      }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 100.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: getCategoryWidgets(),
        ));
  }
}
