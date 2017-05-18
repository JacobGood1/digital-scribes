import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';

class ButtonContainer extends DisplayObjectContainer {
  List<DisplayObject> buttons;
  ButtonContainer(ResourceManager resourceManager){
    var button_subscribe = new TextField();
    button_subscribe.defaultTextFormat = new TextFormat('Monda', 100, Color.GreenYellow, align: "center");
    button_subscribe.text = "Subscribe to DigitalScribes";// "mailing list and stay up to date with current news.";
    button_subscribe.width = this.width;// = 1350;
    button_subscribe.height = 140;
    button_subscribe.x = 0;
    //textField.y = 20;
    button_subscribe.wordWrap = false;
    button_subscribe.filters = [
      new GlowFilter(Color.GreenYellow, 60, 60, 5)
    ];
    var button_subscribe_mouseOver = new TextField();
    button_subscribe_mouseOver.defaultTextFormat = new TextFormat('Monda', 100, Color.Cyan, align: "center");
    button_subscribe_mouseOver.text = "Subscribe to DigitalScribes";// "mailing list and stay up to date with current news.";
    button_subscribe_mouseOver.x = 0;
    //textField.y = 20;
    button_subscribe_mouseOver.width = width;// = 1350;
    button_subscribe_mouseOver.height = 140;
    button_subscribe_mouseOver.wordWrap = false;
    button_subscribe_mouseOver.filters = [
      new GlowFilter(Color.Cyan, 60, 60, 5)
    ];
    //button_subscribe.applyCache(0, 0, 1350, 140);

    //addChild(textField);
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
    SimpleButton button_test = new SimpleButton(
        button_subscribe,
        button_subscribe_mouseOver,
        button_subscribe_mouseOver,
        button_subscribe
    );
    button_test.onMouseClick.listen((MouseEvent event){
      html.window.location.href = 'tutorials.html';
    });
    button_tutorials.onMouseUp.listen((MouseEvent event){
      html.window.location.href = 'tutorials.html';
    });
    button_contactUs.onMouseUp.listen((MouseEvent event){
      html.window.location.href = 'contact_us.html';
    });

    buttons = new List<SimpleButton>();
    buttons
      //..add(button_news)
      //..add(button_tutorials)
      //..add(button_contactUs)
      ..add(button_test)
    ;
   var padding = 10.0;
   var placement = 0.0;

    var text_subscribeInfo = new TextField();
    text_subscribeInfo.defaultTextFormat = new TextFormat('Monda', 60, Color.Azure, italic:true, align: "center");
    text_subscribeInfo.text = "and stay up to date with current news.";
    text_subscribeInfo.width = width;//1160;
    text_subscribeInfo.height = 140;
    //text_subscribeInfo.x = (button_subscribe.x + (button_subscribe.width/2)) - text_subscribeInfo.width / 2;
    //text_subscribeInfo.y = button_subscribe.y + (button_subscribe.height - 10);
    text_subscribeInfo.wordWrap = false;
    addChild(text_subscribeInfo);

   buttons.forEach((SimpleButton button){
     this.width += button.width;
     button.x += placement;
     placement += button.width + padding;
     addChild(button);
   });
   //this.width = 5000;
   //this.width += padding * (buttons.length - 1);
   //button_news.x = 0.0;
   //button_tutorials.x = button_news.width + padding;
   //addChild(button_news);
    //addChild(button_tutorials);
    //addChild(button_contactUs);


  }
}

/*var textField = new TextField();
textField.defaultTextFormat = new TextFormat('Spicy Rice', 30, Color.Azure);
textField.text = 'Testing font';
textField.x = 20;
textField.y = 20;
textField.width = 100;
textField.height = 50;
textField.wordWrap = false;
addChild(textField);*/