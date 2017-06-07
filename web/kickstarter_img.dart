import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'page.dart';

class KickstarterImg extends Group {
  num height = 1080~/2;
  KickstarterImg(Page page) : super(page) {
    //autoScale = false;
    //width = html.window.innerWidth;
    //height = html.window.innerHeight;
    /*num triangleWidth = 200.0;
    num triangleHeight = 50.0;
    List<Point> points = new List<Point>();
    points.add(new Point(0, 0));
    points.add(new Point(1920, 0));
    points.add(new Point(1920, 1080));
    points.add(new Point(1920/2+triangleWidth/2, 1080));
    points.add(new Point(1920/2, 1080 - triangleHeight));
    points.add(new Point(1920/2-triangleWidth/2, 1080));
    points.add(new Point(0, 1080));
    Mask mask = new Mask.custom(points);
    img.mask = mask;*/


    renderLayer = 0;
    Bitmap img = new Bitmap(page.resourceManager.getBitmapData('kickstarter_img'));
    img.scaleX = 2;
    img.scaleY = 2;
    //height = 0;//img.height;//html.window.innerHeight / 2;//1080/2;//1080; html.window.innerHeight
    addChild(img);

    super.setupPosition();
  }
}