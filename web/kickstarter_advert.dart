import 'package:stagexl/stagexl.dart';
import 'group.dart';
class KickstarterAdvert extends Group {
  num height = 1080;
  //resourceManager.getBitmapData('button_up')
  KickstarterAdvert(ResourceManager resourceManager){
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

    renderOrder = 1;
    Bitmap advert = new Bitmap(resourceManager.getBitmapData('kickstarter_advert'));
    addChild(advert);

    super.setupPosition();
  }
}