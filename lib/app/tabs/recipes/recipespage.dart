import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:foodgook/app/models/newbook_model.dart';
import 'package:foodgook/app/models/popularbook_model.dart';
import 'package:foodgook/app/components/custom_tab_indicator.dart';
import 'package:get/get.dart';
import 'DataController.dart';

import 'detail/meal_detail_screen.dart';

List<QueryDocumentSnapshot> mergeList(QuerySnapshot snapshotData,QuerySnapshot snapshotData2){
  List data = snapshotData.docs;
  List data2 = snapshotData2.docs;
  List dataID = [];
  List dataResult;
  dataResult = data;

  for(int i = 0; i<data.length; i++){
    dataID.add(data[i].id);
  }

  for(int i = 0; i<data2.length; i++){
    if(!dataID.contains(data2[i].id)){
      dataResult.add(data2[i]);
    }
  }
  return dataResult;
}

class RecipesView extends StatefulWidget {
  @override
  _RecipesViewState createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {

  final TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData;
  QuerySnapshot snapshotData2;
  List<QueryDocumentSnapshot> queryData =[];
  bool isExecuted = false;

  @override
  Widget build(BuildContext context) {

    Widget searchedData(){
      return ListView.builder(
        itemCount: queryData.length,
        itemBuilder: (BuildContext context,int index) {
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MealDetailScreen(queryData[index].id)));
            },
            child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(queryData[index].data()['ImageURL']),
            ),

            title: Text(queryData[index].data()['Recipe_Name'],style: TextStyle(
                color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20.0
            ),),
            subtitle: Text(queryData[index].data()['Description'],style: TextStyle(
                color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 14.0
            ),),)
          );
        },
      );
    }


    return Scaffold(

      appBar: AppBar(
        actions: [
          GetBuilder<DataController>(
            init: DataController(),
            builder: (val) {
              return IconButton(icon: Icon(Icons.search),
                  color: Colors.black54,
                  onPressed: () {
                    val.queryData(searchController.text).then((value) {
                      snapshotData = value;
                      val.queryData2(searchController.text).then((value){
                        snapshotData2 = value;
                        queryData = mergeList(snapshotData, snapshotData2);
                        setState(() {
                          isExecuted = true;
                        });
                      });
                    });
                  });
            },
          )
        ],
        title: TextField(
          style: TextStyle(color: Colors.black54),
          decoration: InputDecoration(
            hintText: 'Search your favorite menu',
            hintStyle: TextStyle(color: Colors.black54),
          ),
          controller: searchController,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),

      body: isExecuted ? searchedData() :
      Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 25, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Recipes',
                      style: TextStyle(
                        // fontFamily: GoogleFonts.openSans ,
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontFamily: 'Rublik',
                      ),
                    ),
                  ],
                )),






            //old Por
            // TextField(
            //   // ignore: deprecated_member_use
            //   maxLengthEnforced: true,
            //   style: TextStyle(
            //     fontSize: 12,
            //     color: Colors.black,
            //     fontWeight: FontWeight.w600,
            //   ),
            //   decoration: InputDecoration(
            //     contentPadding:
            //         EdgeInsets.only(left: 19, right: 50, bottom: 8),
            //     border: InputBorder.none,
            //     hintText: 'Search Menu',
            //     hintStyle: TextStyle(
            //         fontSize: 12,
            //         color: Colors.white,
            //         fontWeight: FontWeight.w600),
            //   ),
            // ),
            // Positioned(
            //   right: 0,
            //   child: SvgPicture.asset('assets/svg/background_search.svg'),
            // ),
            // Positioned(
            //   top: 8,
            //   right: 9,
            //   child: Icon(Icons.search),
            //   // SvgPicture.asset('assets/icons/icon_search_white.svg'),
            // ),

            Container(
              height: 25,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 25),
              child: DefaultTabController(
                  length: 8,
                  child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    indicatorPadding: EdgeInsets.all(0),
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Rublik'),
                    unselectedLabelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Rublik'),

                    indicator: RoundedRectangleTabIndicator(
                        weight: 2, width: 10, color: Colors.black),
                    tabs: [
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right: 23),
                          child: Text('For you'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right: 23),
                          child: Text('Healthy'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right: 23),
                          child: Text('Fried'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right: 23),
                          child: Text('Curry'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right: 23),
                          child: Text('Stewed'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right: 23),
                          child: Text('Steam'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right: 23),
                          child: Text('Puff'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right: 23),
                          child: Text('Salad'),
                        ),
                      ),
                    ],
                  )),
            ),




            Container(
              margin: EdgeInsets.only(top: 21),
              height: 150,
              child: ListView.builder(



                  padding: EdgeInsets.only(left: 25, right: 6),
                  itemCount: newbooks.length,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {

                    return GestureDetector(
                      onTap: (){
                        print('ListView Tapped');
                      //   Navigator.of(context).push(
                      //       MaterialPageRoute(builder: (context) => MealDetailScreen(populars[index].docName)));
                      //
                      },

                      child: Container(
                        margin: EdgeInsets.only(right: 19),
                        height: 150,
                        width: 153,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepOrangeAccent,
                            image: DecorationImage(
                              image: AssetImage(newbooks[index].image),
                            )),
                      ),

                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: Text(
                'Popular',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            ListView.builder(
                padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: populars.length,
                itemBuilder: (context, index) {

                  return GestureDetector(
                    onTap: (){
                      print('ListView Tapped');
                    //   Navigator.of(context).push(
                    //       MaterialPageRoute(builder: (context) => MealDetailScreen(populars[index].docName)));
                    //
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 19),
                      height: 81,
                      width: MediaQuery.of(context).size.width - 50,
                      color: Colors.black12,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage(populars[index].image)),
                                color: Colors.deepOrangeAccent),
                          ),
                          SizedBox(
                            width: 21,
                          ),
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
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                populars[index].price,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
