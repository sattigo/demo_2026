import 'package:core_l10n/core_l10n.dart';
import 'package:feature_map_screen/src/ui/bloc/bloc.build.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreenWidget extends StatelessWidget {
  const MapScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).mapScreen_notClickable_original_appBarText)),
      body: YandexMap(
        onMapCreated: (controller) {
          BlocProvider.of<MapScreenBloc>(context).add(MapScreenEvent.mapCreated(controller));
        },
      ),
    );
  }
}
