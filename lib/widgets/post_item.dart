import 'package:flutter/material.dart';

class PostItem extends StatefulWidget {
  final String dp;
  final String name;
  final String time;
  final String img;
  final String foodname;
  final String description;
  final String tag;
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
                      backgroundImage: AssetImage(
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
                          "${widget.time}",
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
                            child: Image.asset(
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
                          Text("14.1k"),
                          SizedBox(width: 10),
                          Icon(Icons.favorite, color: Color(0XFFEE2B4A)),
                          SizedBox(width: 3),
                          Text("259"),
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
                    children: [
                      Text(
                        "${widget.tag}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF5D6890),
                        ),
                      ),
                    ],
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
