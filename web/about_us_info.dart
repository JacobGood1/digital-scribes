import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'color.dart' as color;
import 'page.dart';

class AboutUsInfo extends Group {
  num height = 1200;
  num elementYOffset = 100;
  final String text1 =
  '''
  Lots of text Lots of text Lots of text Lots of text
  Lots of text Lots of text
  Lots of text Lots of text Lots of text Lots of text Lots of text
  Lots of text Lots of text Lots of text

  Lots of text Lots of text
  Lots of text
  Lots of text Lots of text

  Lots of text
  Lots of text Lots of text Lots of text Lots of text
  Lots of text Lots of text Lots of text
  Lots of text Lots of text Lots of text Lots of text Lots of text

  Lots of text Lots of text
  Lots of text Lots of text Lots of text Lots of text
  Lots of text Lots of text Lots of text
  Lots of text

  Lots of text Lots of text
  Lots of text Lots of text Lots of text
  Lots of text Lots of text

  support@digital-scribes.com
  ''';

  AboutUsInfo(Page page) : super(page){

    var background = new BitmapData(width, height, color.rgb(r: 0, g: 0, b: 0, a: 255));
    var backgroundBitmap = new Bitmap(background);
    addChild(backgroundBitmap);

    var textField = new TextField();
    var textFormat = new TextFormat('Helvetica,Arial', 30, Color.White, align: TextFormatAlign.CENTER);
    textField.defaultTextFormat = textFormat;
    textField.text = text1;
    textField.y = elementYOffset;
    textField.width = width;//1100;
    textField.height = 1000;
    textField.x = width / 2 - textField.width / 2;
    //textField.wordWrap = true;
    addChild(textField);

    elementYOffset = textField.y + textField.height; //textField.y;

    height = elementYOffset;// + 10;
    super.setupPosition();
  }
}