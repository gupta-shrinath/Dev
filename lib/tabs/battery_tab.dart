import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:dev/utils/platform_specification.dart';
import 'package:dev/widgets/system_information_builder.dart';
import 'package:dev/widgets/specification_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeviceBattery extends StatelessWidget {
  // Style Vars //
  final titleFontSize = 20.0;
  final contentFontSize = 16.0;
  static const padding = 20.0;

  const DeviceBattery({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var stream = BatteryInfoPlugin().androidBatteryInfoStream;
    return Column(
      children: [
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: padding, vertical: padding),
              child: Text(
                'STATUS',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: titleFontSize,
                ),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: padding),
              child: FutureBuilder<AndroidBatteryInfo?>(
                future: BatteryInfoPlugin().androidBatteryInfo,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const CircularProgressIndicator.adaptive();
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    AndroidBatteryInfo? _androidInfo = snapshot.data;
                    return Text(
                      _androidInfo!.batteryLevel.toString() + '%',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                      ),
                    );
                  } else {
                    return const Text(
                      '%',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            StreamBuilder(
                stream: stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    AndroidBatteryInfo? _androidBatteryInfo =
                        snapshot.data as AndroidBatteryInfo?;
                    return Column(
                      children: [
                        Text(
                          _androidBatteryInfo!.chargingStatus
                              .toString()
                              .replaceFirst("ChargingStatus.", ""),
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          'Current ' +
                              (_androidBatteryInfo.currentNow! / 1000)
                                  .toStringAsFixed(0) +
                              ' mA',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ],
        ),
        StreamBuilder(
          stream: PlatformSpecification.getInstance()
              .getBatterySpecifications(stream),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SpecificationCard(
                title: 'INFORMATION',
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
        ),
      ],
    );
  }
}
