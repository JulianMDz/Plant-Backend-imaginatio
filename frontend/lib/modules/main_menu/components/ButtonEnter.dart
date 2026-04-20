import 'package:flame/components.dart';
import 'package:flame/events.dart'; // este sí es el correcto
import 'package:flame/flame.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ButtonAction extends SpriteButtonComponent {
  late TextComponent textComp;

  ButtonAction({required void Function() onPressed})
      : super(size: Vector2(120, 60), button: null, buttonDown: null, onPressed: onPressed);

  @override
  Future<void> onLoad() async {
    final normalImage = await Flame.images.load('Botones/Boton_Accion_01.png');
    final pressedImage = await Flame.images.load('Botones/Boton_Accion_02.png');

    button = Sprite(normalImage);
    buttonDown = Sprite(pressedImage);

    textComp = TextComponent(
      text: 'Entrar',
      textRenderer: TextPaint(
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    )
      ..anchor = Anchor.center
      ..position = size / 2;

    add(textComp);
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    scale = Vector2.all(0.9);
  }

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    scale = Vector2.all(1.0);
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    super.onTapCancel(event);
    scale = Vector2.all(1.0);
  }
}
