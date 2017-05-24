import 'package:mailer/mailer.dart';


main(){
  GmailSmtpOptions gmail = new GmailSmtpOptions()
  ..username = 'digitalscribescompany@gmail.com'
  ..password = '';




  var emailTransport = new SmtpTransport(digital_scribes_email);

  Envelope envelope = new Envelope()
    ..from = 'digitalscribes@gmx.com'
    ..bccRecipients.add('jacobegoodson@gmail.com')
    ..subject = 'Testing the Dart Mailer library 語'
    ..text = 'This is a cool email message. Whats up? 語';

  emailTransport.send(envelope)
      .then((envelope) => print('Email sent!'))
      .catchError((e) => print('Error occurred: $e'));
}