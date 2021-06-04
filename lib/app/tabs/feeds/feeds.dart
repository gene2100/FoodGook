import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodgook/app/tabs/profile/profile_view.dart';
import 'package:foodgook/app/tabs/recipes/recipes_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodgook/app/components/addpost_item.dart';
// import 'package:foodgook/app/tabs/profile/profile_view.dart';

import 'details/nestedTabBarView.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class FeedsPage extends StatefulWidget {
  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Recipes',
      style: optionStyle,
    ),
    Text(
      'Index 2: Forum',
      style: optionStyle,
    ),
    Text(
      'Index 3: Grocery',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    Color _notiIconColor = Colors.grey;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        iconSize: 25.0, //20
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            label: 'Recipes',
            icon: Icon(Icons.receipt),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            label: 'Forum',
            icon: Icon(Icons.forum),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            label: 'Grocery',
            icon: Icon(Icons.local_grocery_store),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
            backgroundColor: Colors.red,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xffff6240),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
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
