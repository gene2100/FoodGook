//card with contents

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
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    holder_1.clear();
  }

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
              // itemCount: populars.length,
              itemCount: itemData.length,

              itemBuilder: (context, index) {
                return ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 1000),
                  dividerColor: Colors.yellow,
                  elevation: 1, //shadow
                  children: [
                    ExpansionPanel(
                      body: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipOval(
                              child: CircleAvatar(
                                child: Image.asset(
                                  itemData[index].img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              itemData[index].discription,
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 15,
                                  letterSpacing: 0.3,
                                  height: 1.3),
                            ),
                          ],
                        ),
                      ),
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            itemData[index].headerItem,
                            style: TextStyle(
                              color: itemData[index].colorsItem,
                              fontSize: 18,
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
        headerItem: 'Hi',
        discription:
            "Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
        colorsItem: Colors.black,
        img: 'assets/images/1.jpg'),
    ItemModel(
        headerItem: 'Hi',
        discription:
            "Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
        colorsItem: Colors.black,
        img: 'assets/images/1.jpg'),
  ];
}

class ItemModel {
  bool expanded;
  String headerItem;
  String discription;
  Color colorsItem;
  String img;

  ItemModel(
      {this.expanded: false,
      this.headerItem,
      this.discription,
      this.colorsItem,
      this.img});
}
