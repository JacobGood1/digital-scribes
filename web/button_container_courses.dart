import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';

class ButtonContainer extends DisplayObjectContainer {
  List<SimpleButton> buttons;
  ButtonContainer(ResourceManager resourceManager){
    SimpleButton button_contactUs = new SimpleButton(
        new Bitmap(resourceManager.getBitmapData('button_contact_us')),
        new Bitmap(resourceManager.getBitmapData('button_contact_us')),
        new Bitmap(resourceManager.getBitmapData('button_contact_us')),
        new Bitmap(resourceManager.getBitmapData('button_contact_us'))
    );
    SimpleButton button_home = new SimpleButton(
        new Bitmap(resourceManager.getBitmapData('button_home')),
        new Bitmap(resourceManager.getBitmapData('button_home')),
        new Bitmap(resourceManager.getBitmapData('button_home')),
        new Bitmap(resourceManager.getBitmapData('button_home'))
    );

    button_contactUs.onMouseUp.listen((MouseEvent event){
      html.window.location.href = 'contact_us.html';
    });
    button_home.onMouseUp.listen((MouseEvent event){
      html.window.location.href = 'index.html';
    });

    buttons = new List<SimpleButton>();
    buttons
      //..add(button_news)
      ..add(button_home)
      ..add(button_contactUs)
    ;
   var padding = 10.0;
   var placement = 0.0;
   buttons.forEach((SimpleButton button){
     this.width += button.width;
     button.x += placement;
     placement += button.width + padding;
   });
   //this.width = 5000;
   //this.width += padding * (buttons.length - 1);
   //button_news.x = 0.0;
   //button_contact_us.x = button_news.width + padding;
   //addChild(button_news);
   addChild(button_home);
   addChild(button_contactUs);
  }
}