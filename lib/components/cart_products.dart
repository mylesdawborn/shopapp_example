import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsInCart = [
    {
      "name": "Blue Modern Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "size": "M",
      "quantity": 1,
    },
    {
      "name": "Red & Dotty Dress",
      "picture": "images/products/dress1.jpeg",
      "price": 75,
      "size": "M",
      "quantity": 1,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productsInCart.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            cartProdName: productsInCart[index]["name"],
            cartProdImage: productsInCart[index]["picture"],
            cartProdPrice: productsInCart[index]["price"],
            cartProdSize: productsInCart[index]["size"],
            cartProdQuantity: productsInCart[index]["quantity"],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProdName;
  final cartProdImage;
  final cartProdPrice;
  final cartProdSize;
  final cartProdQuantity;

  SingleCartProduct({
    this.cartProdName,
    this.cartProdImage,
    this.cartProdPrice,
    this.cartProdSize,
    this.cartProdQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //Leading contains product image
        leading: Image.asset(
          cartProdImage,
          width: 85.0,
          height: 85.0,
        ),
        title: Text(cartProdName),

        //subtitle section contains size, quantity...
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                //size of product
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    cartProdSize,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                //quantity of product
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text("Quantity:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("$cartProdQuantity",
                      style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
            //Price of product
            new Container(
              alignment: Alignment.topLeft,
              child: Text(
                "\$${cartProdPrice}",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            )
          ],
        ),
        trailing: Column(
          children: <Widget>[
            IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: null),
            Text("$cartProdQuantity"),
            IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: null)
          ],
        ),
      ),
    );
  }
}
