import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_random_dice/screen/home_screen.dart';
import 'package:flutter_random_dice/screen/settings_screen.dart';
import 'package:shake_gesture/shake_gesture.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? controller;
  double threshold = 2.7;
  int number = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller!.addListener(tabListener);
  }

  tabListener() {
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.removeListener(tabListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: controller, children: renderChildren()),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  List<Widget> renderChildren() {
    return [
      //버전 문제로 shake 라이브러리에서 shake_gesture로 변경
      ShakeGesture(
          onShake: () {
            onPhoneShake();
          },
          child: HomeScreen(number: number)),
      SettingsScreen(threshold: threshold, onThresholdChanged: onThresholdChanged)
    ];
  }

  void onThresholdChanged(double value) {
    setState(() {
      threshold = value;
    });
  }

  BottomNavigationBar renderBottomNavigation() {
    return BottomNavigationBar(
        currentIndex: controller!.index,
        onTap: (index) {
          controller!.animateTo(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.edgesensor_high_outlined), label: '주사위'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정')
        ]);
  }

  void onPhoneShake() {
    final rand = Random();
    setState(() {
      number = rand.nextInt(5) + 1;
    });
  }
}
