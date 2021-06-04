import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> with TickerProviderStateMixin {
  TabController _tabController;
  bool switchValue = true;
  @override
  void initState() {
    this._tabController = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            //profile
            Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Forum',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontFamily: 'Rublik',
                        ),
                      ),
                      // SizedBox(
                      //   width: 215,
                      // ),
                      IconButton(
                        icon: Icon(Icons.add),
                        color: Colors.grey,
                        iconSize: 24,
                        tooltip: 'Show all settings',
                        onPressed: () {
                          print('Pressed');
                        },
                      ),
                      // Icon(
                      //   Icons.settings_outlined,
                      //   color: Colors.grey,
                      //   size: 24,
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.only(left: 25, right: 25, top: 18),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10), color: Colors.grey),
              child: Stack(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      fillColor: Color(0xfff2f2f2),
                      filled: true,
                      hintText: 'Search for topic, tags...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Trending tags
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Trending tags",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  Container(
                                    height: 45,
                                    width: 100,
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(10),
                                    //   color: Color(0xFFebf4ef),
                                    // ),
                                    child: Center(
                                      child: TextButton(
                                        child: Text('View all'),
                                        style: TextButton.styleFrom(
                                          primary: Color(0xffff6240),
                                          // backgroundColor: Colors.teal,
                                          // onSurface: Colors.grey,
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                          // side: BorderSide(
                                          //   color: Colors.red,
                                          //   width: 1,
                                          // ),
                                        ),
                                        onPressed: () {
                                          print('Pressed');
                                        },
                                      ),
                                      // child: Text(
                                      //   "Edit Profile",
                                      //   style: TextStyle(
                                      //       color: Color(0xffff6240),
                                      //       fontWeight: FontWeight.w700),
                                      // ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 0), //change
                              Text(
                                "#matchalatte",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0XFF5D6890),
                                ),
                              ),
                              Text(
                                "#vegan",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0XFF5D6890),
                                ),
                              ),
                              Text(
                                "#thaifood",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0XFF5D6890),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Recent post
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Recent post",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  Container(
                                    height: 45,
                                    width: 100,
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(10),
                                    //   color: Color(0xFFebf4ef),
                                    // ),
                                    child: Center(
                                      child: TextButton(
                                        child: Text('View all'),
                                        style: TextButton.styleFrom(
                                          primary: Color(0xffff6240),
                                          // backgroundColor: Colors.teal,
                                          // onSurface: Colors.grey,
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                          // side: BorderSide(
                                          //   color: Colors.red,
                                          //   width: 1,
                                          // ),
                                        ),
                                        onPressed: () {
                                          print('Pressed');
                                        },
                                      ),
                                      // child: Text(
                                      //   "Edit Profile",
                                      //   style: TextStyle(
                                      //       color: Color(0xffff6240),
                                      //       fontWeight: FontWeight.w700),
                                      // ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 0), //change
                              Text(
                                "Which type of pastry is boiled before it is baked?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
