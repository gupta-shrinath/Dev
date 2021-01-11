import 'package:battery_info/battery_info_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    '%',
    'Loading',
    'Loading',
    'Loading',
    'Loading',
    'Loading',
    'Loading',
    'Loading',
    'Loading'
  ];

  void getBatteryLevel() async {
    String _batteryLevel =
        (await BatteryInfoPlugin().androidBatteryInfo).batteryLevel.toString();
    setState(() {
      batteryInfoList[0] = _batteryLevel + "%";
    });
  }

  void getChargingStatus() async {
    String _chargingStatus = (await BatteryInfoPlugin().androidBatteryInfo)
        .chargingStatus
        .toString()
        .replaceFirst("ChargingStatus.", "");
    setState(() {
      batteryInfoList[1] = _chargingStatus;
    });
  }

  void getBatteryCurrent() async {
    dynamic _batteryCurrent =
        (await BatteryInfoPlugin().androidBatteryInfo).currentNow;
    print(_batteryCurrent);
    _batteryCurrent = (_batteryCurrent / 1000).toStringAsFixed(0);

    setState(() {
      if (batteryInfoList[1] == "Discharging") {
        batteryInfoList[2] = "-" + _batteryCurrent + " mA";
      } else {
        batteryInfoList[2] = _batteryCurrent + " mA";
      }
    });
  }

  void getBatteryTemp() async {
    String _batteryTemp =
        (await BatteryInfoPlugin().androidBatteryInfo).temperature.toString();
    setState(() {
      batteryInfoList[3] = _batteryTemp + "°C";
    });
  }

  void getBatteryTech() async {
    String _batteryTech =
        (await BatteryInfoPlugin().androidBatteryInfo).technology;
    setState(() {
      batteryInfoList[4] = _batteryTech;
    });
  }

  void getBatteryHealth() async {
    String _batteryHealth =
        (await BatteryInfoPlugin().androidBatteryInfo).health;
    setState(() {
      switch (_batteryHealth) {
        case 'heath_good':
          batteryInfoList[5] = "Good";
          break;
        case 'dead':
          batteryInfoList[5] = "Dead";
          break;
        case 'over_heat':
          batteryInfoList[5] = "Over Heat";
          break;
        case 'over_voltage':
          batteryInfoList[5] = "Over Voltage";
          break;
        case 'cold':
          batteryInfoList[5] = "Cold";
          break;
        default:
          batteryInfoList[5] = "Failure";
          break;
      }
    });
  }

  void getBatteryVoltage() async {
    dynamic _batteryVoltage =
        (await BatteryInfoPlugin().androidBatteryInfo).voltage;
    _batteryVoltage = (_batteryVoltage / 1000).toStringAsFixed(2);
    setState(() {
      batteryInfoList[6] = _batteryVoltage + " V";
    });
  }

  void getBatteryCapacity() async {
    String _batteryCapacity = (await BatteryInfoPlugin().androidBatteryInfo)
        .chargeTimeRemaining
        .toString();
    setState(() {
      batteryInfoList[7] = _batteryCapacity;
    });
  }

  @override
  void initState() {
    super.initState();
    getBatteryLevel();
    getChargingStatus();
    getBatteryCurrent();
    getBatteryTemp();
    getBatteryTech();
    getBatteryHealth();
    getBatteryVoltage();
    getBatteryCapacity();
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
                batteryInfoList[0],
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
                  batteryInfoList[1],
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  'Current ' + batteryInfoList[2],
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
                  batteryInfoList[6],
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
                  batteryInfoList[7],
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
}
