import 'dart:html';
import 'package:stagexl/stagexl.dart';
import 'page.dart';
import 'about_us_advert.dart';
import 'about_us_info.dart';
import 'logo_digitalscribes.dart';
import 'navigation.dart';
import 'subscribe_emailService.dart';
import 'buffer.dart';



class Subscribe extends Page{
  Subscribe () {
    resourceManager = new ResourceManager()
      ..addBitmapData('kickstarter_advert', 'resources/udemy_kickstarter_ue4.png')
      ..addBitmapData('plan', 'resources/planOfAction.png')
      ..addBitmapData('timmysNightmare_Title', 'resources/title_timmysNightmare.png')
    //..addVideo('timmy_example', 'resources/timmy_example_website.ogg')
    //..addVideo('kickstarterTrailer', 'resources/trailer_4_final_TEST_ogg_.ogg')
      ..addVideo('digitalScribes_logo', 'resources/digitalScribes_logo.mp4')
      ..addBitmapData('digitalScribes_logo_mask', 'resources/digitalScribes_logo_mask.png')

      ..addBitmapData('digitalScribes_logo_still', 'resources/digitalScribes_logo_still.png')
      //..addTextureAtlas('logo_digitalScribes_atlas', 'resources/digitalScribes_logo_atlas/digitalScribes_logo_atlas.atlas', TextureAtlasFormat.LIBGDX)

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
      new Buffer();

      //instantiate all elements - create an abstract element tree
      new AboutUsAdvert(this);
      new DigitalScribesLogo(this);
      new Navigation(this);
      new AboutUsInfo(this);
      //new Subscribe_EmailService(this);
      //new RecentNews(this);

      //an abstract element tree has been created, use that information and add all elements to the stage.
      addToStage();
      finalizeCanvasDimensions();
    });
  }
}