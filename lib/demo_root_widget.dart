import 'package:demo_2026/app/app.dart';
import 'package:demo_2026/ui_kit/platform.dart';
import 'package:demo_2026/ui_kit/text_scale_factor_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DemoRootWidget extends StatelessWidget {
  const DemoRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final router = App.mainRouter;
    return Platform(
      androidBuilder: (context) => MaterialApp.router(
        routerConfig: router,
        builder: _appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Yangi Finance',
      ),
      iOSBuilder: (context) => CupertinoApp.router(
        routerConfig: router,
        builder: _appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Yangi Finance',
        localizationsDelegates: const [
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ),
    );
  }

  Widget _appBuilder(BuildContext context, Widget? child) {
    const maxTextScale = 1.25;

    return TextScaleFactorProvider(maxTextScale: maxTextScale, child: FToastBuilder()(context, child));
  }
}
