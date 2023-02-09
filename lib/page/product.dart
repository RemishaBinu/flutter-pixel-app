import 'package:flutter/material.dart';
import 'package:pixel_app/abstractions/iproduct_service.dart';
import 'package:pixel_app/routes.dart';
import 'package:pixel_app/widget/product_detailed_widget.dart';
import 'package:pixel_app/widget/product_widget.dart';
import '../model/product_model.dart';

class ProductPage extends StatefulWidget {
  final int productId;
  final IProductService productService;

  const ProductPage(
      {super.key, required this.productId, required this.productService});

  @override
  State<ProductPage> createState() {
    return ProductPageState();
  }
}

class ProductPageState extends State<ProductPage> {
  Product? product;
  setProduct(Product prd) {
    setState(() {
      product = prd;
    });
  }

  @override
  void initState() {
    super.initState();
    loadProduct();
  }

 
  void loadProduct() async {
    setProduct(await widget.productService.getProductById(widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 230, 211),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 30),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios)
                    )
                  ],
                ),
              ),
              (product != null)
                  ? ProductDetails(product: product!)
                  : const Text('Loading'),
            ],
          ),
        ),
      ),
    );
  }
}
