import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'stack.dart';
import 'main.dart' as main;

class Group extends DisplayObjectContainer {
  int renderOrder = 0;
  var resY;
  num width = 1920.0;
  num pushUp = 0.0;
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
    print("group: " + (main.canvas.clientWidth - main.body.clientWidth).toString());

    this.scaleX = (main.canvas.width + (main.canvas.clientWidth - main.body.clientWidth)) / width;

    //this.scaleX = ((html.window.innerWidth) / width); //main.canvas.width
    this.scaleY *= scaleX;
    y += yOffset;

    children.forEach((var child){
      child.y -= pushUp;
    });

    height -= pushUp;

    //renderOrder is made on-the-fly to accommodate any amount of rendering layers.
    //check if a render layer exists for this renderOrder, if not, add a new layer.
    if (Stack.renderOrder.length < renderOrder + 1) {
      for (int i = Stack.renderOrder.length; i < renderOrder + 1; i++) {
        Stack.renderOrder.add(new List<DisplayObjectContainer>());
      }
    }

    Stack.renderOrder[renderOrder].add(this);
    main.canvas.height += (height * scaleY).toInt();


    Stack.allItems.add(this);

    //main.canvas.width = (main.canvas.width - (main.canvas.clientWidth - main.body.clientWidth));

    return this;
  }
}