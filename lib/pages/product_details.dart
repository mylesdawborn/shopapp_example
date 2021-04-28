import 'package:flutter/material.dart';
import 'package:shopapp_example/pages/home.dart';

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailPrice;
  final productDetailOldPrice;
  final productDetailImage;

  ProductDetails(
      {this.productDetailName,
      this.productDetailPrice,
      this.productDetailOldPrice,
      this.productDetailImage});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.red,
          title: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('Fashion App')),
          actions: <Widget>[
            new IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 300,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.productDetailImage),
                ),
                footer: Container(
                  color: Colors.white30,
                  child: ListTile(
                    leading: Text(
                      widget.productDetailName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "\$${widget.productDetailOldPrice}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 20.0),
                        )),
                        Expanded(
                          child: Text(
                            "\$${widget.productDetailPrice}",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w800,
                                fontSize: 20.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //Size button, first row
            Row(
              children: <Widget>[
                Expanded(
                    child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Size"),
                            content: Text("Choose the size"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Size"),
                      ),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                )),

                //Quantity button
                Expanded(
                    child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Quantity"),
                            content: Text("Select Quantity"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Qty"),
                      ),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                )),
              ],
            ),

            // Buy button, second row
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("BUY NOW"),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    color: Colors.red,
                    onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.favorite_border),
                    color: Colors.red,
                    onPressed: () {}),
              ],
            ),
            Divider(
              color: Colors.red,
            ),
            ListTile(
              title: Text(
                "Product Details",
              ),
              subtitle: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            ),
            Divider(),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: Text(
                    "Product Name",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(widget.productDetailName),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: Text(
                    "Product Brand",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text("Brand"),
                )
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Related Products", textAlign: TextAlign.center, style: TextStyle(fontSize: 15.0),),
            ),

            //Similar Product Section
            Container(
              height: 500.0,
              child: SimilarProducts(),
            )
          ],
        ));
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
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
          return SimilarSingleProducts(
            prodName: productList[index]['name'],
            prodImage: productList[index]['picture'],
            prodOldPrice: productList[index]['old_price'],
            prodPrice: productList[index]['price'],
          );
        });
  }
}

class SimilarSingleProducts extends StatefulWidget {
  final prodName;
  final prodImage;
  final prodOldPrice;
  final prodPrice;

  SimilarSingleProducts({
    this.prodName,
    this.prodImage,
    this.prodOldPrice,
    this.prodPrice,
  });

  @override
  _SimilarSingleProductsState createState() => _SimilarSingleProductsState();
}

class _SimilarSingleProductsState extends State<SimilarSingleProducts> {
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
