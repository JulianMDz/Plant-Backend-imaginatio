import 'package:flame/components.dart';

class Sun extends SpriteComponent with HasGameRef {
  late TextComponent textComp;
  
  @override
  Future<void> onLoad() async {
    // Cargar la imagen
    sprite = await Sprite.load('Minijuegos/Icono_Soles.png');

    // Escalar proporcionalmente
     size = sprite!.srcSize/5;  

    // Centrar en pantalla
    position = (gameRef.size - size) / 2;
  }
}
