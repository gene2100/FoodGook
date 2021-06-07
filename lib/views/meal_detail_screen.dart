import 'package:http/http.dart' as http;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodgook/views/recipes_view.dart';
import 'package:foodgook/models/popularbook_model.dart';




class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';


  String docName;

  MealDetailScreen(
  String docName
  ){
    this.docName = docName;
  }




  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute
        .of(context)
        .settings
        .arguments as String;



    return Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Recipes").doc(docName).snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator(),);
            }
            return
              Container(
                child:
                Stack(
                  children: <Widget>[
                    Container(
                      height: 300,
                      width: double.infinity,
                      child:
                        Image.network(snapshot.data['ImageURL'],
                          fit: BoxFit.cover,),


                    ),
                    DraggableScrollableSheet(
                        initialChildSize: 0.6,
                        minChildSize: 0.6,
                        maxChildSize: 1,
                        builder: (context, scrollController) {
                          return SingleChildScrollView(
                            controller: scrollController,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(padding: const EdgeInsets.fromLTRB(
                                        0, 20, 0, 0)),
                                    Row(
                                        children: <Widget>[
                                          Flexible(
                                            flex: 10,
                                            fit: FlexFit.tight,
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .fromLTRB(20.0, 0, 0, 0),
                                              child: FittedBox(child: Text(snapshot.data['Recipe_Name'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              ),),
                                          ),
                                          Flexible(
                                              flex: 2,
                                              child: Icon(Icons.av_timer,
                                                color: Colors.blue,
                                                size: 18,)
                                          ),
                                          Text(snapshot.data['Cook_Time'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                          Icon(
                                            Icons.signal_cellular_alt_rounded,
                                            color: Colors.green,
                                            size: 18,),
                                          Text(snapshot.data['Level'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ]
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 0, 0, 0),
                                      child: Text(snapshot.data['Tag'].toString(),
                                          style: TextStyle(fontSize: 15,
                                              color: const Color(0xFF00008B))),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Text(snapshot.data['Description'],
                                            style: TextStyle(
                                                fontFamily: 'Rubik'))
                                    ),
                                    Padding(padding: const EdgeInsets.fromLTRB(
                                        20.0, 0, 20, 20),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: const Color(0x1BF9D758),
                                                borderRadius: BorderRadius
                                                    .circular(15)),
                                            child: Row(
                                              children: <Widget>[
                                                Flexible(
                                                  flex: 2,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        20.0, 0, 0, 0),
                                                    child: Icon(Icons.star,
                                                        color: const Color(
                                                            0xFFFF6240)),
                                                  ),
                                                ),
                                                Text(snapshot.data['Rating'].toString(),
                                                    style: TextStyle(
                                                        fontFamily: 'Rubik',
                                                        fontWeight: FontWeight
                                                            .w500,
                                                        fontSize: 20)
                                                ),
                                                Flexible(
                                                  flex: 7,
                                                  fit: FlexFit.tight,
                                                  child: Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          20.0, 10, 0, 10),
                                                      child: Text(snapshot.data['View'].toString() +
                                                          ' people\nTry this recipe',
                                                          style: TextStyle(
                                                              fontFamily: 'Rubik',
                                                              color: Colors
                                                                  .grey))
                                                  ),
                                                ),
                                                Flexible(
                                                    flex: 1,
                                                    child: Padding(
                                                        padding: const EdgeInsets
                                                            .fromLTRB(
                                                            10.0, 0, 0, 0),
                                                        child: Icon(Icons
                                                            .arrow_forward_ios,
                                                            color: Colors.grey)
                                                    )
                                                )
                                              ],
                                            )
                                        )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 0, 0, 30),
                                      child: Row(
                                          children: <Widget>[
                                            CircleAvatar(
                                                backgroundColor: Color(
                                                    0xffE6E6E6),
                                                radius: 20,
                                                child: Icon(
                                                  Icons.person,
                                                  color: Color(0xffCCCCCC),
                                                )
                                            ),
                                            Flexible(
                                                flex: 2,
                                                fit: FlexFit.loose,
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        10.0, 0, 0, 0),
                                                    child: RichText(
                                                        text: TextSpan(
                                                            style: DefaultTextStyle
                                                                .of(context)
                                                                .style,
                                                            children: <
                                                                TextSpan>[
                                                              TextSpan(
                                                                  text: snapshot.data['User'] + '\n',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight
                                                                          .bold,
                                                                      fontFamily: 'Rubik')),
                                                              TextSpan(
                                                                  text: '1 Recipe',
                                                                  style: TextStyle(
                                                                      fontFamily: 'Rubik',
                                                                      color: Colors
                                                                          .grey)),
                                                            ]
                                                        )
                                                    )
                                                )
                                            ),
                                            Flexible(
                                                flex: 2,
                                                fit: FlexFit.tight,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(20, 0, 0, 0),
                                                  child: Text('Follow',
                                                      style: TextStyle(
                                                          fontFamily: 'Rubik',
                                                          color: Colors
                                                              .indigo)),
                                                )
                                            ),
                                            Flexible(
                                                flex: 4,
                                                fit: FlexFit.tight,
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(40, 0, 10, 0),
                                                    child: Row(
                                                        children: <Widget>[
                                                          Flexible(
                                                            flex: 1,
                                                            fit: FlexFit.tight,
                                                            child: Row(
                                                                children: <
                                                                    Widget>[
                                                                  Icon(Icons
                                                                      .remove_red_eye_outlined,
                                                                      color: Colors
                                                                          .grey,
                                                                      size: 14),
                                                                  Padding(
                                                                      padding: const EdgeInsets
                                                                          .fromLTRB(
                                                                          2, 0,
                                                                          0, 0),
                                                                      child: Text(
                                                                          snapshot.data['View'].toString(),
                                                                          style: TextStyle(
                                                                              fontFamily: 'Rubik',
                                                                              color: Colors
                                                                                  .grey))
                                                                  ),
                                                                ]
                                                            ),
                                                          ),
                                                          Flexible(
                                                              flex: 1,
                                                              fit: FlexFit
                                                                  .tight,
                                                              child: Row(
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .fromLTRB(
                                                                        0, 0, 0,
                                                                        0),
                                                                    child: Icon(
                                                                        Icons
                                                                            .thumb_up,
                                                                        color: Colors
                                                                            .grey,
                                                                        size: 14),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .fromLTRB(
                                                                        2, 0, 0,
                                                                        0),
                                                                    child: Text(
                                                                        snapshot.data['Favorite'].toString(),
                                                                        style: TextStyle(
                                                                            fontFamily: 'Rubik',
                                                                            color: Colors
                                                                                .grey)),
                                                                  )
                                                                ],
                                                              )
                                                          )
                                                        ]
                                                    )
                                                )
                                            )
                                          ]
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 0, 0, 0),
                                      child: Row(
                                        children: <Widget>[
                                          Text('Ingredients',
                                              style: TextStyle(
                                                  fontFamily: 'Rubik',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500)),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                175, 0, 0, 0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: const Color(
                                                        0xFFFF6240),
                                                    borderRadius: BorderRadius
                                                        .circular(15)),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(5.0, 2, 10, 2),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(Icons.add,
                                                          color: Colors.white
                                                      ),
                                                      Text('Grocery',
                                                          style: TextStyle(
                                                              fontFamily: 'Rubik',
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .white))
                                                    ],
                                                  ),
                                                )
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 0, 0),
                                        child: Row(
                                            children: <Widget>[
                                              Icon(Icons.add_circle_outline),
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(30, 0, 0, 0),
                                                  child: Text(snapshot.data['Ingredient'][0].toString(),
                                                      style: TextStyle(
                                                          fontFamily: 'Rubik')
                                                  )
                                              ),

                                            ]
                                        )
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 0, 0),
                                        child: Row(
                                            children: <Widget>[
                                              Icon(Icons.add_circle_outline),
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(20, 0, 0, 0),
                                                  child: Text(
                                                      snapshot.data['Ingredient'][1].toString(),
                                                      style: TextStyle(
                                                          fontFamily: 'Rubik')
                                                  )
                                              ),
                                            ]
                                        )
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 0, 0),
                                        child: Row(
                                            children: <Widget>[
                                              Icon(Icons.add_circle_outline),
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(20, 0, 0, 0),
                                                  child: Text(
                                                      snapshot.data['Ingredient'][2].toString(),
                                                      style: TextStyle(
                                                          fontFamily: 'Rubik')
                                                  )
                                              ),
                                            ]
                                        )
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 0, 0),
                                        child: Row(
                                            children: <Widget>[
                                              Icon(Icons.add_circle_outline),
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(20, 0, 0, 0),
                                                  child: Text(
                                                      snapshot.data['Ingredient'][3].toString(),
                                                      style: TextStyle(
                                                          fontFamily: 'Rubik')
                                                  )
                                              ),
                                            ]
                                        )
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 0, 0),
                                        child: Row(
                                            children: <Widget>[
                                              Icon(Icons.add_circle_outline),
                                              Expanded(
                                                  child: Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          20, 0, 0, 0),
                                                      child: Text(
                                                          snapshot.data['Ingredient'][4].toString(),
                                                          style: TextStyle(
                                                              fontFamily: 'Rubik')
                                                      )
                                                  )
                                              )
                                            ]
                                        )
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 0, 0),
                                        child: Row(
                                            children: <Widget>[
                                              Icon(Icons.add_circle_outline),
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(20, 0, 0, 0),
                                                  child: Text(
                                                      snapshot.data['Ingredient'][5].toString(),
                                                      style: TextStyle(
                                                          fontFamily: 'Rubik')
                                                  )
                                              ),
                                            ]
                                        )
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 0, 0),
                                        child: Row(
                                            children: <Widget>[
                                              Icon(Icons.add_circle_outline),
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(20, 0, 0, 0),
                                                  child: Text(
                                                      snapshot.data['Ingredient'][6].toString(),
                                                      style: TextStyle(
                                                          fontFamily: 'Rubik')
                                                  )
                                              ),
                                            ]
                                        )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 30, 0, 0),
                                      child: Text('Directions',
                                          style: TextStyle(fontFamily: 'Rubik',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 20, 0, 0),
                                        child: Row(
                                            children: <Widget>[
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black87),
                                                  child: Text('1',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Rubik',
                                                          fontSize: 16))
                                              ),
                                              Expanded(child:
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(20, 20, 0, 0),
                                                  child: Text(
                                                      snapshot.data['Direction'][0].toString(),
                                                      style: TextStyle(
                                                          fontFamily: 'Rubik')
                                                  )
                                              ),
                                              )
                                            ]
                                        )
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 20, 0, 0),
                                        child: Row(
                                            children: <Widget>[
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black87),
                                                  child: Text('2',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Rubik',
                                                          fontSize: 16))
                                              ),
                                              Expanded(
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(20, 0, 0, 0),
                                                    child: Text(
                                                        snapshot.data['Direction'][1].toString(),
                                                        style: TextStyle(
                                                            fontFamily: 'Rubik')
                                                    )
                                                ),
                                              )
                                            ]
                                        )
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 20, 0, 0),
                                        child: Row(
                                            children: <Widget>[
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black87),
                                                  child: Text('3',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Rubik',
                                                          fontSize: 16))
                                              ),
                                              Expanded(
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(20, 0, 20, 0),
                                                    child: Text(
                                                        snapshot.data['Direction'][2].toString(),
                                                        style: TextStyle(
                                                            fontFamily: 'Rubik')
                                                    )
                                                ),
                                              )
                                            ]
                                        )
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 20, 0, 0),
                                        child: Row(
                                            children: <Widget>[
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black87),
                                                  child: Text('4',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Rubik',
                                                          fontSize: 16))
                                              ),
                                              Expanded(
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(20, 0, 0, 0),
                                                    child: Text(
                                                        snapshot.data['Direction'][3].toString(),
                                                        style: TextStyle(
                                                            fontFamily: 'Rubik')
                                                    )
                                                ),
                                              )
                                            ]
                                        )
                                    ),


                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 20, 0, 0),
                                        child: Row(
                                            children: <Widget>[
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black87),
                                                  child: Text('5',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Rubik',
                                                          fontSize: 16))
                                              ),
                                              Expanded(
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(20, 0, 0, 0),
                                                    child: Text(
                                                        snapshot.data['Direction'][4].toString(),
                                                        style: TextStyle(
                                                            fontFamily: 'Rubik')
                                                    )
                                                ),
                                              )
                                            ]
                                        )
                                    ),












                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 20, 0, 0),
                                        child: Container(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width - 40,
                                          height: 60,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFFF6240),
                                              borderRadius: BorderRadius
                                                  .circular(15)),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              Icon(Icons.play_arrow,
                                                  size: 36,
                                                  color: Colors.white),
                                              Text('Step-by-step',
                                                  style: TextStyle(
                                                      fontFamily: 'Rubik',
                                                      fontSize: 16,
                                                      color: Colors.white))
                                            ],
                                          ),
                                        )
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 30)
                                    )
                                  ]
                              ),
                            ),
                          );
                        }
                    )
                  ],
                ),
              );
          },
        ));
  }
}

