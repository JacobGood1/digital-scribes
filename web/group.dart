import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';

class Group extends DisplayObjectContainer {
  var resY;
  num width = 1920.0;
  num overlapTop = 0.0;
  num overlapBot = 0.0;
  Group() {
  }

  void addToStage (html.CanvasElement canvas, Stage stage) {
    var yOffset = 0;
    stage.children.forEach((DisplayObjectContainer container) => yOffset += (container.height * container.scaleY));
    this.scaleX = (canvas.width / width);
    this.scaleY *= scaleX;
    y += yOffset - overlapTop + overlapBot;
    //height -= overlapTop;

    stage.addChild(this);
    canvas.height += (height * scaleY).toInt();
  }
}