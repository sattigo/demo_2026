import 'package:core_l10n/core_l10n.dart';
import 'package:feature_map_screen/src/ui/bloc/bloc.build.dart';
import 'package:feature_map_screen/src/ui/widgets/zoom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreenWidget extends StatelessWidget {
  const MapScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).mapScreen_notClickable_original_appBarText)),
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: (controller) {
              final bloc = BlocProvider.of<MapScreenBloc>(context);
              bloc.add(MapScreenEvent.mapCreated(controller));
              bloc.add(MapScreenEvent.locationPermissionRequested());
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ZoomButton(
                    icon: Icons.add,
                    onTap: () => BlocProvider.of<MapScreenBloc>(context).add(MapScreenEvent.zoomInTapped()),
                  ),
                  const SizedBox(height: 8),
                  ZoomButton(
                    icon: Icons.remove,
                    onTap: () => BlocProvider.of<MapScreenBloc>(context).add(MapScreenEvent.zoomOutTapped()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
