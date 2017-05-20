import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';

class ButtonContainer extends DisplayObjectContainer {
  List<DisplayObject> buttons;
  ButtonContainer(ResourceManager resourceManager){

    /*TextureAtlas buttom_home_idle = resourceManager.getTextureAtlas('buttom_home_idle');
    Juggler juggler = stage.juggler;
    List buttom_home_idle_datas = buttom_home_idle.getBitmapDatas('buttom_home_idle');
    var flipBook = new FlipBook(buttom_home_idle_datas, 30)
      ..play();
    SimpleButton button_home = new SimpleButton(
        flipBook,
        flipBook,
        flipBook,
        flipBook
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
      //..add(button_home);
      //..add(button_news)
      //..add(button_tutorials)
      //..add(button_contactUs)
    ;
   var padding = 10.0;
   var placement = 0.0;

   buttons.forEach((SimpleButton button){
     this.width += button.width;
     button.x += placement;
     placement += button.width + padding;
     addChild(button);
   });

   //juggler.add(flipBook);
   //juggler.delayCall(, delay)
  }
}