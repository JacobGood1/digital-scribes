import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import '../group.dart';
import '../page.dart';
//import 'main.dart' as main;
class KickstarterAdvert extends Group {
  KickstarterAdvert(Page page) : super(page) {
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
    advert.mask = mask;*/

    height = 1080/2;//1080; html.window.innerHeight
    renderLayer = 0;
    Bitmap advert = new Bitmap(page.resourceManager.getBitmapData('kickstarter_advert'));
    //advert.scaleX = 0.5;
    //advert.scaleY = 0.5;
    addChild(advert);

    super.setupPosition();
  }
}