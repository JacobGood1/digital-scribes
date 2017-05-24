import 'dart:html' as html;
import 'dart:html';
import 'package:stagexl/stagexl.dart';
import 'group.dart';
import 'color.dart' as color;
import 'page.dart';

class AboutUsInfo extends Group {
  num height = 1200;
  num elementYOffset = 20;

  AboutUsInfo(Page page) : super(page){

    injectHtml();
    var background = new BitmapData(width, height, color.rgb(r: 0, g: 0, b: 0, a: 255));
    var backgroundBitmap = new Bitmap(background);
    addChild(backgroundBitmap);

    /*var textField = new TextField();
    var textFormat = new TextFormat('Helvetica,Arial', 30, Color.White, align: TextFormatAlign.CENTER);
    textField.defaultTextFormat = textFormat;
    textField.text = text1;
    textField.y = elementYOffset;
    textField.width = width;//1100;
    textField.height = 1000;
    textField.x = width / 2 - textField.width / 2;
    //textField.wordWrap = true;
    addChild(textField);

    elementYOffset = textField.y + textField.height;*/ //textField.y;

    var label1 = new TextField();
    label1.defaultTextFormat = new TextFormat('Monda', 30, Color.WhiteSmoke, align: "center");
    label1.text = "Stay up to date with the progress of the Kickstarter and new courses released on Udemy by joining our mailing list!";
    label1.width = width;
    label1.height = 50;
    label1.x = 0;// = (width / 2) - i.width/2;
    label1.y = elementYOffset;//20;
    label1.wordWrap = false;
    elementYOffset = label1.y + label1.height;
    addChild(label1);

    html.DivElement divEmail = html.querySelector('#divEmail');
    var divEmailObject = new HtmlObject(divEmail);
    divEmailObject.x = this.width / 2 - divEmail.clientWidth / 2;//int.parse(divEmailObject.width) / 2;
    divEmailObject.y = elementYOffset + 5;
    addChild(divEmailObject);
    elementYOffset = divEmailObject.y + divEmail.clientHeight;//int.parse(emailHtmlElement.height) + 50;
    //check if emails match
    html.InputElement email = html.querySelector(('#email'));
    html.InputElement emailConfirm = html.querySelector(('#emailConfirm'));
    email.onKeyUp.listen((Event){
      if (email.value == emailConfirm.value) {
        emailConfirm.style.borderColor = '#99ff99';
      } else {
        emailConfirm.style.borderColor = '#ff3300';
      }
    });
    emailConfirm.onKeyUp.listen((Event){
      if (email.value == emailConfirm.value) {
        emailConfirm.style.borderColor = '#99ff99';
      } else {
        emailConfirm.style.borderColor = '#ff3300';
      }
    });


    var label2 = new TextField();
    label2.defaultTextFormat = new TextFormat('Monda', 30, Color.WhiteSmoke, align: "center");
    label2.text = "Have any questions? Feel free to contact us at digitalscribescompany@gmail.com";
    label2.width = width;
    label2.height = 50;
    label2.x = 0;// = (width / 2) - i.width/2;
    label2.y = elementYOffset + 5;//20;
    label2.wordWrap = false;
    elementYOffset = label2.y + label2.height;


    html.InputElement submitButton = html.querySelector('#submitButton');
    submitButton.onMouseUp.listen((Event){
      if (email.value == emailConfirm.value && email.value.length > 0) {
        //send email to server!
        html.FormElement formEmail = html.querySelector('#formEmail');
        var data = {
          'email': emailConfirm.value
        };
        HttpRequest.postFormData('/api/add_email', data);
        //formEmail.submit();
        //change form's appearance to show it has been successful

        email.remove();
        emailConfirm.remove();
        submitButton.remove();
        formEmail.insertAdjacentText('beforeend', 'SUBSCRIBED!');
        formEmail.style.fontSize = '350%';
        formEmail.style.color = '#99ff99';
        divEmailObject.x = this.width / 2 - divEmail.clientWidth / 2;//int.parse(divEmailObject.width) / 2;
        //divEmailObject.y = i.y + i.height + 50;//i.y + (i.y - ((i.y + i.height)) / 2);//elementYOffset + 5;
        divEmailObject.y = (label1.y + label1.height + ((label2.y - (label1.y + label1.height)) / 2));//elementYOffset + 5;

        //html.LabelElement success = new Element.html('SUCCESS!');
        //formEmail.children.add(success);
      } else {
        //emails do not match...
      }
    });



    /*var email_label = new TextField();
    email_label.defaultTextFormat = new TextFormat('Monda', 30, Color.WhiteSmoke, align: "center");
    email_label.text = "Email:";
    email_label.width = 100;//width;
    email_label.height = 50;
    email_label.x = email.x - email_label.width - 8;// = (width / 2) - email_label.width/2;
    email_label.y = email.y - 16;//20;
    email_label.wordWrap = false;
    elementYOffset = email_label.y + email_label.height;
    addChild(email_label);*/


    addChild(label2);

    height = elementYOffset;// + 10;
    super.setupPosition();
  }

  void injectHtml(){
    var div = new DivElement();
    div.id = 'divEmail';
    var form = new FormElement();
    form.id = 'formEmail';
    var input1 = new InputElement()
      ..type="text"
      ..id="email"
      ..value=""
      ..placeholder="Email.."
    ;
    var input2 = new InputElement()
      ..type="text"
      ..id="emailConfirm"
      ..value=""
      ..placeholder="Confirm Email.."
    ;
    var button = new InputElement()
      ..type="button"
      ..id="submitButton"
      ..value="Submit"
    ;
    form.children.add(input1);
    form.children.add(input2);
    form.children.add(button);
    div.children.add(form);
    querySelector('#body').children.add(div);
  }
}