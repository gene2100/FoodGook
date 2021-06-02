import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodgook/app/tabs/recipes/recipes_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodgook/app/components/addpost_item.dart';
// import 'package:foodgook/app/tabs/profile/profile_view.dart';

import 'nestedTabBarView.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class FeedsPage extends StatefulWidget {
  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> with TickerProviderStateMixin {
  var selectedIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    Color _notiIconColor = Colors.grey;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.orange[700],
            labelColor: Color(0xffff6240),
            unselectedLabelColor: Colors.black54,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.receipt),
                // icon: Icon(Icons.local_restaurant),
                text: 'Recipes',
              ),
              Tab(
                icon: Icon(Icons.forum),
                text: 'Forum',
              ),
              Tab(
                icon: Icon(Icons.local_grocery_store),
                text: 'Grocery',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Profile',
              ),
            ]),
      ),
      body: TabBarView(
        children: <Widget>[
          Column(
            //safe area and nested tab
            children: [
              Container(
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 21.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            //search bar and notifications
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 10.0),
                                      fillColor: Color(0xfff2f2f2),
                                      filled: true,
                                      hintText: 'Search for people, recipes...',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Row(
                              //   children: [
                              //     TextField(
                              //       decoration: InputDecoration(
                              //         contentPadding: EdgeInsets.symmetric(
                              //             vertical: 10.0, horizontal: 10.0),
                              //         fillColor: Color(0xfff2f2f2),
                              //         filled: true,
                              //         hintText: 'Search for people, recipes...',
                              //         border: OutlineInputBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(24.0),
                              //           borderSide: BorderSide.none,
                              //         ),
                              //         prefixIcon: Icon(
                              //           Icons.search,
                              //           size: 24,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),

                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.notifications_none),
                                    color: Colors.grey,
                                    iconSize: 24,
                                    tooltip: 'Show all notifications',
                                    //Still can't change color when clicked
                                    onPressed: () {
                                      setState(() {
                                        if (_notiIconColor == Colors.grey) {
                                          _notiIconColor = Color(0xffff6240);
                                        } else {
                                          _notiIconColor = Colors.grey;
                                        }
                                      });
                                    },
                                    padding: const EdgeInsets.all(15.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              NestedTabBar(),
            ],
          ),
          Center(
            // child: Text("Recipes"),
            child: RecipesView(),
            // RecipesPage(),
            //Add page route
          ),
          Center(
            child: Text("Forum"),
          ),
          Center(
            child: Text("Grocery"),
            //Add page route
          ),
          Center(
            child: Text("Profile"),
            // child: ProfileView(),
          ),
        ],
        controller: _tabController,
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Color(0xffff6240),
        foregroundColor: Colors.white,
        // child: Icon(Icons.ac_unit),
        //change to foodgook
        child:
            SvgPicture.asset('assets/svg/fabButton.svg'), //change to foodgook

        overlayColor: Colors.grey,
        overlayOpacity: 0.4,
        curve: Curves.easeIn,
        onOpen: () => print('Opening'),
        onClose: () => print('Closing'),
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            label: 'Add recipe',
            backgroundColor: Colors.white,
            foregroundColor: Color(0xffff6240),
            // onTap: () => print('First'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddRecipeScreen()), //addpost_item.dart
              );
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.live_tv_rounded),
            label: 'Live show',
            backgroundColor: Colors.white,
            foregroundColor: Color(0xffff6240),
            onTap: () => print('Second'),
          ),
          SpeedDialChild(
              child: Icon(Icons.logout),
              label: 'Log out',
              backgroundColor: Colors.white,
              foregroundColor: Color(0xffff6240),
              onTap: () {
                print('Third');
                _auth.signOut();
                Navigator.pop(context);
              })
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {}
}