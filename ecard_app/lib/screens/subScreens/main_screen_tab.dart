import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MainScreenTab extends StatefulWidget {
  const MainScreenTab({super.key});

  @override
  State<MainScreenTab> createState() => _MainScreenTabState();
}

class _MainScreenTabState extends State<MainScreenTab> {
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: Theme.of(context).hoverColor,
        effect: const ShimmerEffect(),
        enabled: !isLoaded,
        enableSwitchAnimation: true,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
          ),
          child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),

          ),

    ));
  }
}
