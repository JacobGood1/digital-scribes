import 'package:stagexl/stagexl.dart';
import 'group.dart';
class DigitalScribesLogo extends Group {
  num height;
  DigitalScribesLogo(ResourceManager resourceManager){
    overlapTop = 0.0;

    var video = resourceManager.getVideo('logo_digitalScribes');
    //video.videoElement
    var videoObject = new VideoObject(video);
    videoObject.scaleX = 2;
    videoObject.scaleY = 2;
    videoObject.x = this.width / 2 - videoObject.width / 2;
    height = videoObject.height;
    addChild(videoObject);
    videoObject.loop = true;
    videoObject.play();

    super.setupPosition();
    //height = video.videoElement.videoHeight;
    //video.loop = true;
    //video.play();
    //var bitmapData = new BitmapData.fromVideoElement(video.videoElement);
    //var bitmap = new Bitmap(bitmapData);
    //addChild(bitmap);
  }
}