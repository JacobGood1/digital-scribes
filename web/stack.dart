import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'main.dart';

class Stack {
  static List<DisplayObjectContainer> allItems = new List<DisplayObjectContainer>();
  static List<List<DisplayObjectContainer>> renderOrder = new List<List<DisplayObjectContainer>>();

  static setup () {
    allItems.forEach((Group group){
      group.setupPosition();
    });
  }

  static addToStage (Stage stage) {
    Stack.renderOrder.forEach((List<DisplayObjectContainer> layer) {
      layer.forEach((Group group) {
        stage.addChild(group);
      });
    });
  }
}