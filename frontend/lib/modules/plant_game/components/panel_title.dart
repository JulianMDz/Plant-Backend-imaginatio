import 'package:flame/components.dart';

class Panel_title extends SpriteComponent  {
  @override
  Future<void> onLoad() async {
    // Cargar la imagen
    sprite = await Sprite.load('Paneles/Panel_NombrePlanta_01.png');

    size = sprite!.srcSize;      
    scale = Vector2.all(0.5);     

    anchor = Anchor.center;       
    position = Vector2(size.x / 2, size.y / 2);
  }
}
