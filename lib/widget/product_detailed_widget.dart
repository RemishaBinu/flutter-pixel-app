import 'package:flutter/material.dart';
import 'package:pixel_app/widget/product_footer.dart';
import 'package:pixel_app/widget/product_header.dart';
import '../model/product_model.dart';
import 'carousel_widget.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() {
    return ProductDetailsState();
  }
}

class ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      color: Colors.white,
      child: Column(children: [
        Row(children: [
          Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                child: ProductHeader(
                  title: widget.product.title,
                  imageUrl: widget.product.images[0],
                ),
              )),
        ]),
        Container(
          width: double.infinity,
          child: CarouselWidget(imageUrl: widget.product.images),
        ),
        Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 10, left: 16),
            child: Text(
              widget.product.category.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.start,
            )),
        Container(
          child: ProductFooter(
            description: widget.product.description,
            price: widget.product.price,
          ),
        ),
      ]),
    );
  }
}
