import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';

class ButtonContainer extends DisplayObjectContainer {
  List<SimpleButton> buttons;
  ButtonContainer(ResourceManager resourceManager){
    /*SimpleButton button_news = new SimpleButton(
        new Bitmap(resourceManager.getBitmapData('button_news')),
        new Bitmap(resourceManager.getBitmapData('button_news')),
        new Bitmap(resourceManager.getBitmapData('button_news')),
        new Bitmap(resourceManager.getBitmapData('button_news'))
    );*/
    SimpleButton button_tutorials = new SimpleButton(
        new Bitmap(resourceManager.getBitmapData('button_tutorials')),
        new Bitmap(resourceManager.getBitmapData('button_tutorials')),
        new Bitmap(resourceManager.getBitmapData('button_tutorials')),
        new Bitmap(resourceManager.getBitmapData('button_tutorials'))
    );
    SimpleButton button_contactUs = new SimpleButton(
        new Bitmap(resourceManager.getBitmapData('button_contactUs')), //button_contactUs
        new Bitmap(resourceManager.getBitmapData('button_contactUs')),
        new Bitmap(resourceManager.getBitmapData('button_contactUs')),
        new Bitmap(resourceManager.getBitmapData('button_contactUs'))
    );

    button_tutorials.onMouseUp.listen((MouseEvent event){
      html.window.location.href = 'tutorials.html';
    });
    button_contactUs.onMouseUp.listen((MouseEvent event){
      html.window.location.href = 'contact_us.html';
    });

    buttons = new List<SimpleButton>();
    buttons
      //..add(button_news)
      ..add(button_tutorials)
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
   //button_tutorials.x = button_news.width + padding;
   //addChild(button_news);
   addChild(button_tutorials);
   addChild(button_contactUs);
  }
}