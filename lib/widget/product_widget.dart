import 'package:flutter/material.dart';

import 'package:pixel_app/widget/custom_image.dart';
import 'package:pixel_app/widget/product_footer.dart';
import 'package:pixel_app/widget/product_header.dart';

import '../model/product_model.dart';
import '../routes.dart';
import 'carousel_widget.dart';

class ProductWidget extends StatefulWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});
  @override
  State<ProductWidget> createState() {
    return ProductWidgetState();
  }
}

class ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final productId = {'productId': widget.product.id};
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      color: Colors.white,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/${Routes.product.name}',
            arguments: productId),
        child: Column(
          children: [
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
              child: CustomImage(imageUrl: widget.product.images[0]),
            ),
            Container(
              child: ProductFooter(
                description: widget.product.description,
                price: widget.product.price,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
