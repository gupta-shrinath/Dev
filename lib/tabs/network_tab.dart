import 'package:dev/utils/android_specification.dart';
import 'package:dev/utils/system_information_builder.dart';
import 'package:dev/widgets/specification_card.dart';
import 'package:flutter/material.dart';

class Network extends StatelessWidget {
  const Network({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Wifi(),
        ],
      ),
    );
  }
}

class Wifi extends StatelessWidget {
  const Wifi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AndroidSpecification().getWifiNetworkSpecifications(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return SpecificationCard(
              title: 'WIFI',
              content: Column(
                children: systemInformationBuilder(snapshot.data as Map),
              ),
            );
          } else {
            return Center(
              child: Text('Failed to get the specs. Restart the app'),
            );
          }
        });
  }
}
