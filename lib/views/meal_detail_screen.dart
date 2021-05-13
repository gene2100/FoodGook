import 'package:flutter/material.dart';
import 'package:foodgook/views/recipes_view.dart';
import 'package:foodgook/models/popularbook_model.dart';


class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';


  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      body: Stack(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                'assets/images/meals/steak.jpg',
                fit: BoxFit.cover,
              ),
        ),
              DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.6,
                maxChildSize: 1,
                builder: (context,scrollController){
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0)),
                        Row(
                          children: <Widget>[
                      Flexible(
                        flex : 10,
                        fit: FlexFit.tight,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                          child: Text('Garlic Butter Steak',
                              style: TextStyle(fontWeight : FontWeight.bold, fontSize: 22, fontFamily: 'Rubik',
                              ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Flexible(
                        flex : 2,
                       child: Icon(Icons.av_timer,
                         color: Colors.blue,
                           size: 18,)
                            ),
                            Text ('2 Hours',
                                style: TextStyle(fontWeight : FontWeight.bold, fontSize: 15)),
                            Icon(Icons.signal_cellular_alt_rounded,
                            color: Colors.green,
                            size: 18,),
                            Text('Easy',
                                style: TextStyle(fontWeight : FontWeight.bold, fontSize: 15)),
                      ]
                    ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                        child: Text('#Meat',
                            style: TextStyle(fontSize: 15,
                            color: const Color(0xFF00008B))),
                      ),
                       Padding(
                         padding: const EdgeInsets.all(20),
                         child: Text('“Butter can make any of your favorite steak recipes more delicious by using it as a basting tool when cooking or to impart flavor once cooked.”',
                         style: TextStyle(fontFamily: 'Rubik'))
                       ),
                       Padding(padding: const EdgeInsets.fromLTRB(20.0,0,20,20),
                         child: Container(decoration: BoxDecoration(
                             color: const Color(0x1BF9D758),
                             borderRadius: BorderRadius.circular(15)),
                           child: Row(
                             children: <Widget>[
                               Flexible(
                                 flex : 2,
                                 child: Padding(
                                   padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                                   child: Icon(Icons.star,
                                   color: const Color(0xFFFF6240)),
                                 ),
                               ),
                               Text('4.0',
                                   style: TextStyle(fontFamily: 'Rubik', fontWeight : FontWeight.w500, fontSize: 20)
                               ),
                               Flexible(
                                 flex : 7,
                                 fit: FlexFit.tight,
                                   child: Padding(padding: const EdgeInsets.fromLTRB(20.0,10,0,10),
                                      child :Text('0 people\nTry this recipe',
                                    style: TextStyle(fontFamily: 'Rubik', color: Colors.grey))
                               ),
                               ),
                               Flexible(
                                 flex : 1,
                                  child: Padding(padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
                                   child :Icon(Icons.arrow_forward_ios,
                                   color: Colors.grey)
                                )
                               )
                             ],
                           )
                         )
                       ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0,0,0,30),
                        child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                  backgroundColor: Color(0xffE6E6E6),
                                    radius: 20,
                                      child: Icon(
                                      Icons.person,
                                      color: Color(0xffCCCCCC),
                                )
                                ),
                              Flexible(
                                flex: 2,
                                fit: FlexFit.loose,
                                child :Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
                                  child: RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(text: 'TestUser\n', style: TextStyle(fontWeight : FontWeight.bold , fontFamily: 'Rubik')),
                                        TextSpan(text: '1 Recipe',style: TextStyle(fontFamily: 'Rubik', color: Colors.grey)),
                                      ]
                                    )
                                  )
                                )
                              ),
                              Flexible(
                                  flex: 2,
                                  fit: FlexFit.tight,
                                  child :Padding(
                                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                                child: Text('Follow',
                                style: TextStyle(fontFamily: 'Rubik',color: Colors.indigo) ),
                              )
                              ),
                              Flexible(
                                flex: 4,
                                  fit: FlexFit.tight,
                               child :Padding(
                                 padding: const EdgeInsets.fromLTRB(40,0,10,0),
                                 child: Row(
                                   children: <Widget>[
                                     Flexible(
                                       flex: 1,
                                      fit : FlexFit.tight,
                                     child: Row(
                                         children: <Widget>[
                                     Icon(Icons.remove_red_eye_outlined,
                                     color: Colors.grey,
                                     size: 14),
                                      Padding(
                                     padding: const EdgeInsets.fromLTRB(2,0,0,0),
                                     child: Text('2',
                                         style: TextStyle(fontFamily: 'Rubik', color: Colors.grey) )
                                      ),
                                      ]
                                     ),
                                     ),
                                     Flexible(
                                       flex: 1,
                                         fit : FlexFit.tight,
                                     child: Row(
                                       children: <Widget>[
                                         Padding(
                                           padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                           child: Icon(Icons.thumb_up,
                                               color: Colors.grey,
                                               size: 14),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.fromLTRB(2,0,0,0),
                                           child: Text('0',
                                               style: TextStyle(fontFamily: 'Rubik', color: Colors.grey) ),
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
                         padding: const EdgeInsets.fromLTRB(20.0,0,0,0),
                         child: Row(
                           children: <Widget>[
                              Text('Ingredients',
                              style: TextStyle(fontFamily: 'Rubik' , fontSize: 20, fontWeight: FontWeight.w500)),
                             Padding(
                               padding: const EdgeInsets.fromLTRB(175,0,0,0),
                               child: Container(
                                 decoration: BoxDecoration(
                                     color: const Color(0xFFFF6240),
                                     borderRadius: BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(5.0,2,10,2),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.add,
                                              color: Colors.white
                                            ),
                                            Text('Grocery',
                                            style: TextStyle(fontFamily: 'Rubik', fontSize: 16, color: Colors.white))
                                          ],
                                        ),
                                      )
                               ),
                             )
                           ],
                         ),
                       ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child : Row(
                            children: <Widget>[
                              Icon(Icons.add_circle_outline),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child : Text('2 tablespoons butter, softened, divided',
                                      style : TextStyle(fontFamily: 'Rubik')
                              )
                              ),

                                      ]
                          )
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child : Row(
                                  children: <Widget>[
                                    Icon(Icons.add_circle_outline),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child : Text('1 teaspoon minced fresh parsley',
                                            style : TextStyle(fontFamily: 'Rubik')
                                        )
                                    ),
                                  ]
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child : Row(
                                  children: <Widget>[
                                    Icon(Icons.add_circle_outline),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child : Text('1/2 teaspoon minced garlic',
                                            style : TextStyle(fontFamily: 'Rubik')
                                        )
                                    ),
                                  ]
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child : Row(
                                  children: <Widget>[
                                    Icon(Icons.add_circle_outline),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child : Text('1/4 teaspoon reduced-sodium soy sauce',
                                            style : TextStyle(fontFamily: 'Rubik')
                                        )
                                    ),
                                  ]
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                                child:  Row(
                                  children: <Widget>[
                                    Icon(Icons.add_circle_outline),
                                    Expanded(
                                     child : Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                            child : Text('1 beef flat iron steak or boneless top sirloin steak (3/4 pound)',
                                              style : TextStyle(fontFamily: 'Rubik')
                                        )
                                        )
                                    )
                                  ]
                                )
                              ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child : Row(
                                  children: <Widget>[
                                    Icon(Icons.add_circle_outline),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child : Text('1/8 teaspoon salt',
                                            style : TextStyle(fontFamily: 'Rubik')
                                        )
                                    ),
                                  ]
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child : Row(
                                  children: <Widget>[
                                    Icon(Icons.add_circle_outline),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child : Text('1/8 teaspoon pepper',
                                            style : TextStyle(fontFamily: 'Rubik')
                                        )
                                    ),
                                  ]
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                              child : Text('Directions',
                              style: TextStyle(fontFamily: 'Rubik' , fontSize: 20, fontWeight: FontWeight.w500)),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child : Row(
                                  children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black87),
                                        child : Text('1' , style: TextStyle(color: Colors.white,fontFamily: 'Rubik',fontSize: 16))
                                    ),
                                    Expanded(child:
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child : Text('Mix 1 tablespoon butter, parsley, garlic and soy sauce.',
                                            style : TextStyle(fontFamily: 'Rubik')
                                        )
                                    ),
                                    )
                                  ]
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child : Row(
                                  children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black87),
                                        child : Text('2' , style: TextStyle(color: Colors.white,fontFamily: 'Rubik',fontSize: 16))
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child : Text('Sprinkle steak with salt and pepper.',
                                            style : TextStyle(fontFamily: 'Rubik')
                                        )
                                    ),
                                  ]
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child : Row(
                                  children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black87),
                                        child : Text('3' , style: TextStyle(color: Colors.white,fontFamily: 'Rubik',fontSize: 16))
                                    ),
                                    Expanded(
                                        child: Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        child : Text('In a large skillet, heat remaining butter over medium heat.',
                                            style : TextStyle(fontFamily: 'Rubik')
                                        )
                                    ),
                                    )
                                  ]
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child : Row(
                                  children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black87),
                                        child : Text('4' , style: TextStyle(color: Colors.white,fontFamily: 'Rubik',fontSize: 16))
                                    ),
                                    Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                          child : Text('Add steak; cook until meat reaches desired doneness (for medium-rare, 135°; medium, 140°; medium-well, 145°), 4-7 mins per side.',
                                              style : TextStyle(fontFamily: 'Rubik')
                                          )
                                      ),
                                    )
                                  ]
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child : Row(
                                  children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black87),
                                        child : Text('5' , style: TextStyle(color: Colors.white,fontFamily: 'Rubik',fontSize: 16))
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child : Text('Serve with garlic butter and enjoy !',
                                            style : TextStyle(fontFamily: 'Rubik')
                                        )
                                    ),
                                  ]
                              )
                          ),
                          Padding(
                            padding : const EdgeInsets.fromLTRB(20, 20, 0, 0),
                                child : Container(
                                  width: MediaQuery.of(context).size.width-40,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFF6240),
                                      borderRadius: BorderRadius.circular(15)),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(Icons.play_arrow,
                                            size: 36,
                                            color: Colors.white),
                                            Text('Step-by-step',
                                            style: TextStyle(fontFamily: 'Rubik',fontSize: 16, color: Colors.white))
                                          ],
                                        ),
                          )
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30)
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
  }
}
