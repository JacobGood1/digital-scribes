import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';

class Page {
  html.BodyElement body;
  html.CanvasElement canvas;
  Stage stage;
  RenderLoop renderLoop_ = new RenderLoop();
  ResourceManager resourceManager;
  List<List<DisplayObjectContainer>> renderLayers = new List<List<DisplayObjectContainer>>();

  //used for when the website is rescaled.
  var canvasHeight = 1;
  var canvasWidth = html.window.innerWidth;
  //small buffer due to float rounding to int when height / width conversion happens.
  var canvasHeightBuffer = 10;

  List<DisplayObjectContainer> groups = new List<DisplayObjectContainer>();

  Page () {

    //StageXL.stageOptions.renderEngine = RenderEngine.Canvas2D;

    for (int i = 0; i < 3; i++){
      renderLayers.add(new List<DisplayObjectContainer>());
    }

    //!!! don't input a value for y, being 0 is a crucial factor!
    //height will be determined later by adding new elements to the stage. -------v
    canvas = new html.CanvasElement(width: html.window.innerWidth, height: 0);
    canvas.style.left = '0px';
    canvas.style.top = '0px';
    canvas.style.position = 'absolute';

    stage = new Stage(canvas) //width: innerWidth, //stackHeight
      ..align = StageAlign.TOP_LEFT
      //..scaleMode = StageScaleMode.NO_SCALE
      //..scaleMode = StageScaleMode.EXACT_FIT
      //..scaleMode = StageScaleMode.NO_BORDER
      //..scaleMode = StageScaleMode.SHOW_ALL
        ;

    renderLoop_.addStage(stage);

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

  void finalizeCanvasDimensions () {
    //grab the original height of the canvas from when the website is first loaded.
    //this is used if the website is being rescaled.
    canvasHeight = canvas.height;

    //resize canvas width and height to match the outcome of the abstract element tree.
    canvas.width = canvas.width - (canvas.clientWidth - body.clientWidth);
    canvas.height = (canvasHeight * (canvas.width / canvasWidth)).toInt() + canvasHeightBuffer;
  }
}