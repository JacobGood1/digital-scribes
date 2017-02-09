import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'page.dart';

class AboutUsAdvert extends Group {
  num height = 1080/2;

  AboutUsAdvert(Page page) : super(page) {
    renderLayer = 0;
    Bitmap advert = new Bitmap(page.resourceManager.getBitmapData('digitalScribes_logo_still'));
    advert.scaleX = 2;
    advert.scaleY = 2;
    advert.y = -100;
    //height = 0;//advert.height;//html.window.innerHeight / 2;//1080/2;//1080; html.window.innerHeight
    addChild(advert);

    super.setupPosition();
  }
}