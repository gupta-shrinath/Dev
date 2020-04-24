import 'package:flutter/material.dart';

import '../device_info.dart';

class System extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Device(),
          SizedBox(
            height: 10.0,
          ),
          OperatingSystem()
        ],
      ),
    );
  }
}

class Device extends StatefulWidget {
  @override
  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  // Style Vars //
  final titleFontSize = 20.0;
  final contentFontSize = 16.0;
  static const padding = 20.0;

  List deviceInfoList = [
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

  DeviceInfo mDeviceInfo = DeviceInfo();

  @override
  void initState() {
    super.initState();
    mDeviceInfo.initPlatformState().then((value) {
      setState(() {
        deviceInfoList[0] = mDeviceInfo.getDeviceData('manufacturer');
        deviceInfoList[1] = mDeviceInfo.getDeviceData('model');
        deviceInfoList[2] = mDeviceInfo.getDeviceData('product');
        deviceInfoList[3] = mDeviceInfo.getDeviceData('device');
        deviceInfoList[4] = mDeviceInfo.getDeviceData('board');
        deviceInfoList[5] = mDeviceInfo.getDeviceData('manufacturer');
        deviceInfoList[6] = mDeviceInfo.getDeviceData('bootloader');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: padding),
                child: Text(
                  'DEVICE',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: titleFontSize,
                  ),
                ),
              )
            ],
          ), // Device
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Image.asset(
                    'images/android-device-icon.png',
                  ),
                ),
              ), // Device Image
              Expanded(
                child: Text(
                  deviceInfoList[0] + " " + deviceInfoList[1],
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: titleFontSize,
                  ),
                ),
              ), // Brand
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
                    'Model',
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
                    deviceInfoList[1],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: contentFontSize,
                    ),
                  ),
                ),
              ),
            ],
          ), // Model
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Text(
                    'Product',
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
                    deviceInfoList[2],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: contentFontSize,
                    ),
                  ),
                ),
              ),
            ],
          ), // Product
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Text(
                    'Device',
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
                    deviceInfoList[3],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: contentFontSize,
                    ),
                  ),
                ),
              ),
            ],
          ), // Device
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Text(
                    'Board',
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
                    deviceInfoList[4],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: contentFontSize,
                    ),
                  ),
                ),
              ),
            ],
          ), // Board
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Text(
                    'Manufacturer',
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
                    deviceInfoList[5],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: contentFontSize,
                    ),
                  ),
                ),
              ),
            ],
          ), // Manufacturer
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Text(
                    'Bootloader',
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
                    deviceInfoList[6],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: contentFontSize,
                    ),
                  ),
                ),
              ),
            ],
          ), // Bootloader
        ],
      ),
    );
  }
}

class OperatingSystem extends StatefulWidget {
  @override
  _OperatingSystemState createState() => _OperatingSystemState();
}

class _OperatingSystemState extends State<OperatingSystem> {
  // Style Vars //
  final titleFontSize = 20.0;
  final contentFontSize = 16.0;
  static const padding = 20.0;

  List operatingSystemInfoList = [
    'Loading',
    'Loading',
    'Loading',
    'Loading',
    'Loading',
    'Loading'
  ];

  var mDeviceInfo = DeviceInfo();

  @override
  void initState() {
    super.initState();
    mDeviceInfo.initPlatformState().then((value) {
      setState(() {
        operatingSystemInfoList[0] =
            mDeviceInfo.getDeviceData('version.release');
        operatingSystemInfoList[1] =
            mDeviceInfo.getDeviceData('version.sdkInt');
        operatingSystemInfoList[2] =
            mDeviceInfo.getDeviceData('version.securityPatch');
        operatingSystemInfoList[3] = mDeviceInfo.getDeviceData('fingerprint');
        operatingSystemInfoList[4] = mDeviceInfo.getDeviceData('host');
        operatingSystemInfoList[5] = mDeviceInfo.getDeviceData('androidId');
      });
    });
  } // Device Info //

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: padding),
                child: Text(
                  'OPERATING SYSTEM',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: titleFontSize,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
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
                    'Android Version',
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
                    operatingSystemInfoList[0],
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
                    'API',
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
                    operatingSystemInfoList[1],
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
                    'Security Patch',
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
                    operatingSystemInfoList[2],
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
                    'Fingerprint',
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
                    operatingSystemInfoList[3],
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
                    'Host',
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
                    operatingSystemInfoList[4],
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
                    'Android Id',
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
                    operatingSystemInfoList[5],
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
      ),
    );
  }
}
