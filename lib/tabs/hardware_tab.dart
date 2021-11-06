import 'package:dev/utils/android_specification.dart';
import 'package:dev/utils/system_information_builder.dart';
import 'package:dev/widgets/specification_card.dart';
import 'package:flutter/material.dart';

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

class Processor extends StatelessWidget {
  const Processor({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AndroidSpecification().getProcessorSpecifications(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return SpecificationCard(
            title: 'PROCESSOR',
            content: Column(
              children: systemInformationBuilder(snapshot.data as Map),
            ),
            imageText: 'Processor',
            imageUrl: 'images/processor-icon.png',
          );
        } else {
          return Center(
            child: Text('Failed to get the specs. Restart the app'),
          );
        }
      },
    );
  }
}
