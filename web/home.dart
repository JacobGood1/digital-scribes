import 'package:stagexl/stagexl.dart';
import 'page.dart';
import 'kickstarter_advert.dart';
import 'logo_digitalscribes.dart';
import 'navigation.dart';
import 'recent_news.dart';
import 'dart:async';

class Home extends Page{
  int counter = 0;


  load_assets() async {
    load_navigation();
    load_advert();
    load_news();
    load_digital_scribes_logo();
  }

  load_navigation() async {
    resourceManagerNavigation = new ResourceManager()
      ..addBitmapData('button_news', 'resources/icon_news.svg')
      ..addBitmapData('button_tutorials', 'resources/icon_tutorials.svg')
      ..addBitmapData('button_contactUs', 'resources/icon_contactUs.svg');
    resourceManagerNavigation.load().then((result){
      new Navigation(this);
      print("nav done!");
      counter++;
    });
  }
  Future load_advert() async {
    resourceManagerAdvert = new ResourceManager()
      ..addBitmapData('kickstarter_advert', 'resources/udemy_kickstarter_ue4.png');

    resourceManagerAdvert.load().then((result){
      //instantiate all elements - create an abstract element tree
      new KickstarterAdvert(this);
      counter++;
      //an abstract element tree has been created, use that information and add all elements to the stage.
      print("advert done!");
    });
  }

  load_digital_scribes_logo() async {
    resourceManagerDigitalScribesLogo = new ResourceManager()
      ..addTextureAtlas('logo_digitalScribes_atlas', 'resources/digitalScribes_logo_atlas/digitalScribes_logo_atlas.atlas', TextureAtlasFormat.LIBGDX);
    resourceManagerDigitalScribesLogo.load().then((result){
      new DigitalScribesLogo(this);
      counter++;
      print("logo done!");
    });
  }
  load_news() async {
    resourceManagerNews = new ResourceManager()
      ..addBitmapData('plan', 'resources/planOfAction.png')
      ..addBitmapData('timmysNightmare_Title', 'resources/title_timmysNightmare.png');
    //..addVideo('timmy_example', 'resources/timmy_example_website.ogg')
    //..addVideo('kickstarterTrailer', 'resources/trailer_4_final_TEST_ogg_.ogg')
    resourceManagerNews.load().then((result){
      new RecentNews(this);
      counter++;
      print("news done!");
    });
  }
}

//home() async{
//  await h.load_assets();
//  await h.syncronize();
//}