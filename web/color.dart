import 'package:color/color.dart' as color;

int rgb ({a: 255, r: 255, b: 255, g: 255}) {
  return int.parse('0x' + a.toRadixString(16) + new color.HexColor.fromRgb(r, g, b).toString());
}