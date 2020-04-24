import 'dart:io';

import 'package:flutter/material.dart';
import 'package:system_info/system_info.dart';

import '../device_info.dart';

class Hardware extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Processor(),
        ],
      ),
    );
  }
}

class Processor extends StatefulWidget {
  @override
  _ProcessorState createState() => _ProcessorState();
}

class _ProcessorState extends State<Processor> {
  // Style Vars //
  final titleFontSize = 20.0;
  final contentFontSize = 16.0;
  static const padding = 20.0;

  List processorInfoList = [
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

  var mDeviceInfo = DeviceInfo();

  @override
  void initState() {
    super.initState();
    final processors = SysInfo.processors;
    print('Number of processors    : ${processors.length}');
    for (var processor in processors) {
      print('  Architecture          : ${processor.architecture}');
      print('  Name                  : ${processor.name}');
      print('  Socket                : ${processor.socket}');
      print('  Vendor                : ${processor.vendor}');
    }
    mDeviceInfo.initPlatformState().then((value) {
      setState(() {
        processorInfoList[0] = mDeviceInfo.getDeviceData('hardware');
        processorInfoList[1] = mDeviceInfo.getDeviceData('board');
        processorInfoList[4] = Platform.numberOfProcessors.toString();
        processorInfoList[6] = mDeviceInfo.getDeviceData('supported32BitAbis');
        processorInfoList[7] = mDeviceInfo.getDeviceData('supported64BitAbis');
        processorInfoList[8] = mDeviceInfo.getDeviceData('supportedAbis');
      });
    });
  } // Device Info //

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: padding),
              child: Text(
                'PROCESSOR',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: titleFontSize,
                ),
              ),
            )
          ]),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Image.asset(
                    'images/processor-icon.png',
                  ),
                ),
              ),
              Expanded(
                  child: Text(
                processorInfoList[0],
                style: TextStyle(
                  color: Colors.green,
                  fontSize: titleFontSize,
                ),
              )),
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
                    'Hardware',
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
                    processorInfoList[1],
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
                    'CPU',
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
                    processorInfoList[2],
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
                    'Process',
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
                    processorInfoList[3],
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
                    'Cores',
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
                    processorInfoList[4],
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
                    'Frequencies',
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
                    processorInfoList[5],
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
                    'Support 32 bit ABIs',
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
                    processorInfoList[6],
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
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Text(
                    'Support 64 bit ABIs',
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
                    processorInfoList[7],
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
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Text(
                    'Supported ABIs',
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
                    processorInfoList[8],
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
