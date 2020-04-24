import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Battery extends StatefulWidget {
  @override
  _BatteryState createState() => _BatteryState();
}

class _BatteryState extends State<Battery> {
  // Style Vars //
  final titleFontSize = 20.0;
  final contentFontSize = 16.0;
  static const padding = 20.0;

  List batteryInfoList = [
    'Loading',
    'Loading',
    'Loading',
    'Loading',
    'Loading',
    'Loading',
    'Loading',
    'Loading',
    'Loading'
  ];
  String batteryLevel = 'Loading';
  static const platform = const MethodChannel('personal.droid.dev/battery');

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
              child: Text(
                '72 %',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              children: <Widget>[
                Text(
                  'Discharging',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  'Current 298 mA',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: padding, top: padding),
            child: Text(
              'INFORMATION',
              style: TextStyle(
                color: Colors.green,
                fontSize: titleFontSize,
              ),
            ),
          )
        ]),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Text(
                  'Temperature',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  batteryInfoList[1],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: contentFontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Text(
                  'Technology',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  batteryInfoList[2],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: contentFontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Text(
                  'Health',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  batteryInfoList[3],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: contentFontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Text(
                  'Voltage',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  batteryInfoList[4],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: contentFontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Text(
                  'Capacity (reported by system)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  batteryInfoList[5],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: contentFontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _getBatteryLevel() async {
    try {
      final int battery = await platform.invokeMethod('getBatteryLevel');
      setState(() {
        batteryLevel = battery.toString();
      });
    } on PlatformException {
      batteryLevel = "Failed to get battery level";
    }
  }
}
