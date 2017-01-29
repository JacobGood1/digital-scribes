import 'package:stagexl/stagexl.dart';
import 'group.dart';
class KickstarterAdvert extends Group {
  num height = 1080;
  //resourceManager.getBitmapData('button_up')
  KickstarterAdvert(ResourceManager resourceManager){
    addChild(new Bitmap(resourceManager.getBitmapData('kickstarter_advert')));
  }
}