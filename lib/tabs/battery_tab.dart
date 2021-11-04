import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeviceBattery extends StatefulWidget {
  @override
  _DeviceBatteryState createState() => _DeviceBatteryState();
}

class _DeviceBatteryState extends State<DeviceBattery> {
  // Style Vars //
  final titleFontSize = 20.0;
  final contentFontSize = 16.0;
  static const padding = 20.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: padding, vertical: padding),
              child: Text(
                'STATUS',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: titleFontSize,
                ),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: FutureBuilder(
                future: Battery().batteryLevel,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return CircularProgressIndicator.adaptive();
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Text(
                      snapshot.data.toString() + '%',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                      ),
                    );
                  } else {
                    return Text(
                      '%',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              children: <Widget>[
                StreamBuilder<BatteryState>(
                    stream: Battery().onBatteryStateChanged,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data
                              .toString()
                              .replaceAll('BatteryState.', '')
                              .toUpperCase(),
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
                Text(
                  'Current ' + ' b',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            // FutureBuilder(
            //     future:
            //         AndroidSpecification().getOperatingSystemSpecifications(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState != ConnectionState.done) {
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       } else if (snapshot.connectionState == ConnectionState.done &&
            //           snapshot.hasData) {
            //         return SpecificationCard(
            //           title: 'STATUS',
            //           content: Column(
            //             children: buildWidgetsFromDeviceSpecs(
            //                 deviceSpecs: snapshot.data as Map),
            //           ),
            //         );
            //       } else {
            //         return Center(
            //           child: Text('Failed to get the specs. Restart the app'),
            //         );
            //       }
            //     }),
          ],
        ),
      ],
    );
  }
}
// return Column(
//   children: <Widget>[
//     Row(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.symmetric(
//               horizontal: padding, vertical: padding),
//           child: Text(
//             'STATUS',
//             style: TextStyle(
//               color: Colors.green,
//               fontSize: titleFontSize,
//             ),
//           ),
//         )
//       ],
//     ),
//     Row(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: padding),
//           child: Text(
//             '',
//             style: TextStyle(
//               color: Colors.green,
//               fontSize: 50.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 20.0,
//         ),
//         Column(
//           children: <Widget>[
//             Text(
//               '',
//               style: TextStyle(
//                 color: Colors.green,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18.0,
//               ),
//             ),
//             Text(
//               'Current ',
//               style: TextStyle(
//                 color: Colors.green,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18.0,
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//     Row(children: <Widget>[
//       Padding(
//         padding: const EdgeInsets.only(left: padding, top: padding),
//         child: Text(
//           'INFORMATION',
//           style: TextStyle(
//             color: Colors.green,
//             fontSize: titleFontSize,
//           ),
//         ),
//       )
//     ]),
//     SizedBox(
//       height: 20.0,
//     ),
//     Row(
//       children: <Widget>[
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: padding),
//             child: Text(
//               'Temperature',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: titleFontSize,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(5.0),
//             child: Text(
//               '',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: contentFontSize,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 20.0,
//     ),
//     Row(
//       children: <Widget>[
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: padding),
//             child: Text(
//               'Technology',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: titleFontSize,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(5.0),
//             child: Text(
//               '',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: contentFontSize,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 20.0,
//     ),
//     Row(
//       children: <Widget>[
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: padding),
//             child: Text(
//               'Health',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: titleFontSize,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(5.0),
//             child: Text(
//               '',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: contentFontSize,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 20.0,
//     ),
//     Row(
//       children: <Widget>[
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: padding),
//             child: Text(
//               'Voltage',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: titleFontSize,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(5.0),
//             child: Text(
//               '',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: contentFontSize,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//     SizedBox(
//       height: 20.0,
//     ),
//     Row(
//       children: <Widget>[
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: padding),
//             child: Text(
//               'Capacity (reported by system)',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: titleFontSize,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(5.0),
//             child: Text(
//               '',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: contentFontSize,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ],
// );
