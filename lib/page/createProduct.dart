import 'package:flutter/material.dart';
import 'package:pixel_app/abstractions/icategory_service.dart';
import 'package:pixel_app/main.dart';
import 'package:pixel_app/model/category_model.dart';
import 'package:pixel_app/model/file_upload_response_model.dart';
import 'package:pixel_app/model/product_model.dart';

import 'package:pixel_app/widget/custom_text_field.dart';
import 'package:pixel_app/widget/header_component.dart';
import 'package:pixel_app/widget/primary_button.dart';

import '../abstractions/iproduct_service.dart';
import '../routes.dart';
import '../validators/description_validator.dart';
import '../validators/price_validator.dart';
import '../validators/title_validator.dart';
import '../widget/image_picker.dart';

class CreateProduct extends StatefulWidget {
  CreateProduct({super.key, required this.productService, required this.categoryService});

  final IProductService productService;
  final ICategoryService categoryService;

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  final titleValidator = TitleValidator();
  final priceValidator = PriceValidator();
  final descriptionValidator = DescriptionValidator();

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {

  FileUploadResponse? fileUploadData;
  Category? selectedCategory;

  List<Category>? categories;
  Future loadCategories() async {
    var cats = await widget.categoryService.getCategories();
    setState(() {
      categories = cats;
    });
  }

  setFileUploadData(FileUploadResponse fud){
    setState(() {
      fileUploadData = fud;
    });
  }

  selectCategory(Category ctr){
    setState(() {
      selectedCategory = ctr;
    });
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  bool isFormValid(){
    return widget.titleValidator.valid() && 
      widget.priceValidator.valid() &&
      widget.descriptionValidator.valid();
  }

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Widget getCategoryDropDown(){
    return DropdownButton<Category>(
      value: selectedCategory,
      icon: const Icon(Icons.keyboard_arrow_down),
      hint: const Text('Select category'),
      elevation: 16,
      onChanged: (Category? category) {
        // This is called when the user selects an item.
        if(category==null){
          return;
        }
        selectCategory(category);
      },
      items: categories!.map<DropdownMenuItem<Category>>((Category category) {
        return DropdownMenuItem<Category>(
          value: category,
          child: Text(category.name),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  child: const Header(
                    upperText: 'Create product',
                    lowerText: ' ',
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  child: ImagePickerWidget(
                    title: 'Upload product image',
                    onUploaded: (fileData) {
                      print(fileData.location);
                      setFileUploadData(fileData);
                      showSnackBar(context, 'File uploaded and ready');
                    },
                  )),
                Container(
                  alignment: Alignment.centerLeft,
                  child: (categories!=null && categories!.isNotEmpty)?getCategoryDropDown():Text('Loading'),
                ),
        
              CustomTextField(
                  label: 'title',
                  controller: widget.titleController,
                  validator: widget.titleValidator),
              CustomTextField(
                  label: 'price',
                  controller: widget.priceController,
                  validator: widget.priceValidator),
              CustomTextField(
                  label: 'description',
                  controller: widget.descriptionController,
                  validator: widget.descriptionValidator),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child:  PrimaryButton(
                    text: 'Create product',
                    onPressed: (){
                      if(!isFormValid()){
                        showSnackBar(context, 'All fiels are mandatory');
                        return;
                      }

                     
                       Product product = Product.forCreate(
                        widget.titleController.text,
                        int.parse(widget.priceController.text),
                        widget.descriptionController.text,
                        fileUploadData!.location,
                        selectedCategory!
                         
                       );
                      productService.createProduct(product)
                        .then((pResult){
                          if(pResult==null || pResult.id<0){
                            showSnackBar(
                              context  , 'Failed to create product');
                            return;
                          }
                          showSnackBar(context, 'Product created');
                          Navigator.pushReplacementNamed(
                            context,
                            '/${Routes.product.name}',
                            arguments: {'productId': pResult.id}
                          );
                        });
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
