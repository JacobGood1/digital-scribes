import 'package:stagexl/stagexl.dart';
import 'group.dart';

class Painting extends Group {
  num height = 300;
  final List<int> colors = [Color.Red, Color.Green, Color.Blue, Color.Brown];

  Painting() {
    var background = new BitmapData(width, height, Color.BlanchedAlmond);
    var backgroundBitmap = new Bitmap(background);
    addChild(backgroundBitmap);

    for(var i = 0; i < colors.length; i++) {
      var box = new BitmapData(100, 100, colors[i]);
      var boxBitmap = new Bitmap(box);
      boxBitmap.x = (80 + i * 50);
      boxBitmap.y = (60 + i * 30);
      addChild(boxBitmap);
    }

    super.setupPosition();
  }
}