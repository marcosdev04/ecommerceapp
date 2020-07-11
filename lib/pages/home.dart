import 'package:ecommerce_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';

import '../componentes/products.dart';
import '../componentes/horizontal_listview.dart';
import '../pages/cart.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    // display images slide
    Widget image_carousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover
        ,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
//        autoplay: true, // para evitar que se reproduzca automaticamente
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotBgColor: Colors.transparent,
        dotSize: 5.0, // para cambiar el tamaño de los puntos para de una imagen a otra.
        indicatorBgPadding: 2.0, // margen de arriba y abajo del recuadro de los indicadores (puntos)
      ),
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepOrange),
        backgroundColor: Colors.white,
        title: Material(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[50],
          child: TextFormField(
            decoration: InputDecoration(
                hintText: "Search...",
                border: InputBorder.none),
            keyboardType: TextInputType.text,
            controller: _searchTextController,
            // ignore: missing_return
            validator: (value) {
              if (value.isEmpty) {
                return 'The search field cannot be empty';
              } else
                return null;
            },
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search,color: Colors.deepOrange), onPressed: (){}),
          IconButton(icon: Icon(Icons.shopping_cart,color: Colors.deepOrange), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
          }),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
//            header
            UserAccountsDrawerHeader(
              accountName: Text("Marcos Felipe"),
              accountEmail: Text("marcos.mfd@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person,color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: ListTile(
                title: Text("Home page"),
                leading: Icon(Icons.home,color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("My account"),
                leading: Icon(Icons.person,color: Colors.red),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("My orders"),
                leading: Icon(Icons.shopping_basket,color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));},
              child: ListTile(
                title: Text("Shopping cart"),
                leading: Icon(Icons.category,color: Colors.red),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text("Favorites"),
                leading: Icon(Icons.favorite,color: Colors.red),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            InkWell(
              onTap: (){user.signOut();},
              child: ListTile(
                title: Text("Log out"),
                leading: Icon(Icons.help,color: Colors.blue ,),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          // image carousel begins here
          image_carousel,

          // padding widget
          Padding(padding: const EdgeInsets.all(4.0),
              child: Container(alignment: Alignment.centerLeft,child: Text("Categories"))),
          // Horizontal ListView begins here
          HorizontalList(),
          new Padding(padding:  const EdgeInsets.all(4.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text('Recent products')
              )
          ),

          // grid view
          Flexible(child: Products())
        ],
      ),
    );
  }
}

