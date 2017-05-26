import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'page.dart';

class AboutUsImg extends Group {
  num height = 1080/2;

  AboutUsImg(Page page) : super(page) {
    renderLayer = 0;
    Bitmap img = new Bitmap(page.resourceManager.getBitmapData('digitalScribes_logo_still'));
    img.scaleX = 2;
    img.scaleY = 2;
    img.y = -100;
    //height = 0;//img.height;//html.window.innerHeight / 2;//1080/2;//1080; html.window.innerHeight
    addChild(img);

    super.setupPosition();
  }
}