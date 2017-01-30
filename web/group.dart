import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'stack.dart';
import 'main.dart' as main;

class Group extends DisplayObjectContainer {
  int renderOrder = 0;
  var resY;
  num width = 1920.0;
  num overlapTop = 0.0;
  num overlapBot = 0.0;
  //html.CanvasElement canvas;
  //Stage stage;
  Group() {
    //canvas = main.canvas;
    //stage = main.stage;
  }

  Group setupPosition () {
    var yOffset = 0;
    //stage.children.forEach((DisplayObjectContainer container) => yOffset += (container.height * container.scaleY));
    Stack.allItems.forEach((DisplayObjectContainer container) => yOffset += (container.height * container.scaleY));
    this.scaleX = (main.canvas.width / width);
    this.scaleY *= scaleX;
    y += yOffset - overlapTop + overlapBot;
    //height -= overlapTop;

    //stage.addChild(this);
    if (Stack.renderOrder.length < renderOrder + 1) {
      Stack.renderOrder.add(new List<DisplayObjectContainer>());
    }
    Stack.renderOrder[renderOrder].add(this);
    main.canvas.height += (height * scaleY).toInt();


    Stack.allItems.add(this);
    return this;
  }
}