import 'page.dart';
import 'home.dart' as home;
import 'dart:async';

Page page;

Future<String> waitFor(Duration timeout, int order) {
  var completer = new Completer();

  var timer = new Timer(timeout, (){
    var now = new DateTime.now();
    completer.complete("$order: ${now.toString()}");
  });

  return completer.future;
}

Future main() async {
  //page = new home.Home();
  home.Home h = new home.Home();
  h.load_assets();
  var time = new DateTime.now().millisecondsSinceEpoch;

while(h.counter < 4) {
  await Future.wait([waitFor(new Duration(milliseconds: 1), 1)]);
  print("waiting");
}
  h.addToStage();
  h.finalizeCanvasDimensions();
  print("TIME: ${new DateTime.now().millisecondsSinceEpoch - time}");
//}
  //home.addToStage();
  //finalizeCanvasDimensions();
}