import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostItem extends StatefulWidget {
  final String dp;
  final String name;
  final Timestamp time;
  final String img;
  final String foodname;
  final String description;
  final List tag;
  final int view;
  final int favorite;
  // final int index;

  PostItem({
    Key key,
    @required this.dp,
    @required this.name,
    @required this.time,
    @required this.img,
    @required this.foodname,
    @required this.description,
    @required this.tag,
    @required this.view,
    @required this.favorite,
  }) : super(key: key);
  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: EdgeInsets.symmetric(vertical: 5),
    //   child: InkWell(
    //     child: Column(
    //       children: <Widget>[
    //         ListTile(
    //           onTap: () => print('Move to profile'),
    //           leading: CircleAvatar(
    //             backgroundImage: AssetImage(
    //               "${widget.dp}",
    //             ),
    //           ),
    //           contentPadding: EdgeInsets.all(0),
    //           title: Text(
    //             "${widget.name}",
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           subtitle: Text(
    //             //from trailing
    //             "${widget.time}",
    //             style: TextStyle(
    //               fontWeight: FontWeight.w300,
    //               fontSize: 11,
    //             ),
    //           ),
    //           trailing: TextButton(
    //             child: Icon(Icons.bookmark_border),
    //             // onPressed: () => print('save'),
    //           ),

    //           // onTap: () => print('save'),
    //         ),
    //         Image.asset(
    //           "${widget.img}",
    //           height: 170,
    //           width: MediaQuery.of(context).size.width,
    //           fit: BoxFit.cover,
    //         ),
    //       ],
    //     ),
    //     onTap: () {},
    //   ),
    // );
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "${widget.dp}",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.name}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          timeago.format(DateTime.fromMicrosecondsSinceEpoch(widget.time.microsecondsSinceEpoch)),
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.more_horiz, size: 30, color: Colors.grey),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  "${widget.img}" != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            child: Image.network(
                              "${widget.img}",
                              height: 170,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  // SizedBox(height: 8.0),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.foodname}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.remove_red_eye_rounded,
                              color: Colors.grey),
                          SizedBox(width: 3),
                          Text(NumberFormat.compact().format(widget.view)),
                          SizedBox(width: 10),
                          Icon(Icons.favorite, color: Color(0XFFEE2B4A)),
                          SizedBox(width: 3),
                          Text('${widget.favorite}'),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Icon(Icons.favorite, color: Color(0XFFEE2B4A)),
                      //     SizedBox(width: 3),
                      //     Text("1k"),
                      //   ],
                      // ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.description}",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (var item in widget.tag)
                        Flexible(
                          child:
                          TextButton(
                            child: AutoSizeText(
                              '#'+item,
                              minFontSize: 8,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF5D6890),
                              ),
                            ),
                          ),
                        )],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
