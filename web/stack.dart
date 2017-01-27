import 'package:stagexl/stagexl.dart';

class Stack {
  //Stage stage;
  List<DisplayObjectContainer> containers;

  Stack (List<DisplayObjectContainer> containers) {
    //this.stage = stage;
    this.containers = containers;
  }

  append(DisplayObjectContainer container){
    this.containers.add(container);
  }
  stackContainers(){
    for (var i = 1; i < containers.length; i++) {
      DisplayObjectContainer prevContainer = containers[i - 1];
      DisplayObjectContainer currentContainer = containers[i];
      //clear out current y value of currentContainer
      currentContainer.y = 0.0;
      //offset currentContainer's y value
      currentContainer.y = prevContainer.y + prevContainer.height;
    }
  }
  addToStage(Stage stage){
    containers.forEach((DisplayObjectContainer container) => stage.addChild(container));
  }

  int stackHeight () {
    int height = 0;
    containers.forEach((DisplayObjectContainer container) => height += container.height);
    return height;
  }
}