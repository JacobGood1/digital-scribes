import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';

class Painting extends DisplayObjectContainer {
  var resY;
  num width = 1920.0;
  num height = 300;
  final List<int> colors = [Color.Red, Color.Green, Color.Blue, Color.Brown];

  Painting(html.CanvasElement canvas, Stage stage) {
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

    //add to stage
    canvas.height += height;
    var yOffset = 0;
    stage.children.forEach((DisplayObjectContainer container) => yOffset += (container.height * container.scaleY));
    this.scaleX = (canvas.width / width);
    this.scaleY *= scaleX;
    this.y += yOffset;
    stage.addChild(this);
  }
}