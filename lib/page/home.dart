import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pixel_app/abstractions/icategory_service.dart';
import 'package:pixel_app/abstractions/ilocalstorage_service.dart';
import 'package:pixel_app/abstractions/iproduct_service.dart';
import 'package:pixel_app/model/category_model.dart';
import 'package:pixel_app/model/product_model.dart';
import 'package:pixel_app/widget/menu.dart';
import 'package:pixel_app/widget/product_widget.dart';
import 'package:pixel_app/widget/round_asset_image.dart';
import 'package:pixel_app/widget/round_network_image.dart';
import 'package:pixel_app/widget/search.dart';
import 'package:pixel_app/widget/snap_header.dart';

import 'package:pixel_app/widget/create_snap_widget.dart';
import 'package:pixel_app/widget/custom_image.dart';

import '../model/user.dart';
import '../routes.dart';
import '../widget/bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  var size;
  var height;
  var width;
  final ICategoryService categoryService;
  final IProductService productService;
  final ILocalStorage localStorage;
  final User currentUser;

  Home({
    super.key,
    required this.currentUser,
    required this.categoryService,
    required this.productService,
    required this.localStorage});

  @override
  State<Home> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  List<Category>? categories;
  Future loadCategories() async {
    var cats = await widget.categoryService.getCategories();
    setState(() {
      categories = cats;
    });
  }

  Category? selectedCategory;
  Future selectCategory(int categoryId) async {
    if (categories == null || categories!.length < 1) {
      return;
    }
    setState(() {
      selectedCategory =
          categories!.firstWhere((element) => element.id == categoryId);
      products = null;
    });

    await loadProducts();
  }

  String? searchText;

  void setSearchText(String? search) async {
    setState(() {
      searchText = search;
    });

    await loadProducts();
  }

  @override
  void initState() {
    super.initState();
    loadDataAsync();
  }

  void loadDataAsync() async {
    await loadCategories();
    if (categories == null || categories!.length < 1) {
      return;
    }
    await selectCategory(categories![0].id);
  }

  List<Product>? products;

  Future loadProducts() async {
    if (selectedCategory == null) {
      return;
    }
    List<Product> prds = await widget.productService.getProductsByCategory(
        selectedCategory!.id, searchText);

    if (prds == null) {
      return;
    }
    setState(() {
      products = prds;
    });
  }

  getProductWidgets() {
    if (products == null || products!.length < 1) {
      return [Text("Loading")];
    }
    return products!.map((e) => ProductWidget(product: e)).toList();
  }

  getCurrentUserAvatar() {
    if (widget.currentUser == null) {
      return const RoundAssetImage(imageUrl: "assets/images/pofilepic.png");
    }
    return RoundNetworkImage(imageUrl: widget.currentUser.avatar ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 248, 240),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 30, bottom: 16, left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Search(
                          onChange: (value) {
                            setSearchText(value);
                          },
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, '/${Routes.settings.name}'),
                              child: getCurrentUserAvatar())),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 30, bottom: 30, left:10),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                                  context, '/${Routes.createProduct.name}'),
                      child: const Text('Create a product',
                      style: TextStyle(color: Colors.blue,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,),
                    ),
                  ),
                  if (categories != null)
                    Menu(
                      categories: categories!,
                      onCategorySelect: (category) =>
                          selectCategory(category.id),
                      selectedCategory: selectedCategory,
                    ),
                  Column(
                    children: getProductWidgets(),
                  )
                ],
              ),
            )
          ],
        )),
        bottomNavigationBar: BottomNav());
  }
}
