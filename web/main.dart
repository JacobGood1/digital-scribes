import 'page.dart';
import 'dart:html';
import 'home.dart' as home;

Page page;

void main() {
  page = new home.Home();
}

/*void submitForm(Event e){
  e.preventDefault();
  var request = new HttpRequest();

  request.onReadyStateChange.listen((){});
  var url = 'https://digital-scribes.sourcevoid.net/';
  request.open('POST', url);
  request.send("dsadsad");
  print("hello?");

}*/