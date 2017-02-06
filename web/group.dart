import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'page.dart';

class Group extends DisplayObjectContainer {

  Page page;
  int renderLayer = 0;
  var resY;
  num width = 1920;//html.window.innerWidth;//1920;//html.window.innerWidth;//

  /*set y (n) => super.y = n;
  set height (n) => super.height = n;

  get y => super.y;
  get height => super.height;*/


  //html.CanvasElement canvas;
  //Stage stage;
  Group(Page page) {

    this.page = page;
    //canvas = main.canvas;
    //stage = main.stage;
  }



  Group setupPosition () {
    /*
    * setupPosition builds an abstract representation of elements and how they will be placed on the stage.
    * elements are first added to a global element list (page) and to a renderLayer list.
    * just note: we are NOT adding elements directly to the stage from here!!! the stage will remain EMPTY during this process!!
    */


    var yOffset = 0;
    //stage.children.forEach((DisplayObjectContainer container) => yOffset += (container.height * container.scaleY));
    print(page.groups);
    page.groups.forEach((DisplayObjectContainer container){
      print("container: " + container.toString() + " height: " + container.height.toString() + " scaleY: " + container.scaleY.toString());
      yOffset += (container.height * container.scaleY);
    });
    //print("group: " + (main.canvas.clientWidth - main.body.clientWidth).toString());

    //this.scaleX = ((html.window.innerWidth) / width); //main.canvas.width
    this.scaleX = (page.canvas.width + (page.canvas.clientWidth - page.body.clientWidth)) / width;
    this.scaleY *= scaleX;

    y += yOffset;

    //renderOrder is made on-the-fly to accommodate any amount of rendering layers.
    //check if a render layer exists for this renderOrder, if not, add a new layer.
    /*if (page.renderLayers.length < renderLayer + 1) {
      for (int i = page.renderLayers.length; i < renderLayer + 1; i++) {
        page.renderLayers.add(new List<DisplayObjectContainer>());
      }
    }*/

    //page.stage.addChild(this);
    page.renderLayers[renderLayer].add(this);
    page.canvas.height += (height * scaleY).toInt();

    page.groups.add(this);

    //main.canvas.width = (main.canvas.width - (main.canvas.clientWidth - main.body.clientWidth));

    return this;
  }
}