import 'package:stagexl/stagexl.dart';
import '../page.dart';
import '../page_home/kickstarter_advert.dart';
import '../page_home/logo_digitalscribes.dart';
import '../page_home/navigation.dart';
import '../page_home/recent_news.dart';

class Home extends Page{

  Home () {
    resourceManager = new ResourceManager()
      ..addBitmapData('kickstarter_advert', 'resources/udemy_kickstarter_ue4.png')
      ..addBitmapData('plan', 'resources/planOfAction.png')
      ..addBitmapData('timmysNightmare_Title', 'resources/title_timmysNightmare.png')
      //..addVideo('timmy_example', 'resources/timmy_example_website.ogg')
      //..addVideo('kickstarterTrailer', 'resources/trailer_4_final_TEST_ogg_.ogg')
      ..addTextureAtlas('logo_digitalScribes_atlas', 'resources/digitalScribes_logo_atlas/digitalScribes_logo_atlas.atlas', TextureAtlasFormat.LIBGDX)
      ..addBitmapData('button_news', 'resources/icon_news.svg')
      ..addBitmapData('button_tutorials', 'resources/icon_tutorials.svg')
      ..addBitmapData('button_contactUs', 'resources/icon_contactUs.svg')
      ..addBitmapData('button_up','resources/button_place_holder.png')
      ..addBitmapData('button_down', 'resources/button_place_holder_down.png');

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