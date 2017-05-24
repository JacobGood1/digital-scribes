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



    //height = elementYOffset + element.height;// + 10;
    super.setupPosition();
  }
}