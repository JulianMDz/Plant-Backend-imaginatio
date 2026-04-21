import 'package:frontend/modules/plant_game/components/Button_Inventary.dart';
import 'package:frontend/modules/plant_game/components/Button_game_compost.dart';
import 'package:frontend/modules/plant_game/components/Button_game_water.dart';
import 'package:frontend/modules/plant_game/components/button_resource_compost.dart';
import 'package:frontend/modules/plant_game/components/button_resource_sun.dart';
import 'package:frontend/modules/plant_game/components/button_resource_water.dart';
import 'package:frontend/modules/plant_game/components/panel_resource.dart';
import 'package:frontend/modules/plant_game/components/panel_title.dart';
import 'package:frontend/modules/plant_game/components/plant.dart';
import 'package:frontend/modules/plant_game/components/background.dart';
import 'package:frontend/modules/plant_game/components/Button_help.dart';
import 'package:flame/components.dart';

import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';


class PlantGameScreen extends FlameGame {

  @override
  Future<void> onLoad() async {
    add(Background());
    final helpButton = Button_help(onPressed: () { });
    final panelTitle = Panel_title();
    final inventaryButton = Button_inventory(onPressed: () { });

    final panelInfo = Panel_resource_info();

    final waterGameButton = Button_water_game(
      onPressed: () {
        // Aquí activas el overlay directamente
        overlays.add('InventaryOverlay');
      },
    );
    final compostGameButton = Button_compost_game(onPressed: () { });

    final sunButton = Button_resource_sun(onPressed: () { });
    final waterButton = Button_resource_water(onPressed: () { });
    final compostButton = Button_resource_compost(onPressed: () { });
    
    final layout = ColumnComponent(
      children: [
        RowComponent(
          children: [helpButton, panelTitle],
        ),
        RowComponent(
          children: [waterGameButton, compostGameButton],
        ),
      ],
    );

    final row = RowComponent(
      children: [
        helpButton,
        panelTitle,
        inventaryButton,
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
    )
      ..anchor = Anchor.topCenter
      ..position = Vector2(size.x / 2, 20); // fila arriba centrada

    add(row);


    final column = ColumnComponent(
      children: [
        waterGameButton,
        compostGameButton,
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
    )
      ..anchor = Anchor.center
      ..position = Vector2(size.x / 2, size.y / 2); // fila arriba centrada

    add(column);


final rowDown = RowComponent(
      children: [
        sunButton,
        waterButton,
        compostButton,
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
    )
      ..anchor = Anchor.bottomCenter
      ..position = Vector2(size.x / 2, size.y - 20); // fila arriba centrada

    add(rowDown);

    final pastoSeed = PlantComponent('pasto', Vector2(20, 30));
    add(pastoSeed);

  }
}

