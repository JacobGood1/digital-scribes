import 'package:stagexl/stagexl.dart';
import 'group.dart';
class KickstarterAdvert extends Group { //'resources/udemy_ue4_logo_2_update.png'
  num height = 1080;
  //resourceManager.getBitmapData('button_up')
  KickstarterAdvert(ResourceManager resourceManager){
    addChild(new Bitmap(resourceManager.getBitmapData('kickstarter_advert')));
  }
}