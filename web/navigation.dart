import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'buttonContainer.dart';
import 'color.dart' as color;
import 'page.dart';

class Navigation extends Group {
  num height = 50;

  Navigation (Page page) : super(page){
    renderLayer = 1;
    /*//background
    var gradient = new GraphicsGradient.linear(x, y + height, x, y);
    gradient.addColorStop(0, color.rgb(r: 48, b: 48, g: 48, a: 255));
    gradient.addColorStop(1, color.rgb(r: 0, b: 0, g: 0, a: 255));
    var shape = new Shape();
    shape.graphics
      ..beginPath()
      ..moveTo(x,y)
      ..lineTo(x + width, y)
      ..lineTo(x + width, y + height)
      ..lineTo(x, y + height)
      ..closePath()
    //..fillColor(color1);
      ..fillGradient(gradient);

    addChild(shape);*/
    //var background = new BitmapData(width, height, color.rgb(r: 48, b: 48, g: 48, a: 255));
    //var backgroundBitmap = new Bitmap(background);
    //addChild(backgroundBitmap);

    var background = new BitmapData(width, height, color.rgb(r: 0, g: 0, b: 0, a: 255));
    var backgroundBitmap = new Bitmap(background);
    addChild(backgroundBitmap);


    DisplayObjectContainer buttonContainer = new ButtonContainer(page.resourceManager);

    buttonContainer.width = width * 0.5;
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