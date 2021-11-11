import 'package:flutter/material.dart';

/// Renders key values from map into rows
///
/// keys on the left side and values on the right
/// text color for both are white
List<Widget> systemInformationBuilder(map) {
  List<Widget> specInfo = [];
  for (MapEntry spec in map.entries) {
    print(spec.toString());
    specInfo.add(Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                spec.key,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                spec.value.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
  return specInfo;
}
