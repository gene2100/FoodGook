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
            //Grocery topic
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
          ],
          //PlanetRow();
        ),
      ),
    );
  }
}
