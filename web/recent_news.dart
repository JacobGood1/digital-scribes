import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'color.dart' as color;
import 'page.dart';

class RecentNews extends Group {
  num height = 1200;
  num elementYOffset = 0;
  num skookumButtonPosition = 0;
  final String text1 =
  '''
  We are currently in the process of developing a complete course on Udemy,
  aiming to teach how to program by making games!

  Be a part of this endevour and help by funding our Kickstarter campaign!
  ''';

  final String text2 =
  '''
  In this course, you will learn how to program by developing a 2D platformer called "Timmy's Nightmare",
  using a powerful game engine known as the Unreal Engine 4.

  You will develop this game using SkookumScript. 
  SkookumScript is the one and only scripting language available for Unreal Engine 4.
  SkookumScript was designed specifically for the real-time interactive nature of games!
  
  Check out SkookumScript here.
  ''';

  RecentNews(Page page) : super(page){

    var background = new BitmapData(width, height, color.rgb(r: 0, g: 0, b: 0, a: 255));
    var backgroundBitmap = new Bitmap(background);
    addChild(backgroundBitmap);

    Bitmap action = new Bitmap(page.resourceManager.getBitmapData('plan'));
    action.x = width / 2 - action.width / 2;
    action.y = y + 30;
    addChild(action);

    elementYOffset = action.y + action.height + 10;

    var textField = new TextField();
    var textFormat = new TextFormat('Monda', 30, Color.White, align: TextFormatAlign.CENTER);
    textField.defaultTextFormat = textFormat;
    textField.text = text1;
    textField.y = elementYOffset;
    textField.width = width;//1100;
    textField.height = 200;
    textField.x = width / 2 - textField.width / 2;
    //textField.wordWrap = true;
    //addChild(textField);

    /*html.CssStyleDeclaration css = new html.CssStyleDeclaration();
    css.size = '30';
    css.font = 'Helvetica,Arial';
    css.color = 'white';
    css.textAlign = 'center';
    //inject text
    String i = "Test text...";
    html.Text testtext = new html.Text(i);
    html.ParagraphElement divElement = new html.ParagraphElement();

    divElement.append(testtext);
    divElement.style.position = 'absolute';
    divElement.style.left = '0px';
    divElement.style.top = '0px';
    divElement.style.size = '100';
    divElement.style.textAlign = 'center';
    divElement.style.font = 'Helvetica,Arial';
    divElement.style.color = 'white';
    page.body.append(divElement);

    elementYOffset = textField.y + textField.height; //textField.y;*/

    //timmysNightmare trailer video
    //html.IFrameElement kickstarterHtmlElement = html.querySelector('#timmysNightmare');
    html.IFrameElement video_timmysNightmare = new html.IFrameElement()
    ..width = '640'
    ..height = '360'
    ..allowFullscreen = true;
    ;
    video_timmysNightmare.style.border = '0';
    html.querySelector('#body').children.add(video_timmysNightmare);

    //https://drive.google.com/file/d/0B9NgZZ99OM6Ac0FUd0twY3RaMlU/view?usp=sharing
    //html.SourceElement kickstarterTrailer_src = new html.SourceElement();
    //kickstarterTrailer_src.src = "https://www.youtube.com/watch?v=TpUmFruoFAc";//"resources/timmy_example_website.ogv";//"resources/timmy_example_website.webm";
    //kickstarterTrailer_src.type = "video/ogg";//"video/webm";
    //kickstarterHtmlElement.controls = true;
    //kickstarterHtmlElement.append(kickstarterTrailer_src);
    video_timmysNightmare.src = "https://www.youtube.com/embed/TpUmFruoFAc?controls=1";
    var kickstarterTrailer = new HtmlObject(video_timmysNightmare);
    kickstarterTrailer.x = this.width / 2 - int.parse(video_timmysNightmare.width) / 2;
    kickstarterTrailer.y = elementYOffset + 50;
    addChild(kickstarterTrailer);
    elementYOffset = kickstarterTrailer.y + int.parse(video_timmysNightmare.height) + 50;

    /*var video = resourceManager.getVideo('timmy_example');//
    var videoObject = new VideoObject(video);
    videoObject.scaleX = 1;
    videoObject.scaleY = 1;
    videoObject.x = this.width / 2 - videoObject.width / 2;
    videoObject.y = elementYOffset;
    //height = videoObject.height;
    videoObject.loop = true;
    videoObject.play();
    //addChild(videoObject);*/

    var textField2 = new TextField();
    var textFormat2 = new TextFormat('Monda', 30, Color.White, align: TextFormatAlign.CENTER);
    textField2.defaultTextFormat = textFormat2;
    textField2.text = text2;
    textField2.y = elementYOffset;
    textField2.width = width;//1500;
    textField2.height = 350;
    textField2.x = width / 2 - textField2.width / 2;
    //textField.wordWrap = true;
    addChild(textField2);

    elementYOffset = textField2.y + textField2.height; //textField.y;

    //elementYOffset += 5;
    //injectHtml(0);

    Bitmap logo_skookumScript = new Bitmap(page.resourceManager.getBitmapData('logo_skookumScript'));
    //logo_skookumScript.scaleX = 0.3;
    //logo_skookumScript.scaleY = 0.3;
    SimpleButton button_skooumScript = new SimpleButton(
        logo_skookumScript,
        logo_skookumScript,
        logo_skookumScript,
        logo_skookumScript
    );
    button_skooumScript.scaleX = 0.3;
    button_skooumScript.scaleY = 0.3;
    button_skooumScript.onMouseOver.listen((Event event){
      button_skooumScript.scaleX = 0.45;
      button_skooumScript.scaleY = 0.45;
      button_skooumScript.x = this.width / 2 - button_skooumScript.width / 2;
      button_skooumScript.y = skookumButtonPosition - button_skooumScript.height / 2;
    });
    button_skooumScript.onMouseOut.listen((Event event){
      button_skooumScript.scaleX = 0.3;
      button_skooumScript.scaleY = 0.3;
      button_skooumScript.x = this.width / 2 - button_skooumScript.width / 2;
      button_skooumScript.y = skookumButtonPosition - button_skooumScript.height / 2;
    });
    button_skooumScript.onMouseClick.listen((Event event){
      html.window.location.href = 'http://skookumscript.com/';
    });
    addChild(button_skooumScript);
    button_skooumScript.x = this.width / 2 - button_skooumScript.width / 2;
    button_skooumScript.y = elementYOffset;
    //save the position of the button, this is needed for the button's animation.
    skookumButtonPosition = elementYOffset + button_skooumScript.height / 2;
    elementYOffset = button_skooumScript.y + button_skooumScript.height + 50;

    Bitmap timmysNightmare_title = new Bitmap(page.resourceManager.getBitmapData('timmysNightmare_Title'));
    addChild(timmysNightmare_title);
    timmysNightmare_title.x = this.width / 2 - timmysNightmare_title.width / 2;
    timmysNightmare_title.y = elementYOffset;
    elementYOffset = timmysNightmare_title.y + timmysNightmare_title.height + 50;

    //---- embed a video over the stage

    /*html.VideoElement element = html.querySelector('#htmlObject');
    html.SourceElement vidSource = new html.SourceElement();
    vidSource.src = "resources/timmy_example.mp4";//"resources/timmy_example_website.webm";
    vidSource.type = "video/mp4";//"video/webm";
    element.append(vidSource);

    var htmlObject = new HtmlObject(element);
    htmlObject.x = this.width / 2 - element.width / 2;
    htmlObject.y = elementYOffset;

    addChild(htmlObject);*/

    var timmyExample_video = page.resourceManager.getVideo('timmy_example');
    timmyExample_video.loop = true;
    timmyExample_video.play();
    var timmyExample_videoObj = new VideoObject(timmyExample_video);
    addChild(timmyExample_videoObj);
    timmyExample_videoObj.x = this.width / 2 - timmyExample_videoObj.width / 2;
    timmyExample_videoObj.y = elementYOffset;
    //----------------------------------

    //elementYOffset += videoObject.y + videoObject.height + 50;

    //final height of this container
    //height = videoObject.y + videoObject.height;//elementYOffset + videoObject.y;// + videoObject.height;//textField.y + textField.height;
    height = elementYOffset + timmyExample_videoObj.height;// + 10;
    super.setupPosition();
  }

  void injectHtml(int x){
    /*html.DivElement skookumDiv = new html.DivElement()
    ..
    ;*/
    html.AnchorElement skookumLink = new html.AnchorElement()
    ..href = "http://skookumscript.com/"
    //..style.top = '0px'//elementYOffset.toString()
    //..style.zIndex = '1'
    ..innerHtml = "SkookumScript"
    ;
    html.querySelector('#body').children.add(skookumLink);
    //elementYOffset += int.parse(skookumLink.style.height);
  }
}