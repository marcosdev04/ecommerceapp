import 'package:flutter/material.dart';

import '../pages/home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails(
      {this.product_detail_name,
        this.product_detail_new_price,
        this.product_detail_old_price,
        this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));},
          child: Text("ShopApp"),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.black,
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
//                  leading: new Text(widget.product_detail_name),
                  title: new Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.product_detail_name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ),
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Text(
                                "\$${widget.product_detail_old_price}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough),
                              ))),
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                  "\$${widget.product_detail_new_price}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red)))),
                    ],
                  ),
                ),
              ),
            ),
          ),

//        ##  THE FIRST BUTTONS   ##
          Row(
            children: <Widget>[
//          ##  THE SIZE BUTTON
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
                                child: new Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
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
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Colors"),
                            content: Text("Choose the color"),
                            actions: <Widget>[
                              MaterialButton(
                                child: new Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
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
                        child: Text("Color"),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Quantity"),
                            content: Text("Choose the quantity"),
                            actions: <Widget>[
                              MaterialButton(
                                child: new Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
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
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),

//       ## THE SECOND BUTTON
          Row(
            children: <Widget>[
//          ##  THE BUY BUTTON
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text("Buy now"),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.add_shopping_cart, color: Colors.red),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.red),
                  onPressed: () {})
            ],
          ),

          Divider(),

//    ##  PRODUCT DETAILS
          ListTile(
            title: Text("Product Details"),
            subtitle: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product Name",style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(widget.product_detail_name),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product brand",style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Brand X"),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product condition",style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("NEW"),
              ),
            ],
          ),

          Divider(),
          Padding(padding: const EdgeInsets.all(8.0),child: Text("Similar Products")),

//        ##  SIMILAR PRODUCTS SECTION ##

          Container(
            height: 300.0,
            child: SimilarProducts(),
          )
        ],
      ),
    );
  }
}

//  ##>>>>>>   SIMILAR PRODUCTS   <<<<<==

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85
    },
    {
      "name": "Red dress",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 100,
      "price": 50
    },
    {
      "name": "Red dress",
      "picture": "images/products/skt2.jpeg",
      "old_price": 100,
      "price": 50
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext _, int index) {
          return SimilarSingleProduct(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class SimilarSingleProduct extends StatelessWidget {

  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  SimilarSingleProduct({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: Text("Hero 2"),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductDetails(
              product_detail_picture: prod_picture,
              product_detail_name: prod_name,
              product_detail_old_price: prod_old_price,
              product_detail_new_price: prod_price,
            )
            )),
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0))
                    ),
                    Text("\$${prod_price}",style: TextStyle(color: Colors.red))
                  ],
                ),
              ),
              child: Image.asset(prod_picture,fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}

