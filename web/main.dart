import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'stack.dart';
import 'group.dart';
import 'kickstarter_advert.dart';
import 'logo_digitalscribes.dart';
import 'navigation.dart';
import 'test_displayObjectContainer.dart';

//height will be determined later by adding new elements to the stage. -------v
html.CanvasElement canvas = new html.CanvasElement(width: html.window.innerWidth, height: 0);
var stage = new Stage(canvas) //width: innerWidth, //stackHeight
  ..align = StageAlign.TOP_LEFT
//..scaleMode = StageScaleMode.NO_SCALE
//..scaleMode = StageScaleMode.EXACT_FIT
//..scaleMode = StageScaleMode.NO_BORDER
//..scaleMode = StageScaleMode.SHOW_ALL
;

void main() {
  //used for when the website is rescaled.
  var canvasHeight = 0.0;
  var canvasWidth = html.window.innerWidth;

  canvas.id = '#canvas';
  html.BodyElement body = html.querySelector('#body');
  body.append(canvas);
  stage.backgroundColor = Color.Black;

  //listen for when the window is resized.
  html.window.onResize.listen((event){
    //ra-adjust canvas dimensions to properly display the stage.
    canvas.width = html.window.innerWidth;
    canvas.height = (canvasHeight * (canvas.width / canvasWidth)).toInt();
  });

  //new KickstarterAdvert(resource)

  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  var resourceManager = new ResourceManager()
    ..addBitmapData('kickstarter_advert', 'resources/advert_udemy_kickstarter_ue4.png')
    ..addVideo('logo_digitalScribes', 'resources/logo_digitalScribes.webm')
    ..addBitmapData('button_news', 'resources/icon_news.svg')
    ..addBitmapData('button_tutorials', 'resources/icon_tutorials.svg')
    ..addBitmapData('button_contactUs', 'resources/icon_contactUs.svg')
    ..addBitmapData('button_up','resources/button_place_holder.png')
    ..addBitmapData('button_down', 'resources/button_place_holder_down.png');

  resourceManager.load().then((result){
    //instantiate all elements
    //all elements add themselves to the stack
    new KickstarterAdvert(resourceManager);
    new DigitalScribesLogo(resourceManager);
    new Navigation(resourceManager);
    new Painting();
    new Painting();
    new Painting();
    new Painting();
    new Painting();
    Stack.addToStage(stage);

    SimpleButton button = new SimpleButton(
        new Bitmap(resourceManager.getBitmapData('button_up')),
        new Bitmap(resourceManager.getBitmapData('button_up')),
        new Bitmap(resourceManager.getBitmapData('button_down')),
        new Bitmap(resourceManager.getBitmapData('button_down'))
    );

    button.x = html.window.innerWidth / 2 - button.width / 2;


    //stage.addChild(button);
    //stage.addChild(new Bitmap(resourceManager.getBitmapData('kickstarter_advert')));


    //grab the original height of the canvas from when the website is first loaded.
    //this is used if the website is being rescaled.
    canvasHeight = canvas.height;
  });

  /* draw a red circle
  var shape = new Shape();
  shape.graphics.circle(100, 100, 60);
  shape.graphics.fillColor(Color.Red);
  stage.addChild(shape);
  stage.addChild(button);*/
}