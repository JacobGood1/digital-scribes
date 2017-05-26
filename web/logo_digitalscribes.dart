import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'color.dart' as color;
import 'page.dart';

class DigitalScribesLogo extends Group{
  num height;
  //Juggler juggler;
  //List bitmapDatas;

  DigitalScribesLogo(Page page) : super(page){
    renderLayer = 0;
    //juggler = page.stage.juggler;
    /*var video = resourceManager.getVideo('logo_digitalScribes');
    //video.videoElement
    var videoObject = new VideoObject(video);
    videoObject.scaleX = 2;
    videoObject.scaleY = 2;
    videoObject.x = this.width / 2 - videoObject.width / 2;
    height = videoObject.height;

    videoObject.loop = true;
    videoObject.play();*/

    /*bitmapDatas = page.resourceManager.getTextureAtlas('logo_digitalScribes_atlas').getBitmapDatas('digitalScribes_logo');
    FlipBook flipBook = new FlipBook(bitmapDatas, 60)
    ..play()
    ;
    flipBook.x = this.width / 2 - flipBook.width / 2;
    //flipBook.y = this.height / 2 - flipBook.height;// / 2;
    flipBook.y = this.height; - flipBook.height / 2;// + flipBook.height;// / 2;
    juggler.add(flipBook);
    height = flipBook.height;*/


    //TODO - converting video to gifs
    /*var digitalScribes_logo_video = page.resourceManager.getVideo('digitalScribes_logo'); //digitalScribes_logo
    digitalScribes_logo_video.loop = true;
    digitalScribes_logo_video.play();
    var digitalScbribes_logo_vidObj = new VideoObject(digitalScribes_logo_video);
    addChild(digitalScbribes_logo_vidObj);
    digitalScbribes_logo_vidObj.x = this.width / 2 - digitalScbribes_logo_vidObj.width / 2;
    digitalScbribes_logo_vidObj.y = this.height;// / 2 - digitalScbribes_logo_vidObj.height / 2;
    height = digitalScbribes_logo_vidObj.height;


    digitalScbribes_logo_vidObj.filters = [

      new AlphaMaskFilter(page.resourceManager.getBitmapData('digitalScribes_logo_mask'))
      //new ChromaKeyFilter(backgroundColor: color.rgb(r: 0, b: 0, g: 255, a: 255), solidThreshold: 140, invisibleThreshold: 20)
    ];*/
    //digitalScbribes_logo_vidObj.scaleY = -1;


    /*digitalScbribes_logo_vidObj.applyCache(
        digitalScbribes_logo_vidObj.x,
        digitalScbribes_logo_vidObj.y,
        digitalScbribes_logo_vidObj.width,
      digitalScbribes_logo_vidObj.height
    );*/

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
    //addChild(digitalScbribes_logo_vidObj);
    //addChild(videoObject);
    //flipBook.addTo(this);

    super.setupPosition();
    //height = video.videoElement.videoHeight;
    //video.loop = true;
    //video.play();
    //var bitmapData = new BitmapData.fromVideoElement(video.videoElement);
    //var bitmap = new Bitmap(bitmapData);
    //addChild(bitmap);
  }
}