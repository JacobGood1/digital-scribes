import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';

class Group extends DisplayObjectContainer {
  var resY;
  num width = 1920.0;
  Group() {
  }

  void addToStage (html.CanvasElement canvas, Stage stage) {
    var yOffset = 0;
    stage.children.forEach((DisplayObjectContainer container) => yOffset += (container.height * container.scaleY));
    this.scaleX = (canvas.width / width);
    this.scaleY *= scaleX;
    this.y += yOffset;

    stage.addChild(this);
    print(height + scaleY);
    canvas.height += (height * scaleY).toInt();
  }
}