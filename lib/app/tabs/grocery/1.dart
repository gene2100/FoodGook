//card with contents

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'package:foodgook/app/models/grocerybook_model.dart';
// import 'package:foodgook/app/models/grocery_model.dart';

class GroceryPage extends StatefulWidget {
  @override
  _GroceryPageState createState() => _GroceryPageState();
}

class _GroceryPageState extends State<GroceryPage> {
  @override
  Widget build(BuildContext context) {
    // Color _notiIconColor = Colors.grey;
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
                top: 25,
                right: 25,
                left: 25,
              ), //between Grocery and listview
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: populars.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 20), //space between each card
                  height: 100,
                  width: MediaQuery.of(context).size.width - 50,
                  // color: Colors.grey[100],
                  color: Color(0xfff7f7f7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //img and text
                          Row(
                            children: [
                              //img
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                          image:
                                              AssetImage(populars[index].image),
                                          fit: BoxFit.cover,
                                        ),
                                        color: Colors.deepOrangeAccent),
                                  ),
                                  // SizedBox(width: 20,),
                                  // Icon(Icons.more_horiz, color: Colors.grey),
                                ],
                              ),

                              SizedBox(
                                width: 20,
                              ),

                              //text part1 and part2
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end, //what
                                children: [
                                  //text part top
                                  Column(
                                    children: [
                                      Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.center,
                                        // crossAxisAlignment:
                                        //     CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                populars[index].title,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Icon(
                                                Icons.delete_outline,
                                                color: Color(0xffbdbdbd),
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        populars[index].price,
                                        style: TextStyle(
                                            fontSize: 14,
                                            // fontWeight: FontWeight.w600,
                                            color: Color(0xffff6240)),
                                      ),
                                    ],
                                  ),

                                  // Divider(
                                  //   color: Colors.grey,
                                  // ),
                                  //text part bottom

                                  Row(
                                    children: [
                                      Text(
                                        'See this recipe',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.arrow_drop_down),
                                        color: Color(0xffbdbdbd),
                                        iconSize: 30,
                                        //Still can't change color when clicked
                                        onPressed: () {
                                          print('Pressed');
                                          // setState(
                                          //   () {
                                          //     if (_notiIconColor ==
                                          //         Colors.grey) {
                                          //       _notiIconColor =
                                          //           Color(0xffff6240);
                                          //     } else {
                                          //       _notiIconColor = Colors.grey;
                                          //     }
                                          //   },
                                          // );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
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
