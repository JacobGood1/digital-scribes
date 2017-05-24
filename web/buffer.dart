import 'dart:html' as html;

class Buffer {
  html.ImageElement buffer = html.querySelector('#buffer');
  double opacity = 1.0;
  Buffer(){
    //reset html element's opacity back to default
    buffer.style.opacity = '1.0';
    opacity = 1.0;
    //start animation loop
    html.window.animationFrame.then(_update);
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
}