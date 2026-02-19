import 'package:demo_2026/app/app.dart';
import 'package:demo_2026/demo_root_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  await _initAndRunApp();
}

Future<void> _initAndRunApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await App.init();

  runApp(_buildAppWidget());
}

Widget _buildAppWidget() {
  return const DemoRootWidget();
}
