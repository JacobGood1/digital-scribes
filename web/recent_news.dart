import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'color.dart' as color;
import 'main.dart' as main;

class RecentNews extends Group {
  num height = 1200;
  num elementYOffset = 0;
  final String text =
      'Filet mignon leberkas pig pork chop biltong, short loin strip steak turkey brisket '
      'venison. Pastrami venison pancetta, leberkas pork chop chicken prosciutto beef ribs '
      'bresaola kielbasa swine biltong capicola. Hamburger beef ribs ball tip drumstick salami '
      'pig. Capicola pork loin shank, salami chicken hamburger tail. Sirloin spare ribs '
      'ground round cow strip steak prosciutto swine bacon corned beef.';

  RecentNews(ResourceManager resourceManager){
    pushUp = 1;

    /*//background
    var gradient = new GraphicsGradient.linear(x, y + height, x, y);
    gradient.addColorStop(1, color.rgb(r: 48, b: 48, g: 48, a: 255));
    gradient.addColorStop(0, color.rgb(r: 0, b: 0, g: 0, a: 255));
    var shape = new Shape();
    shape.graphics
      ..beginPath()
      ..moveTo(x,y)
      ..lineTo(x + width, y)
      ..lineTo(x + width, y + height)
      ..lineTo(x, y + height)
      ..closePath()
    //..fillColor(color1);
      ..fillGradient(gradient);

    addChild(shape);*/

    var background = new BitmapData(width, height, color.rgb(r: 0, g: 0, b: 0, a: 255));
    var backgroundBitmap = new Bitmap(background);
    addChild(backgroundBitmap);

    Bitmap action = new Bitmap(resourceManager.getBitmapData('plan'));
    action.x = width / 2 - action.width / 2;
    action.y = y + 100;
    addChild(action);

    elementYOffset += action.y + action.height + 50;

    var textField = new TextField();
    var textFormat = new TextFormat('Helvetica,Arial', 30, Color.White, align: TextFormatAlign.CENTER);
    textField.defaultTextFormat = textFormat;
    textField.text = text;
    textField.y = elementYOffset;
    textField.width = 920;
    textField.height = 300;
    textField.x = width / 2 - textField.width / 2;
    textField.wordWrap = true;
    addChild(textField);

    elementYOffset += textField.y;// + textField.height + 50;

    var video = resourceManager.getVideo('timmy_example');//
    var videoObject = new VideoObject(video);
    videoObject.scaleX = 1;
    videoObject.scaleY = 1;
    videoObject.x = this.width / 2 - videoObject.width / 2;
    videoObject.y = elementYOffset;
    //height = videoObject.height;
    videoObject.loop = true;
    videoObject.play();
    //addChild(videoObject);

    var element = html.querySelector('#htmlObject');
    var htmlObject = new HtmlObject(element);
    htmlObject.x = this.width / 2 - videoObject.width / 2;
    htmlObject.y = elementYOffset;

    html.SourceElement vidSource = new html.SourceElement();
    vidSource.src = "resources/timmy_example_website.webm";
    vidSource.type = "video/webm";
    element.append(vidSource);
    addChild(htmlObject);

    //elementYOffset += videoObject.y + videoObject.height + 50;

    //final height of this container
    height = videoObject.y + videoObject.height;//elementYOffset + videoObject.y;// + videoObject.height;//textField.y + textField.height;
    super.setupPosition();
  }
}