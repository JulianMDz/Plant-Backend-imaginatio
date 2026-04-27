import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class textSun extends PositionComponent with HasGameRef {
  @override
  Future<void> onLoad() async {

    // 🔹 Texto pequeño (arriba)
    final tiempo = TextBoxComponent(
      text: "caja de",
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Press Start 2P',
        ),
      ),
      align: Anchor.center,
      anchor: Anchor.center,
      size: Vector2(200, 40),
      position: Vector2(0, -20), // 👈 arriba
    );

    // 🔹 Texto grande (abajo)
    final titulo = TextBoxComponent(
      text: "SOLES",
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 28, // 🔥 más grande
          fontFamily: 'Press Start 2P',
        ),
      ),
      align: Anchor.center,
      anchor: Anchor.center,
      size: Vector2(200, 60),
      position: Vector2(0, 20), // 👈 abajo
    );

    add(tiempo);
    add(titulo);

    // 🔥 centro general del bloque
    position = Vector2(gameRef.size.x / 2, 200);
  }
}