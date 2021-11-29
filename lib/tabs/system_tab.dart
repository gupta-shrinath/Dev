import 'package:dev/utils/android/android_specification.dart';
import 'package:dev/utils/platform_specification.dart';
import 'package:dev/widgets/specification_card.dart';
import 'package:dev/widgets/system_information_builder.dart';
import 'package:flutter/material.dart';

class System extends StatelessWidget {
  const System({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const <Widget>[
          Device(),
          OperatingSystem(),
        ],
      ),
    );
  }
}

class Device extends StatelessWidget {
  const Device({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PlatformSpecification.getInstance().getDeviceSpecifications(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return SpecificationCard(
            title: 'DEVICE',
            content: Column(
              children: systemInformationBuilder(snapshot.data as Map),
            ),
            imageUrl: 'images/android-device-icon.png',
          );
        }
        return const Center(
          child: Text('Failed to get the specs. Restart the app'),
        );
      },
    );
  }
}

class OperatingSystem extends StatefulWidget {
  const OperatingSystem({Key? key}) : super(key: key);
  @override
  _OperatingSystemState createState() => _OperatingSystemState();
}

class _OperatingSystemState extends State<OperatingSystem> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AndroidSpecification().getOperatingSystemSpecifications(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return SpecificationCard(
            title: 'OPERATING SYSTEM',
            content: Column(
              children: systemInformationBuilder(snapshot.data as Map),
            ),
          );
        } else {
          return const Center(
            child: Text('Failed to get the specs. Restart the app'),
          );
        }
      },
    );
  }
}
