import 'package:stagexl/stagexl.dart';
import 'main.dart' as main;
import 'group.dart';
import 'color.dart' as color;

class DigitalScribesLogo extends Group {
  num height;
  Juggler juggler = main.stage.juggler;
  List bitmapDatas;

  DigitalScribesLogo(ResourceManager resourceManager){
    /*var video = resourceManager.getVideo('logo_digitalScribes');
    //video.videoElement
    var videoObject = new VideoObject(video);
    videoObject.scaleX = 2;
    videoObject.scaleY = 2;
    videoObject.x = this.width / 2 - videoObject.width / 2;
    height = videoObject.height;

    videoObject.loop = true;
    videoObject.play();*/

    bitmapDatas = resourceManager.getTextureAtlas('logo_digitalScribes_atlas').getBitmapDatas('digitalScribes_logo');
    FlipBook flipBook = new FlipBook(bitmapDatas, 60)
    ..play()
    ;
    flipBook.x = this.width / 2 - flipBook.width / 2;
    //flipBook.y = this.height / 2 - flipBook.height;// / 2;
    flipBook.y = this.height; - flipBook.height / 2;// + flipBook.height;// / 2;
    juggler.add(flipBook);
    height = flipBook.height;

    var gradient = new GraphicsGradient.linear(x, y + height, x, y);
    gradient.addColorStop(1, color.rgb(r: 48, b: 48, g: 48, a: 0)); //color.rgb([255, 0, 0])
    gradient.addColorStop(0, color.rgb(r: 0, b: 0, g: 0, a: 255));
    Sprite shape = new Sprite();
    shape.graphics
      ..beginPath()
      ..moveTo(x,y)
      ..lineTo(x + width, y)
      ..lineTo(x + width, y + height)
      ..lineTo(x, y + height)
      ..closePath()
      //..fillColor(color1);
      ..fillGradient(gradient)
      ;
    shape.applyCache(x, y, width, height);
    addChild(shape);
    //addChild(videoObject);
    flipBook.addTo(this);

    super.setupPosition();
    //height = video.videoElement.videoHeight;
    //video.loop = true;
    //video.play();
    //var bitmapData = new BitmapData.fromVideoElement(video.videoElement);
    //var bitmap = new Bitmap(bitmapData);
    //addChild(bitmap);
  }
}