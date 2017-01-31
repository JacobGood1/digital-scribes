import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'color.dart' as color;

class DigitalScribesLogo extends Group {
  num height;
  DigitalScribesLogo(ResourceManager resourceManager){
    var video = resourceManager.getVideo('logo_digitalScribes');
    //video.videoElement
    var videoObject = new VideoObject(video);
    videoObject.scaleX = 2;
    videoObject.scaleY = 2;
    videoObject.x = this.width / 2 - videoObject.width / 2;
    height = videoObject.height;


    videoObject.loop = true;
    videoObject.play();

    var gradient = new GraphicsGradient.linear(x, y + height, x, y);
    gradient.addColorStop(0, color.rgb(r: 48, b: 48, g: 48, a: 255)); //color.rgb([255, 0, 0])
    gradient.addColorStop(1, color.rgb(r: 0, b: 0, g: 0, a: 255));
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

    addChild(shape);
    addChild(videoObject);

    super.setupPosition();
    //height = video.videoElement.videoHeight;
    //video.loop = true;
    //video.play();
    //var bitmapData = new BitmapData.fromVideoElement(video.videoElement);
    //var bitmap = new Bitmap(bitmapData);
    //addChild(bitmap);
  }
}