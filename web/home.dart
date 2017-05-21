import 'package:stagexl/stagexl.dart';
import 'page.dart';
import 'kickstarter_advert.dart';
import 'logo_digitalscribes.dart';
import 'navigation.dart';
import 'recent_news.dart';

class Home extends Page{
  Home () {
    resourceManager = new ResourceManager()
      ..addBitmapData('kickstarter_advert', 'resources/udemy_kickstarter_ue4.png')
      ..addBitmapData('plan', 'resources/planOfAction.png')
      ..addBitmapData('timmysNightmare_Title', 'resources/title_timmysNightmare.png')
      ..addVideo('digitalScribes_logo', 'resources/digitalScribes_logo.mp4')
      ..addBitmapData('digitalScribes_logo_mask', 'resources/digitalScribes_logo_mask.png')
      ..addVideo('timmy_example', 'resources/timmy_example.mp4')
      ..addBitmapData('button_news', 'resources/icon_news.svg')
      ..addBitmapData('button_tutorials', 'resources/icon_tutorials.svg')
      ..addBitmapData('button_contactUs', 'resources/icon_contactUs.svg')
    //button HOME
      ..addTextureAtlas('button_home_idle', 'resources/atlas_button_home_idle.json', TextureAtlasFormat.JSONARRAY)
      ..addTextureAtlas('button_home_mouseOver', 'resources/atlas_button_home_mouseOver.json', TextureAtlasFormat.JSONARRAY)
    //button COURSES
      ..addTextureAtlas('button_courses_idle', 'resources/atlas_button_courses_idle.json', TextureAtlasFormat.JSONARRAY)
      ..addTextureAtlas('button_courses_mouseOver', 'resources/atlas_button_courses_mouseOver.json', TextureAtlasFormat.JSONARRAY)
    //button SUBSCRIBE
      ..addTextureAtlas('button_subscribe_idle', 'resources/atlas_button_subscribe_idle.json', TextureAtlasFormat.JSONARRAY)
      ..addTextureAtlas('button_subscribe_mouseOver', 'resources/atlas_button_subscribe_mouseOver.json', TextureAtlasFormat.JSONARRAY)
    ;

    resourceManager.load().then((result){
      //instantiate all elements - create an abstract element tree
      new KickstarterAdvert(this);
      new DigitalScribesLogo(this);
      new Navigation(this);
      new RecentNews(this);

      //an abstract element tree has been created, use that information and add all elements to the stage.
      addToStage();
      finalizeCanvasDimensions();
    });
  }
}