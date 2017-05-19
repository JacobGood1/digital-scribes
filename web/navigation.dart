import 'package:stagexl/stagexl.dart';
import 'dart:html' as html;
import 'group.dart';
import 'buttonContainer.dart';
import 'color.dart' as color;
import 'page.dart';

class Navigation extends Group {
  num height = 150;//50;

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


    /*DisplayObjectContainer buttonContainer = new ButtonContainer(page.resourceManager);

    buttonContainer.width = width * 0.5;
    buttonContainer.height = buttonContainer.height * (buttonContainer.width / width);
    buttonContainer.x = this.width/2 - buttonContainer.width/2;
    buttonContainer.y = this.height/2 - buttonContainer.height/2;

    addChild(buttonContainer);*/

    var button_text = "Available courses from Digital Scribes ->";
    var button_height = 70;
    var button_subscribe = new TextField();
    button_subscribe.defaultTextFormat = new TextFormat('Monda', 50, Color.GreenYellow, align: "center");
    button_subscribe.text = button_text;// "mailing list and stay up to date with current news.";
    button_subscribe.width = width;// = 1350;
    button_subscribe.height = button_height;
    button_subscribe.x = 0;
    //textField.y = 20;
    button_subscribe.wordWrap = false;
    button_subscribe.filters = [
      new GlowFilter(Color.GreenYellow, 60, 60, 5)
    ];
    var button_subscribe_mouseOver = new TextField();
    button_subscribe_mouseOver.defaultTextFormat = new TextFormat('Monda', 50, Color.Cyan, align: "center");
    button_subscribe_mouseOver.text = button_text;// "mailing list and stay up to date with current news.";
    button_subscribe_mouseOver.x = 0;
    //textField.y = 20;
    button_subscribe_mouseOver.width = width;// = 1350;
    button_subscribe_mouseOver.height = button_height;
    button_subscribe_mouseOver.wordWrap = false;
    button_subscribe_mouseOver.filters = [
      new GlowFilter(Color.Cyan, 60, 60, 5)
    ];

    SimpleButton button_test = new SimpleButton(
        button_subscribe,
        button_subscribe_mouseOver,
        button_subscribe_mouseOver,
        button_subscribe
    );
    button_test.onMouseClick.listen((MouseEvent event){
      html.window.location.href = 'tutorials.html';
    });


    var text_subscribeInfo = new TextField();
    text_subscribeInfo.defaultTextFormat = new TextFormat('Monda', 30, Color.Azure, italic:true, align: "center");
    text_subscribeInfo.text = "and stay up to date with current news.";
    text_subscribeInfo.width = width;//1160;
    text_subscribeInfo.height = 140;
    //text_subscribeInfo.x = (button_subscribe.x + (button_subscribe.width/2)) - text_subscribeInfo.width / 2;
    text_subscribeInfo.y = button_subscribe.y + (button_subscribe.height + 10);
    text_subscribeInfo.wordWrap = false;

    //addChild(text_subscribeInfo);
    addChild(button_test);

    super.setupPosition();
  }

  //are these automatically generated?
  //get width => width;
  //set width (num width) => this.width = width;
}