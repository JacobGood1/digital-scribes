part of server;


GmailSmtpOptions gmail = new GmailSmtpOptions()
  ..username = envVars['SMTP_USER']
  ..password = envVars['SMTP_PASSWORD'];

var emailTransport = new SmtpTransport(gmail);

send_emails(List<String> emails, String subject, String body){

  List<Envelope> envelopes = [];

  emails.forEach((e) {
    envelopes.add(
        new Envelope()
          ..from = 'digitalscribescompany@gmail.com'
          ..recipients = [e]
          ..subject = subject
          ..text = body
    );
  });

  envelopes.forEach((e){
    emailTransport.send(e)
        .then((envelope) => print('Email sent!'))
        .catchError((e) => print('Error occurred: $e'));
  });
}

notify_new_subsciber(String subscriber){
  send_emails(['digitalscribescompany@gmail.com'], 'New Subscriber', subscriber);
}

