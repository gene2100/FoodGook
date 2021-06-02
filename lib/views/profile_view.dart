import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with TickerProviderStateMixin {
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
      body: Container(
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
                    children: [
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontFamily: 'Rublik',
                        ),
                      ),
                      SizedBox(
                        width: 230,
                      ),
                      Icon(
                        Icons.settings_outlined,
                        color: Colors.grey,
                        // color: Color(0xff828282),
                        size: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //name+count
            Container(
              //name
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 50.0,
                            backgroundImage:
                                AssetImage('assets/images/cm0.jpeg'),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Phatto",
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
                                      child: Text("Edit Profile",
                                          style: TextStyle(
                                              color: Color(0xffff6240),
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 0), //change
                              Text(
                                "Passionate cook with more than six years.",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Count Recipes, Folliwing, Follower
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25.0,
                      horizontal: 5.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              'Recipes',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey[500],
                              ),
                            ),
                            Text(
                              '62',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              'Following',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey[500],
                              ),
                            ),
                            Text(
                              '500',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              'Followers',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey[500],
                              ),
                            ),
                            Text(
                              '540',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //tab view
            Container(
              child: TabBar(
                controller: this._tabController,
                indicatorColor: Color(0xffff6240),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Color(0xffff6240),
                // labelStyle: TextStyle(fontSize: 20.0),
                unselectedLabelColor: Colors.black,
                tabs: <Widget>[
                  Tab(text: 'Posts'),
                  Tab(text: 'Cookbooks'),
                  Tab(text: 'Forums'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: this._tabController,
                children: <Widget>[
                  //post1
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0), //10
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    child: Image.asset(
                                      'assets/images/em3.jpeg',
                                      height: 170,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox.shrink(),
                                // SizedBox(height: 8.0),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Cupcake",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.remove_red_eye_rounded,
                                            color: Colors.grey),
                                        SizedBox(width: 3),
                                        Text("14.1k"),
                                        SizedBox(width: 10),
                                        Icon(Icons.favorite,
                                            color: Color(0XFFEE2B4A)),
                                        SizedBox(width: 3),
                                        Text("259"),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "“Our cream of chicken soup makes a rich and...”",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "#cake  #dessert",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFF5D6890),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 5,
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //post1
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0), //10
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    child: Image.asset(
                                      'assets/images/em3.jpeg',
                                      height: 170,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox.shrink(),
                                // SizedBox(height: 8.0),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Cupcake",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.remove_red_eye_rounded,
                                            color: Colors.grey),
                                        SizedBox(width: 3),
                                        Text("14.1k"),
                                        SizedBox(width: 10),
                                        Icon(Icons.favorite,
                                            color: Color(0XFFEE2B4A)),
                                        SizedBox(width: 3),
                                        Text("259"),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "“Our cream of chicken soup makes a rich and...”",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "#cake  #dessert",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFF5D6890),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 5,
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //post1
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0), //10
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    child: Image.asset(
                                      'assets/images/em3.jpeg',
                                      height: 170,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox.shrink(),
                                // SizedBox(height: 8.0),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Cupcake",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.remove_red_eye_rounded,
                                            color: Colors.grey),
                                        SizedBox(width: 3),
                                        Text("14.1k"),
                                        SizedBox(width: 10),
                                        Icon(Icons.favorite,
                                            color: Color(0XFFEE2B4A)),
                                        SizedBox(width: 3),
                                        Text("259"),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "“Our cream of chicken soup makes a rich and...”",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "#cake  #dessert",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFF5D6890),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 5,
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
//post here
          ],
        ),
      ),
    );
  }
}
