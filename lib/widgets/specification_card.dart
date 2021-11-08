import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Renders a section card which contains details
///
/// requires [title] which is section title and
/// [content] which is the widgets containing details of that section
/// [imageUrl] is a image displayed for the section
class SpecificationCard extends StatelessWidget {
  SpecificationCard(
      {Key? key,
      required this.title,
      required this.content,
      this.imageUrl,
      this.padding})
      : super(key: key);
  final String title;
  final String? imageUrl;
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
                  title,
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
            Container(
              child: imageUrl != null
                  ? Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image.asset(
                          imageUrl ?? '',
                          height: 64,
                          width: 64,
                          errorBuilder: (context, object, stack) {
                            return Container();
                          },
                        ),
                      ),
                    ])
                  : null,
            ),
            content,
          ],
        ),
      ),
    );
  }
}
