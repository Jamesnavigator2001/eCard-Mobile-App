import 'dart:io';
import 'package:flutter/material.dart';
import '../modals/user_modal.dart';
import '../router/router_path.dart';
import 'package:camera/camera.dart';

class DashboardPage extends StatefulWidget {
  final User user;
  const DashboardPage({super.key, required this.user});
  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  // TabController? tabController;
  // int currentTab = 0;
  String tabLocation = RouterPath.dashboard;
  late StatefulWidget app;
  Future checkAvailable() async {
    if (Platform.isAndroid || Platform.isIOS) {
      final cameras = await availableCameras();
      final firstCamera = cameras.first;
      app = ScanningScreen(camera: firstCamera);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).highlightColor,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            const Color.fromARGB(111, 255, 133, 220),
            Theme.of(context).primaryColor,
            const Color.fromARGB(112, 255, 224, 133)
          ])),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).highlightColor.withOpacity(0.8)),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Builder(
                  builder: (context) {
                    switch (tabLocation) {
                      case RouterPath.dashboard:
                        return const MainScreen();
                      case RouterPath.nearby:
                        return const NearbyScreen();
                      case RouterPath.analysis:
                        return app;
                      case RouterPath.settings:
                        return const SettingsPage();
                      default:
                        return const MainScreen();
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
