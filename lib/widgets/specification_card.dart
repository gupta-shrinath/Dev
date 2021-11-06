import 'package:flutter/material.dart';

/// Renders a section card which contains details
///
/// requires [title] which is section title and
/// [content] which is the details of that section
/// [imageUrl] is a image displayed for the section
/// [imageText] is a text which is adjacent to the image
class SpecificationCard extends StatelessWidget {
  SpecificationCard(
      {Key? key,
      required this.title,
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
