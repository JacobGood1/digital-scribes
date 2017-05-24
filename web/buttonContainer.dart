import 'dart:html' as html;
import 'group.dart';
import 'package:stagexl/stagexl.dart';
import 'page.dart';

SimpleButton simpleButton(Juggler juggler, Page page, String idle, String mouseOver){
  TextureAtlas atlas_buttom_home_idle = page.resourceManager.getTextureAtlas(idle);
  List atlas_buttom_home_idle_datas = atlas_buttom_home_idle.getBitmapDatas(idle);
  var flipbook_home_idle = new FlipBook(atlas_buttom_home_idle_datas, 30)..play();
  juggler.add(flipbook_home_idle);

  TextureAtlas atlas_buttom_home_mouseOver = page.resourceManager.getTextureAtlas(mouseOver);
  List atlas_buttom_home_mouseOver_datas = atlas_buttom_home_mouseOver.getBitmapDatas(mouseOver);
  var flipbook_home_mouseOver = new FlipBook(atlas_buttom_home_mouseOver_datas, 30)..play();
  juggler.add(flipbook_home_mouseOver);

  return new SimpleButton(
      flipbook_home_idle,
      flipbook_home_mouseOver,
      flipbook_home_mouseOver,
      flipbook_home_mouseOver
  );
}

class ButtonContainer extends DisplayObjectContainer {
  List<DisplayObject> buttons;
  Juggler juggler_;
  ButtonContainer(Group group, Page page){
    juggler_ = page.stage.juggler;

    SimpleButton home = simpleButton(juggler_, page, 'button_home_idle', 'button_home_mouseOver')
      ..onMouseClick.listen((MouseEvent e){
        html.window.location.href = 'index.html';
      });
    SimpleButton courses = simpleButton(juggler_, page, 'button_courses_idle', 'button_courses_mouseOver')
      ..onMouseClick.listen((MouseEvent e){
        html.window.location.href = 'tutorials.html';
      });
    SimpleButton subscribe = simpleButton(juggler_, page, 'button_subscribe_idle', 'button_subscribe_mouseOver')
      ..onMouseClick.listen((MouseEvent e){
        html.window.location.href = 'subscribe.html';
      });

    buttons = new List<SimpleButton>();
    buttons
      ..add(home)
      ..add(courses)
      ..add(subscribe)
    ;
    var padding = 10.0;
    var placement = 0.0;
    var width = 0;
   buttons.forEach((SimpleButton button){
     width += button.width + padding;
   });

    this.x = group.width / 2 - width / 2;

    buttons.forEach((SimpleButton button){
      button.x += placement;
      placement += button.width + padding;
      addChild(button);
    });

  }
}