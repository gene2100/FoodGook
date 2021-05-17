import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodgook/widgets/post_item.dart';
import 'package:foodgook/data.dart';
import "dart:math";

// import 'package:foodgook/views/feeds.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;

List<Map> recipeResultAll = [];
String downloadURL;
String lastedUID;

Future<void> getData() async{
  recipeResultAll.clear();
  Map recipeFeedDetail;
  List<String> userUID;
  await _firestore.collection("User_Profile").doc(_auth.currentUser.uid).collection("Relation_Detail").doc('Following').get().then((docSnap){
    print(docSnap.data());
    userUID = docSnap['UserUID'].cast<String>();
    userUID.shuffle();
  });
  await _firestore.collection("Recipes").where('UserUID', whereIn: userUID).orderBy('postTime', descending: true).limit(10).get().then((collSnap){
    collSnap.docs.forEach((result){
      recipeFeedDetail = result.data();
      print(recipeFeedDetail['Recipe_Name']);
      recipeResultAll.add(recipeFeedDetail);
  });
});
    await Future.forEach(recipeResultAll, (element) async{
    await _firestore.collection("User_Profile").doc(element['UserUID']).get().then((userSnap){
       element['userName'] = userSnap.data()['Username'];
      element['userImageURL'] = userSnap.data()['ImageURL'];
    });
  });


}

Future<String> getDataCheck() async {
    if(lastedUID != _auth.currentUser.uid){
      recipeResultAll.clear();
      lastedUID = _auth.currentUser.uid;
    }
    if(recipeResultAll.isEmpty){
      print('...Getting data...');
      await getData();
    }
    if(recipeResultAll.isNotEmpty){
      print('Done');
      return 'Done';
    }
}



class FeedsView extends StatefulWidget {
  @override
  _FeedsViewState createState() => _FeedsViewState();
}

class _FeedsViewState extends State<FeedsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
      future: getDataCheck(),
      builder: (BuildContext context ,AsyncSnapshot snapshot){
        if(snapshot.data == 'Done')
          {
            return RefreshIndicator(
              onRefresh: () async{
                await getData();
                setState(() {
                });
              },
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: recipeResultAll.length,
                itemBuilder: (BuildContext context, int index) {
                  Map recipeResult = recipeResultAll[index];
                  return PostItem(
                    img: recipeResult['ImageURL'],
                    name: recipeResult['userName'],
                    dp: recipeResult['userImageURL'], //profile pic
                    time: recipeResult['postTime'],
                    foodname: recipeResult['Recipe_Name'],
                    description: recipeResult['Description'],
                    tag: recipeResult['Tag'],
                    view: recipeResult['View'],
                    favorite: recipeResult['Favorite'],
                  );
                },
              ),
            );
          }
        return SizedBox(
          child: CircularProgressIndicator(),
          width: 60,
          height: 60,
        );
      }
    ));
  }
}
