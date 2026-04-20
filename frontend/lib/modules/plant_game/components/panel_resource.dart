import 'package:flame/components.dart';

class Panel_resource_info extends SpriteComponent  {
  @override
  Future<void> onLoad() async {
    // Cargar la imagen
    sprite = await Sprite.load('Paneles/Panel_AvisoPlanta_01.png');

    size = Vector2(100,200);
    // Centrar en pantalla
    position = (Vector2(100,200) - size) / 2;
  }
}
