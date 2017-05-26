import 'package:stagexl/stagexl.dart';
import 'page.dart';
import 'kickstarter_img.dart';
import 'logo_digitalscribes.dart';
import 'navigation_about_us.dart';
import 'recent_news.dart';
import 'about_us_img.dart';
import 'about_us_info.dart';

class ContactUs extends Page{

  ContactUs () {
    resourceManager = new ResourceManager()
      ..addBitmapData('digitalScribes_logo_still', 'resources/digitalScribes_logo_still.png')
      ..addBitmapData('button_tutorials', 'resources/icon_tutorials.svg')
      ..addBitmapData('button_home', 'resources/icon_home.svg')
      ..addVideo('digitalScribes_logo', 'resources/digitalScribes_logo.mp4')
      ..addBitmapData('digitalScribes_logo_mask', 'resources/digitalScribes_logo_mask.png')
    ;

    resourceManager.load().then((result){
      //instantiate all elements - create an abstract element tree
      new AboutUsImg(this);
      new DigitalScribesLogo(this);
      new NavigationAboutUs(this);
      new AboutUsInfo(this);

      //an abstract element tree has been created, use that information and add all elements to the stage.
      addToStage();
      finalizeCanvasDimensions();
    });
  }
}