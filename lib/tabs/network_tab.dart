import 'package:dev/utils/platform_specification.dart';
import 'package:dev/widgets/system_information_builder.dart';
import 'package:dev/widgets/specification_card.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Network extends StatelessWidget {
  const Network({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Wifi(),
        ],
      ),
    );
  }
}

class Wifi extends StatefulWidget {
  const Wifi({Key? key}) : super(key: key);

  @override
  State<Wifi> createState() => _WifiState();
}

class _WifiState extends State<Wifi> {
  @override
  Widget build(BuildContext context) {
    requestLocationPermission(context);
    return FutureBuilder(
        future:
            PlatformSpecification.getInstance().getWifiNetworkSpecifications(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
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
            return const Center(
              child: Text('Failed to get the specs. Restart the app'),
            );
          }
        });
  }

  void requestLocationPermission(BuildContext context) async {
    var locationPermissionStatus = await Permission.locationWhenInUse.status;
    if (!locationPermissionStatus.isGranted) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Location permission'),
                content: const Text(
                    'Dev requires location permission to show Wifi name'),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      await Permission.locationWhenInUse.request();
                      setState(() {});
                    },
                  ),
                ],
              ));
    }
  }
}
