import 'package:flutter/material.dart';
import 'package:shopapp_example/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
      {
      "name": "Blue Modern Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red & Dotty Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 75,
    },
    {
      "name": "Casual Track Pants",
      "picture": "images/products/pants1.jpg",
      "old_price": 170,
      "price": 95,
    },
    {
      "name": "Purple Haze Heels",
      "picture": "images/products/heels1.jpeg",
      "old_price": 150,
      "price": 80,
    },
    {
      "name": "English Cotton Smart Shoe ",
      "picture": "images/products/shoe1.jpg",
      "old_price": 175,
      "price": 100,
    },
    {
      "name": "Summer Floral Skirt",
      "picture": "images/products/skt1.jpeg",
      "old_price": 150,
      "price": 80,
    },
    {
      "name": "Blue Sailor Jacket",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 135,
      "price": 70,
    },
    {
      "name": "Black Lace Dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 100,
      "price": 65,
    },
    {
      "name": "Red Stiletto",
      "picture": "images/products/heels2.jpeg",
      "old_price": 200,
      "price": 130,
    },
    {
      "name": "Slim Grey Track Pants",
      "picture": "images/products/pants2.jpeg",
      "old_price": 150,
      "price": 80,
    },
    {
      "name": "Hot Pink Skirt",
      "picture": "images/products/skt2.jpeg",
      "old_price": 80,
      "price": 55,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleProducts(
              prodName: productList[index]['name'],
              prodImage: productList[index]['picture'],
              prodOldPrice: productList[index]['old_price'],
              prodPrice: productList[index]['price'],
            ),
          );
        });
  }
}

class SingleProducts extends StatefulWidget {
  final prodName;
  final prodImage;
  final prodOldPrice;
  final prodPrice;

  SingleProducts({
    this.prodName,
    this.prodImage,
    this.prodOldPrice,
    this.prodPrice,
  });

  @override
  _SingleProductsState createState() => _SingleProductsState();
}

class _SingleProductsState extends State<SingleProducts> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: widget.prodName,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  //Passing SingleProducts values to product_details
                  builder: (context) => new ProductDetails(
                        productDetailName: widget.prodName,
                        productDetailPrice: widget.prodPrice,
                        productDetailOldPrice: widget.prodOldPrice,
                        productDetailImage: widget.prodImage,
                      ))),
              child: GridTile(
                  footer: Container(
                      color: Colors.white70,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              widget.prodName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                          ),
                          Text(
                            "\$${widget.prodPrice}",
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  child: Image.asset(
                    widget.prodImage,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
