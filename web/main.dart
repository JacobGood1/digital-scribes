import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';

void main() {

  // setup the Stage and RenderLoop
  var canvas = html.querySelector('#stage');
  var innerWidth = html.window.innerWidth;
  var innerHeight = html.window.innerHeight;
  var stage = new Stage(canvas); //, width: innerWidth, height: innerHeight //inputting dimensions here requires resizing the stage.
  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  var resourceManager = new ResourceManager()
    ..addBitmapData('kickstarter_advert', '../resources/udemy_ue4_logo_2_update.png')
    ..addBitmapData('button_up','../resources/button_place_holder.png')
    ..addBitmapData('button_down', '../resources/button_place_holder_down.png');

  resourceManager.load().then((result){
    //Bitmap buttonImage = ;

    SimpleButton button = new SimpleButton(
        new Bitmap(resourceManager.getBitmapData('button_up')),
        new Bitmap(resourceManager.getBitmapData('button_up')),
        new Bitmap(resourceManager.getBitmapData('button_down')),
        new Bitmap(resourceManager.getBitmapData('button_down'))
    );

    button.x = innerWidth / 2 - button.width / 2;
    print(button.width);

    stage.addChild(button);
    stage.addChild(new Bitmap(resourceManager.getBitmapData('kickstarter_advert')));

  });

  // draw a red circle
  var shape = new Shape();
  shape.graphics.circle(100, 100, 60);
  shape.graphics.fillColor(Color.Red);
  //stage.addChild(shape);
  //stage.addChild(button);
}