import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'buttonContainer.dart';

class Navigation extends Group {
  num height = 50;

  Navigation (ResourceManager resourceManager) {
    renderOrder = 1;
    //overlapTop = 100.0;

    //background
    var background = new BitmapData(width, height, Color.DarkSlateGray);
    var backgroundBitmap = new Bitmap(background);
    addChild(backgroundBitmap);


    DisplayObjectContainer buttonContainer = new ButtonContainer(resourceManager);

    buttonContainer.width = width * 0.8;
    buttonContainer.height = buttonContainer.height * (buttonContainer.width / width);
    buttonContainer.x = this.width/2 - buttonContainer.width/2;
    buttonContainer.y = this.height/2 - buttonContainer.height/2;

    addChild(buttonContainer);
    super.setupPosition();
  }

  //are these automatically generated?
  //get width => width;
  //set width (num width) => this.width = width;
}