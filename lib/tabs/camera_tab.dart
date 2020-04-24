import 'package:flutter/material.dart';

class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        MainCamera(),
      ]),
    );
  }
}

class MainCamera extends StatefulWidget {
  @override
  _MainCameraState createState() => _MainCameraState();
}

class _MainCameraState extends State<MainCamera> {
  // Style Vars //
  final titleFontSize = 20.0;
  final contentFontSize = 16.0;
  static const padding = 20.0;

  List cameraInfoList = [
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
                'MAIN CAMERA',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: titleFontSize,
                ),
              ),
            )
          ]),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Image.asset(
                    'images/camera-icon.png',
                  ),
                ),
              ),
              Expanded(
                  child: Text(
                cameraInfoList[0],
                style: TextStyle(
                  color: Colors.green,
                  fontSize: titleFontSize,
                ),
              )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Text(
                    'Resolution',
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
                    cameraInfoList[1],
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
                    'Sensor Size',
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
                    cameraInfoList[2],
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
                    'Pixel Size',
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
                    cameraInfoList[3],
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
                    'Focal length',
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
                    cameraInfoList[4],
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
                    'Shutter speed',
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
                    cameraInfoList[5],
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
                    'ISO sensitivity range',
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
                    cameraInfoList[6],
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
