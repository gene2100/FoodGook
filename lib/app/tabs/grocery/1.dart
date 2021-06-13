import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'package:foodgook/app/models/popularbook_model.dart';
// import 'package:foodgook/app/models/grocery_model.dart';

class GroceryPage extends StatefulWidget {
  @override
  _GroceryPageState createState() => _GroceryPageState();
}

class _GroceryPageState extends State<GroceryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Grocery',
                    style: TextStyle(
                      // fontFamily: GoogleFonts.openSans ,
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontFamily: 'Rublik',
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.only(
                  top: 25, right: 25, left: 25), //between Grocery and listview
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: populars.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: 100,
                  width: MediaQuery.of(context).size.width - 50,
                  color: Colors.grey[200],
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //photo
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage(populars[index].image),
                              fit: BoxFit.fill,
                            ),
                            color: Colors.deepOrangeAccent),
                      ),
                      //between Photo and Text
                      SizedBox(
                        width: 20,
                      ),
                      //text
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            populars[index].title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            populars[index].price,
                            style: TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
