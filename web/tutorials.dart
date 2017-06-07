import 'package:stagexl/stagexl.dart';
import 'page.dart';
import 'logo_digitalscribes.dart';
import 'navigation_courses.dart';
import 'courses_advert.dart';
import 'tutorials_available_courses.dart';
import 'buffer.dart';

class Tutorials extends Page{

  Tutorials () {
    resourceManager = new ResourceManager()
      ..addBitmapData('courses_logo', 'resources/courses_logo.png')
      ..addVideo('digitalScribes_logo', 'resources/digitalScribes_logo.mp4')
      ..addBitmapData('digitalScribes_logo_mask', 'resources/digitalScribes_logo_mask.png')
      ..addBitmapData('button_ingameImg_spaceGoblins', 'resources/course_button_ingameImg_spaceGoblins.png')
      ..addBitmapData('button_ingameImg_iceDrifter', 'resources/course_button_ingameImg_iceDrifter.png')
      ..addBitmapData('button_ingameImg_timmysNightmare', 'resources/course_button_ingameImg_timmysNightmare.png')
      ..addBitmapData('title_spaceGoblins', 'resources/title_spaceGoblins.png')
      ..addBitmapData('title_iceDrifter', 'resources/title_iceDrifter.png')
      ..addBitmapData('title_timmysNightmare', 'resources/title_timmysNightmare.png')
      ..addBitmapData('work_in_progress', 'resources/work_in_progress.png')
      //button HOME
      ..addTextureAtlas('button_home_idle', 'resources/atlas_button_home_idle.json', TextureAtlasFormat.JSONARRAY)
      ..addTextureAtlas('button_home_mouseOver', 'resources/atlas_button_home_mouseOver.json', TextureAtlasFormat.JSONARRAY)
      //button COURSES
      ..addTextureAtlas('button_courses_idle', 'resources/atlas_button_courses_idle.json', TextureAtlasFormat.JSONARRAY)
      ..addTextureAtlas('button_courses_mouseOver', 'resources/atlas_button_courses_mouseOver.json', TextureAtlasFormat.JSONARRAY)
      //button SUBSCRIBE
      ..addTextureAtlas('button_subscribe_idle', 'resources/atlas_button_subscribe_idle.json', TextureAtlasFormat.JSONARRAY)
      ..addTextureAtlas('button_subscribe_mouseOver', 'resources/atlas_button_subscribe_mouseOver.json', TextureAtlasFormat.JSONARRAY)
    ;

    resourceManager.load().then((result){
      new Buffer();
      //instantiate all elements - create an abstract element tree
      new CoursesAdvert(this);
      new DigitalScribesLogo(this);
      //new NavigationCourses(this);
      new AvailableCourses(this);

      //an abstract element tree has been created, use that information and add all elements to the stage.
      addToStage();
      finalizeCanvasDimensions();
    });
  }
}