import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'color.dart' as color;
import 'page.dart';

SimpleButton lockedButton(Group group, int elementYOffset, String ingameImg, String titleImg, int padding){
  BitmapData lock = group.page.resourceManager.getBitmapData('work_in_progress');
  BitmapData ingame = group.page.resourceManager.getBitmapData(ingameImg);
  BitmapData title = group.page.resourceManager.getBitmapData(titleImg);
  num title_overlap = 0.8 * title.height;
  BitmapData bitmapData = new BitmapData(
      ingame.width, ingame.height + title.height + padding,
      Color.Transparent
  );
  bitmapData.drawPixels(ingame, ingame.rectangle, new Point(0, title_overlap));
  bitmapData.drawPixels(title, title.rectangle, new Point(ingame.width/2 - title.width/2, 0));

  Bitmap bitmap = new Bitmap(bitmapData);
  bitmap.filters = [new GlowFilter(
    color.rgb(a: 255, r: 255, b: 255, g: 255),
    10, 10,
    5
  )];
  bitmap.x = group.width / 2 - bitmap.width / 2;
  //bitmap.y = elementYOffset;
  Bitmap blur_bitmap = new Bitmap(bitmapData.clone());
  blur_bitmap.x = group.width / 2 - blur_bitmap.width / 2;
  //blur_bitmap.y = elementYOffset;
  blur_bitmap.filters = [new BlurFilter(20, 20, 5)];
  Bitmap bitmap_locked = new Bitmap(blur_bitmap.bitmapData.clone()); //blur_bitmap.bitmapData.clone()
  bitmap_locked.bitmapData.drawPixels(lock, lock.rectangle, new Point(blur_bitmap.width / 2 - lock.width / 2, blur_bitmap.height / 2 - lock.height / 2));

  return new SimpleButton(
      bitmap,
      blur_bitmap,
      blur_bitmap,
      blur_bitmap
  );
}

class AvailableCourses extends Group {
  num height = 1200;
  num elementYOffset = 100;

  AvailableCourses(Page page) : super(page){
    int button_title_padding = 20;


    //elementYOffset = spaceGoblins.y + spaceGoblins.height;

    var background = new BitmapData(width, height, color.rgb(r: 0, g: 0, b: 0, a: 255));
    var backgroundBitmap = new Bitmap(background);
    addChild(backgroundBitmap);

    SimpleButton button_spaceGoblins = lockedButton(
        this,
        elementYOffset,
        'button_ingameImg_spaceGoblins',
        'title_spaceGoblins',
        button_title_padding);
    button_spaceGoblins.y = elementYOffset;
    elementYOffset = button_spaceGoblins.y + button_spaceGoblins.height;
    SimpleButton button_iceDrifter = lockedButton(
        this,
        elementYOffset,
        'button_ingameImg_iceDrifter',
        'title_iceDrifter',
        button_title_padding);
    button_iceDrifter.y = elementYOffset;
    elementYOffset = button_iceDrifter.y + button_iceDrifter.height;
    SimpleButton button_timmysNightmare = lockedButton(
        this,
        elementYOffset,
        'button_ingameImg_timmysNightmare',
        'title_timmysNightmare',
        button_title_padding);
    button_timmysNightmare.y = elementYOffset;
    elementYOffset = button_timmysNightmare.y + button_timmysNightmare.height;

    addChild(button_spaceGoblins);
    addChild(button_iceDrifter);
    addChild(button_timmysNightmare);

    height = elementYOffset;// + 10;
    super.setupPosition();
  }
}