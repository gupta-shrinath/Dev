import 'package:flutter/material.dart';

class SpecificationCard extends StatelessWidget {
  SpecificationCard(
      {Key? key,
      @required this.title,
      required this.content,
      this.imageUrl,
      this.imageText,
      this.padding})
      : super(key: key);
  final String? title, imageText, imageUrl;
  final Widget content;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Colors.grey.shade800,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  title!,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: 10.0,
            ),
            Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  right: padding ?? 50.0,
                ),
                child: Image.asset(
                  imageUrl ?? '',
                  height: 150,
                  width: 150,
                  errorBuilder: (context, object, stack) {
                    return Container();
                  },
                ),
              ),
              Expanded(
                child: Text(
                  imageText ?? '',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
              ),
            ]),
            content,
          ],
        ),
      ),
    );
  }
}

List<Widget> buildWidgetsFromDeviceSpecs({required Map deviceSpecs}) {
  List<Widget> specInfo = [];
  for (MapEntry spec in deviceSpecs.entries) {
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
