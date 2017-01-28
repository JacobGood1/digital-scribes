import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'stack.dart';
import 'test_displayObjectContainer.dart';
void _onResize (Event e) {
  print('resize');
}
void main() {
  // setup the Stage and RenderLoop
  //html.Element canvas = html.querySelector('#stage');

  var innerWidth = html.window.innerWidth;

  //height will be determined later by adding new elements to the stage. -------v
  html.CanvasElement canvas = new html.CanvasElement(width: innerWidth, height: 0);
  canvas.id = '#canvas';
  html.BodyElement body = html.querySelector('#body');

  //listen for when the window is resized, this set canvas width to the new size.
  html.window.onResize.listen((event){
    canvas.width = html.window.innerWidth;
  });

  body.append(canvas);

  var stage = new Stage(canvas) //width: innerWidth, //stackHeight
  ..align = StageAlign.TOP_LEFT
  //..scaleMode = StageScaleMode.NO_SCALE
  //..scaleMode = StageScaleMode.EXACT_FIT
  //..scaleMode = StageScaleMode.NO_BORDER
  //..scaleMode = StageScaleMode.SHOW_ALL
  ;

  new Painting().addToStage(canvas, stage);
  new Painting().addToStage(canvas, stage);
  new Painting().addToStage(canvas, stage);
  new Painting().addToStage(canvas, stage);
  new Painting().addToStage(canvas, stage);

  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  var resourceManager = new ResourceManager()
    //..addBitmapData('kickstarter_advert', 'resources/udemy_ue4_logo_2_update.png')
    ..addBitmapData('button_up','resources/button_place_holder.png')
    ..addBitmapData('button_down', 'resources/button_place_holder_down.png');

  resourceManager.load().then((result){
    //Bitmap buttonImage = ;

    SimpleButton button = new SimpleButton(
        new Bitmap(resourceManager.getBitmapData('button_up')),
        new Bitmap(resourceManager.getBitmapData('button_up')),
        new Bitmap(resourceManager.getBitmapData('button_down')),
        new Bitmap(resourceManager.getBitmapData('button_down'))
    );

    button.x = innerWidth / 2 - button.width / 2;


    //stage.addChild(button);
    //stage.addChild(new Bitmap(resourceManager.getBitmapData('kickstarter_advert')));

  });

  /* draw a red circle
  var shape = new Shape();
  shape.graphics.circle(100, 100, 60);
  shape.graphics.fillColor(Color.Red);
  stage.addChild(shape);
  stage.addChild(button);*/
}