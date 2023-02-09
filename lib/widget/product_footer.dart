import 'package:flutter/material.dart';


import 'package:pixel_app/widget/tag_component.dart';

import 'like_component.dart';

class ProductFooter extends StatelessWidget {
  final String description;
  final num price;
  

  ProductFooter(
      {super.key,
      required this.description,
      required this.price,
     });

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
      
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, bottom: 10, left: 10, right: 10),
      child: Column(
        children: [
          Text(description),
          Row(
            children: <Widget>[
              Expanded(flex: 1, child: Text("₹$price",
                style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      )
              )),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){
                      showSnackBar(context, 'Product added to cart');
                    },
                    child: const Text("Add to cart",
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                      )
                    )
                  )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
