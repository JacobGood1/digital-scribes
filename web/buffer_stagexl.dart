import 'dart:html' as html;
import 'group.dart';

import 'package:stagexl/stagexl.dart';
import 'page.dart';

class BufferStageXL {
  html.ImageElement buffer = new html.ImageElement(src:'resources/buffer.gif');//html.querySelector('#buffer');
  double opacity = 1.0;
  num height = 0;
  HtmlObject buff;
  HtmlObject htmlObj;
  Group group;
  html.Element e;
  Page page;

  BufferStageXL(Page page, Group group, html.Element e, HtmlObject htmlObj, num x, num y, num height){
    this.page = page;
    this.group = group;
    this.e = e;
    this.height = height;

    //html.querySelector('#stagexlBuffer').children.add(buffer);

    //setup element properties

    buff = new HtmlObject(buffer);
    html.querySelector('#stagexlBuffer').children.add(buffer);

    this.htmlObj = htmlObj;

    //var divObj = new HtmlObject(div);
    //divObj.y = y;
    //div.style.left = (group.width / 2 - buffer.width / 2).toString() + 'px';
    //buffer.style.display = 'block';
    //buffer.style.marginLeft = 'auto';
    //buffer.style.marginRight = 'auto';

    //buffer.style.left = (group.width / 2 - buffer.width / 2).toString() + 'px';
    //buffer.style.left = (html.window.innerWidth / 2).toString();//(html.window.innerWidth / 2 - buffer.width / 2).toString() + 'px';
    //buffer.style.top = y.toString() + 'px';



    //reset html element's opacity back to default
    buffer.style.opacity = '1.0';
    opacity = 1.0;

    html.window.animationFrame.then(_update2);

    //start animation loop
    e.onLoad.listen((e) {
      html.window.animationFrame.then(_update);
    });
  }

  void _update(num time){

    //opacity speed
    opacity -= 0.03;

    buffer.style.opacity = opacity.toString();

    //animation loop recalls itself while opacity is not less than 0
    if (opacity >= 0.0) {
      html.window.animationFrame.then(_update);
    } else {
      //set opacity to zero.
      buffer.style.opacity = '0.0';
    }
  }
  void _update2(num time){

    buffer.id = 'buffer_stageXL';
    //buffer.style.opacity = '1.0';
    buffer.style.width = 'auto';
    buffer.style.height = (page.canvas.height * 0.16).toString() + 'px';//height.toString() + 'px';
    buffer.style.position = 'absolute';
    //buffer.style.margin = 'auto';
    buffer.style.pointerEvents = 'none';
    buffer.style.zIndex = '1';
    //this.width / 2 - int.parse(video_timmysNightmare.width) / 2;
    //buffer.style.left = (group.width / 2 - int.parse(e.style.width)).toString() + 'px';
    buffer.style.left = (page.canvas.width / 2 - buffer.width / 2).toString() + 'px';
    buffer.style.top = (page.canvas.height * 0.5 - buffer.height / 2).toString() + 'px';
    buffer.style.visibility='visible';
    if (opacity > 0.0) {
      html.window.animationFrame.then(_update2);
    }
  }
}