import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'page.dart';

class CoursesAdvert extends Group {
  num height = 1080/2;

  CoursesAdvert(Page page) : super(page) {
    renderLayer = 0;
    Bitmap advert = new Bitmap(page.resourceManager.getBitmapData('courses_logo'));
    advert.scaleX = 1;
    advert.scaleY = 1;
    advert.y = -100;
    //height = 0;//advert.height;//html.window.innerHeight / 2;//1080/2;//1080; html.window.innerHeight
    addChild(advert);

    super.setupPosition();
  }
}