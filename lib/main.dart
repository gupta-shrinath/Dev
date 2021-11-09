import 'package:dev/tabs/battery_tab.dart';
import 'package:dev/tabs/network_tab.dart';
import 'package:dev/tabs/system_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tabs/hardware_tab.dart';

void main() => runApp(
      DevCheck(),
    );

class DevCheck extends StatefulWidget {
  @override
  _DevCheckState createState() => _DevCheckState();
}

class _DevCheckState extends State<DevCheck>
    with SingleTickerProviderStateMixin {
  late TabController mTabController;

  @override
  void initState() {
    super.initState();
    mTabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    mTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'DevCheck',
          ),
          backgroundColor: Colors.green,
          bottom: TabBar(
            indicatorColor: Colors.green,
            labelColor: Colors.white,
            tabs: <Tab>[
              Tab(
                text: 'Hardware',
              ),
              Tab(
                text: 'System',
              ),
              Tab(
                text: 'Battery',
              ),
              Tab(
                text: 'Network',
              ),
            ],
            controller: mTabController,
          ),
        ),
        //backgroundColor: Colors.grey.shade800,
        body: TabBarView(
          controller: mTabController,
          children: <Widget>[
            Hardware(),
            System(),
            DeviceBattery(),
            Network(),

            // System(),
            // Battery(),
            // Camera(),
          ],
        ),
      ),
    );
  }
}
