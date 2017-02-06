import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import '../page.dart';
import '../group.dart';

import '../page_home/kickstarter_advert.dart';
import '../page_home/logo_digitalscribes.dart';
import '../page_home/navigation.dart';
import '../page_home/recent_news.dart';
import '../page_home/test_displayObjectContainer.dart';

class Home extends Page{

  Home () {
    print("stage: " + stage.toString());

    resourceManager = new ResourceManager()
      ..addBitmapData('kickstarter_advert', 'resources/udemy_kickstarter_ue4.png')
      ..addBitmapData('plan', 'resources/planOfAction.png')
      ..addBitmapData('timmysNightmare_Title', 'resources/title_timmysNightmare.png')
    //..addVideo('logo_digitalScribes', 'resources/logo_digitalScribes.webm')//logo_digitalScribes.webm
    //..addVideo('timmy_example', 'resources/timmy_example_website_crossfade.mp4')//, new VideoLoadOptions()..loadData=true
    //..addVideo('timmy_example', 'resources/timmy_example_website_crossfade.webm')
      ..addVideo('timmy_example', 'resources/timmy_example_website_ogg_test.ogg')
      ..addVideo('kickstarterTrailer', 'resources/trailer_4_final_TEST_ogg_.ogg')
    //..addVideo('kek', 'https://drive.google.com/open?id=0B9NgZZ99OM6Ac0FUd0twY3RaMlU')
      ..addTextureAtlas('logo_digitalScribes_atlas', 'resources/digitalScribes_logo_atlas/digitalScribes_logo_atlas.atlas', TextureAtlasFormat.LIBGDX)
      ..addBitmapData('button_news', 'resources/icon_news.svg')
      ..addBitmapData('button_tutorials', 'resources/icon_tutorials.svg')
      ..addBitmapData('button_contactUs', 'resources/icon_contactUs.svg')
      ..addBitmapData('button_up','resources/button_place_holder.png')
      ..addBitmapData('button_down', 'resources/button_place_holder_down.png');

    resourceManager.load().then((result){
      //instantiate all elements
      //all elements add themselves to the stack
      new KickstarterAdvert(this);
      new DigitalScribesLogo(this);
      new Navigation(this);
      new RecentNews(this);
      //new Painting();
      //new Painting();
      //new Painting();
      //new Painting();
      //new Painting();
      //Stack.addToStage(stage);


      //stage.addChild(button);
      //stage.addChild(new Bitmap(resourceManager.getBitmapData('kickstarter_advert')));
      addToStage();

      //grab the original height of the canvas from when the website is first loaded.
      //this is used if the website is being rescaled.
      canvasHeight = canvas.height;


      /*print("window innerwidth: " + html.window.innerWidth.toString());
    print("body scroll width: " + body.scrollWidth.toString());
    print("canvas scroll width: " + canvas.scrollWidth.toString());
    print("body cliet width: " + body.clientWidth.toString());
    print("canvas cliet width: " + canvas.clientWidth.toString());*/
      //canvas.width = html.window.innerWidth - (html.window.outerWidth - html.window.innerWidth);
      canvas.width = canvas.width - (canvas.clientWidth - body.clientWidth);
      canvas.height = (canvasHeight * (canvas.width / canvasWidth)).toInt() + canvasHeightBuffer;
    });
  }
}