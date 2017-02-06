import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';

class Page {
  html.BodyElement body;
  html.CanvasElement canvas;
  Stage stage;
  ResourceManager resourceManager;

  int renderLayerSize = 3;
  List<List<DisplayObjectContainer>> renderLayers = new List<List<DisplayObjectContainer>>();

  //used for when the website is rescaled.
  var canvasHeight = 0.0;
  var canvasWidth = html.window.innerWidth;
  //small buffer due to float rounding to int when height / width conversion happens.
  var canvasHeightBuffer = 10;

  List<DisplayObjectContainer> groups = new List<DisplayObjectContainer>();

  Page () {
    //StageXL.stageOptions.renderEngine = RenderEngine.Canvas2D;

    //render layers
    for (int i = 0; i < renderLayerSize; i++){
      renderLayers.add(new List<DisplayObjectContainer>());
    }

    //!!! don't input a value for y, being 0 is a crucial factor!
    //height will be determined later by adding new elements to the stage. -------v
    canvas = new html.CanvasElement(width: html.window.innerWidth, height: 0);


    stage = new Stage(canvas) //width: innerWidth, //stackHeight
      ..align = StageAlign.TOP_LEFT
      //..scaleMode = StageScaleMode.NO_SCALE
      //..scaleMode = StageScaleMode.EXACT_FIT
      //..scaleMode = StageScaleMode.NO_BORDER
      //..scaleMode = StageScaleMode.SHOW_ALL
        ;

    body = html.querySelector('#body');

    canvas.id = '#canvas';

    body.append(canvas);
    stage.backgroundColor = Color.Black;


    //listen for when the window is resized.
    html.window.onResize.listen((event){
      //ra-adjust canvas dimensions to properly display the stage.

      canvas.width = canvas.width - (canvas.clientWidth - body.clientWidth);
      canvas.height = (canvasHeight * (canvas.width / canvasWidth)).toInt() + canvasHeightBuffer;
    });

    var renderLoop = new RenderLoop();
    renderLoop.addStage(stage);
  }

  void addToStage () {
    renderLayers.forEach((List<DisplayObjectContainer> groups){
      groups.forEach((group){
        stage.addChild(group);
      });
    });
  }
}