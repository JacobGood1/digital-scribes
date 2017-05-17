import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'color.dart' as color;
import 'page.dart';

class Subscribe_EmailService extends Group{
  num height = 1200;
  num elementYOffset = 0;
  Subscribe_EmailService(Page page) : super(page){
    var background = new BitmapData(width, height, color.rgb(r: 0, g: 0, b: 0, a: 255));
    var backgroundBitmap = new Bitmap(background);
    addChild(backgroundBitmap);

    var textFormat = new TextFormat("Arial, Helvetica, sans-serif", 30, Color.White, bold: true);
    textFormat.leftMargin = 5;
    textFormat.topMargin = 2;
    textFormat.bottomMargin = 2;
    var textField = new TextField("myemail@sample.com", textFormat);
    textField.width = 500;
    textField.height = 50;
    //textField.border = true;
    //textField.borderColor = Color.GreenYellow;
    textField.background = true;
    textField.backgroundColor = Color.DarkSlateGray;
    textField.x = (this.width / 2) - (textField.width / 2);
    textField.y = this.y;
    addChild(textField);

    textField.onMouseDown.listen((e){
      textField.text = "";
    });

    //height = elementYOffset + element.height;// + 10;
    super.setupPosition();
  }
}