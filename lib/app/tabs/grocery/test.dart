// import 'package:flutter/material.dart';
// import 'package:flutter_expansion_tile_demo/Constants/Constants.dart';
// import 'package:flutter_expansion_tile_demo/model/month_model.dart';

// class ExpansionTileDemo extends StatefulWidget {
//   @override
//   _ExpansionTileDemoState createState() => _ExpansionTileDemoState();
// }

// class _ExpansionTileDemoState extends State<ExpansionTileDemo> {
//   List<MonthModel> monthModel;

//   @override
//   void initState() {
//     monthModel = Constants.getMonthModel();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Expansion Tile Demo'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 0.0),
//         child: ListView.builder(
//           scrollDirection: Axis.vertical,
//           shrinkWrap: true,
//           physics: BouncingScrollPhysics(),
//           itemCount: monthModel.length,
//           itemBuilder: (BuildContext context, int index) {
//             return _buildPlayerModelList(monthModel[index]);
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildPlayerModelList(MonthModel items) {
//     return Card(
//       child: ExpansionTile(
//         title: Text(
//           items.playerName,
//           style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
//         ),
//         children: <Widget>[
//           ListTile(
//             title: Text(
//               items.description,
//               style: TextStyle(fontWeight: FontWeight.w700),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
