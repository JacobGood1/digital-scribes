import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'buttonContainer.dart';

class Navigation extends Group {
  num height = 300;

  Navigation (ResourceManager resourceManager) {
    DisplayObjectContainer buttonContainer = new ButtonContainer(resourceManager);

    buttonContainer.width = width * 0.8;
    buttonContainer.height = buttonContainer.height * (buttonContainer.width / width);
    buttonContainer.x = this.width/2 - buttonContainer.width/2;
    buttonContainer.y = this.height/2 - buttonContainer.height/2;

    addChild(buttonContainer);
  }

  //are these automatically generated?
  //get width => width;
  //set width (num width) => this.width = width;
}