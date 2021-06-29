//card with contents
library circular_check_box;

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'package:foodgook/app/models/grocerybook_model.dart';
import 'package:flutter/widgets.dart';

// import 'package:foodgook/app/models/grocery_model.dart';

class GroceryPage extends StatefulWidget {
  @override
  _GroceryPageState createState() => _GroceryPageState();
}

class _GroceryPageState extends State<GroceryPage> {
  var _checked = false;

  void checkboxChange(bool val) {
    setState(() {
      _checked = val;
    });
  }

  Map<String, bool> numbers = {
    'One': false,
    'Two': false,
    'Three': false,
  };

  var holder_1 = [];

  getItems() {
    numbers.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(holder_1);

    // Clear array after use.
    holder_1.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            //Topic: Grocery
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

              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              // itemCount: populars.length,
              itemCount: itemData.length,

              itemBuilder: (context, index) {
                return ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 1000),
                  dividerColor: Colors.yellow,
                  elevation: 1, //shadow
                  children: [
                    ExpansionPanel(
                      //expanded
                      // body: Container(
                      //   padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                      //   // padding: EdgeInsets.all(10),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: <Widget>[
                      //       Text(
                      //         itemData[index].discription,
                      //         style: TextStyle(
                      //           color: Colors.grey[700],
                      //           fontSize: 15,
                      //           letterSpacing: 0.3,
                      //           // height: 1.3,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      body: ListTile(
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                        // leading: Padding(
                        //   padding: const EdgeInsets.fromLTRB(6, 6, 0, 0),
                        //   child: Icon(
                        //     Icons.circle,
                        //     color: Colors.black,
                        //     size: 12,
                        //   ),
                        // ),
                        title: Text(
                          itemData[index].discription,
                          style: TextStyle(fontSize: 16),
                        ),
                        // trailing: Checkbox(
                        //   splashRadius: 30,
                        //   tristate: ,
                        //   // value: widget.item.estado == 1 ? true : false,
                        //   // onChanged: (bool v) {
                        //   //   inOutAnimation.currentState.animateOut();

                        //   //   Future.delayed(const Duration(milliseconds: 500), () {
                        //   //     _updateEstadoItem(v);
                        //   //     widget.getItemsRefreshShopList(widget.item.idShopList);
                        //   //   });
                        //   // },
                        // ),
                      ),

                      // CheckboxListTile(
                      //   // contentPadding:
                      //   //     EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      //   contentPadding:
                      //       EdgeInsets.only(bottom: 10, left: 20, right: 20),
                      //   activeColor: Color(0xffff6240),
                      //   checkColor: Colors.white,
                      //   dense: true,
                      //   title: Text(
                      //     itemData[index].discription,
                      //     // 'check1',
                      //     style: TextStyle(
                      //       color: Colors.grey[700],
                      //       fontSize: 15,
                      //       letterSpacing: 0.3,
                      //       // height: 1.3,
                      //     ),
                      //   ),
                      //   // secondary: Icon(
                      //   //   Icons.check_box_outline_blank,
                      //   // ),
                      //   controlAffinity: ListTileControlAffinity.leading,
                      //   value: _checked,
                      //   onChanged: checkboxChange,
                      // ),
                      //header
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          //card contents
                          // child: ListTile(
                          //   contentPadding: EdgeInsets.symmetric(
                          //     vertical: 10.0,
                          //     horizontal: 10.0,
                          //   ),
                          //   dense: false,
                          //   //img
                          //   leading: ConstrainedBox(
                          //     constraints: BoxConstraints(
                          //       minWidth: 80,
                          //       minHeight: 80,
                          //       maxWidth: 80,
                          //       maxHeight: 80,
                          //     ),
                          //     child: Container(
                          //       //photo
                          //       // height: 80,
                          //       // width: 80,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(5),
                          //           image: DecorationImage(
                          //             image: AssetImage(populars[index].image),
                          //             fit: BoxFit.cover,
                          //           ),
                          //           color: Colors.deepOrangeAccent),
                          //     ),
                          //   ),
                          //   //Title
                          //   title: Text(
                          //     populars[index].title,
                          //     overflow: TextOverflow.ellipsis,
                          //     style: TextStyle(fontWeight: FontWeight.w700),
                          //   ),
                          //   //Subtitle
                          //   subtitle: Text(
                          //     populars[index].price,
                          //     overflow: TextOverflow.ellipsis,
                          //     style: TextStyle(
                          //         fontSize: 14,
                          //         // fontWeight: FontWeight.w700,
                          //         color: Color(0xffff6240)),
                          //   ),
                          // ),

                          //custom card contents
                          child: Padding(
                            padding: EdgeInsets.only(top: 0.0),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 20.0,
                                bottom: 20.0,
                              ),
                              child: InkWell(
                                onTap: () {
                                  print(populars[index].title);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      //photo
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                populars[index].image),
                                            fit: BoxFit.cover,
                                          ),
                                          color: Colors.deepOrangeAccent),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 8.0, bottom: 4.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                populars[index].title,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 0.0, bottom: 4.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                populars[index].price,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  // fontWeight: FontWeight.w700,
                                                  color: Color(0xffff6240),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            print(populars[index].title);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 15.0, bottom: 4.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'See this recipe',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      isExpanded: itemData[index].expanded,
                    ),
                  ],
                  expansionCallback: (int item, bool status) {
                    setState(
                      () {
                        itemData[index].expanded = !itemData[index].expanded;
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<ItemModel> itemData = <ItemModel>[
    ItemModel(
      // headerItem: 'Hi',
      discription: "check1\ncheck2\ncheck3\ncheck4\ncheck5",
      colorsItem: Colors.black,
      // img: 'assets/images/1.jpg',
    ),
    ItemModel(
      // headerItem: 'Hi',
      discription: "check1\ncheck2\ncheck3",
      colorsItem: Colors.black,
      // img: 'assets/images/1.jpg',
    ),
    ItemModel(
      // headerItem: 'Hi',
      discription: "check1\ncheck2\ncheck3\ncheck4\ncheck5",
      colorsItem: Colors.black,
      // img: 'assets/images/1.jpg',
    ),
    ItemModel(
      // headerItem: 'Hi',
      discription: "check1\ncheck2\ncheck3\ncheck4\ncheck5\ncheck6\ncheck7",
      colorsItem: Colors.black,
      // img: 'assets/images/1.jpg',
    ),
    ItemModel(
      // headerItem: 'Hi',
      discription: "check1\ncheck2",
      colorsItem: Colors.black,
      // img: 'assets/images/1.jpg',
    ),
    ItemModel(
      // headerItem: 'Hi',
      discription: "check1\ncheck2\ncheck3\ncheck4\ncheck5\ncheck6",
      colorsItem: Colors.black,
      // img: 'assets/images/1.jpg',
    ),
    ItemModel(
      // headerItem: 'Hi',
      discription: "check1\ncheck2\ncheck3\ncheck4\ncheck5",
      colorsItem: Colors.black,
      // img: 'assets/images/1.jpg',
    ),
    ItemModel(
      // headerItem: 'Hi',
      discription: "check1\ncheck2\ncheck3\ncheck4\ncheck5",
      colorsItem: Colors.black,
      // img: 'assets/images/1.jpg',
    ),
  ];
}

class ItemModel {
  bool expanded;
  // String headerItem;
  String discription;
  Color colorsItem;
  // String img;

  ItemModel({
    this.expanded: false,
    // this.headerItem,
    this.discription,
    this.colorsItem,
    // this.img,
  });
}
