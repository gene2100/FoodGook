import 'package:flutter/material.dart';
import 'package:foodgook/app/components/post_item.dart';
import 'package:foodgook/data.dart';

// import 'package:foodgook/views/feeds.dart';

class FeedsView extends StatefulWidget {
  @override
  _FeedsViewState createState() => _FeedsViewState();
}

class _FeedsViewState extends State<FeedsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          Map post = posts[index];
          return PostItem(
            img: post['img'],
            name: post['name'],
            dp: post['dp'], //profile pic
            time: post['time'],
            foodname: post['foodname'],
            description: post['description'],
            tag: post['tag'],
          );
        },
      ),
    );
  }
}
