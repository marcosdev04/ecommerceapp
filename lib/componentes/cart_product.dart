import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var products_on_cart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "size": "M",
      "color": "Black",
      "quantity": 1
    },
    {
      "name": "Shoes",
      "picture": "images/products/hills1.jpeg",
      "price": 50,
      "size": "M",
      "color": "Red",
      "quantity": 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products_on_cart.length,
        itemBuilder: (context, index) {
          return Container(
            child: Single_cart_product(
              cart_prod_name: products_on_cart[index]['name'],
              cart_prod_picture: products_on_cart[index]['picture'],
              cart_prod_price: products_on_cart[index]['price'],
              cart_prod_color: products_on_cart[index]['color'],
              cart_prod_size: products_on_cart[index]['size'],
              cart_prod_qty: products_on_cart[index]['quantity'],
            ),
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_color;
  final cart_prod_size;
  final cart_prod_qty;

  Single_cart_product(
      {this.cart_prod_name,
        this.cart_prod_picture,
        this.cart_prod_price,
        this.cart_prod_color,
        this.cart_prod_size,
        this.cart_prod_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  height: 100.0,
                  width: 80.0,
                  child: Image.asset(
                    cart_prod_picture,
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                        height: 80.0,
                        width: 200.0,
                        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(cart_prod_name),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: Text("Size:"),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      cart_prod_size,
                                      style: TextStyle(color: Colors.red),
                                    )),
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(8.0, 4.0, 0.0, 4.0),
                                  child: Text("Color:"),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(8.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    cart_prod_color,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "\$${cart_prod_price}",
                                style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )),

                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: Column(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.arrow_drop_up),
                              padding: const EdgeInsets.only(bottom: 20.0),
                              onPressed: () {},
                              alignment: Alignment.topCenter,
                              color: Colors.grey),
                          Text("$cart_prod_qty"),
                          IconButton(
                              icon: Icon(Icons.arrow_drop_down),
                              padding: const EdgeInsets.only(top: 20.0),
                              onPressed: () {},
                              alignment: Alignment.topCenter,
                              color: Colors.grey)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
