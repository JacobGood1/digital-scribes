part of server;


@Route("/")
Future shelfStatic(HttpRequest request) {
  io.handleRequest(request, createStaticHandler(cmdArgs['static'], defaultDocument: 'index.html'));
}

class ClientHandlers extends Vane {

  var pipeline = [AuthPostsFromClient,Log, Cors, This];

  String collectionName = "emails";
  @Route("/api/add_email", method: POST)
  Future add_email() {
    mongodb.then((mongodb) {
      var postColl = mongodb.collection(collectionName);
      // Insert new post with data from the pre-processed json body
        postColl.insert(params).then((data) {
          send_emails(
              [params['email']],
              'Welcome!',
              'You are now subscribed! You will be notified when the Kickstarter campaign has officially started.'
          );
          notify_new_subsciber(params['email']);
        log.info("Added email: ${params['email']}");
        close();
      }).catchError((e) {
        log.warning("Unable to save email: ${e}");
        close("Unable to save email!");
      });
    }).catchError((e) {
      log.warning("Unable to save email: ${e}");
      close("Unable to save email!");
    });

    return end;
  }



}

class ProtectedRoutes extends Vane {
  var pipeline = [AuthPostsFromTerminal,Log, Cors, This];

  String collectionName = "emails";

  @Route("/api/notify_start", method: POST)
  Future notify_start() {
    var emails = [];
    mongodb.then((mongodb) {
      var postColl = mongodb.collection(collectionName);

      // Find all posts but exclude _id from the results
      postColl.find(where.excludeFields(["_id"])).toList().then((data) {
        data.forEach((m){
          emails.add(m['email']);
        });
        //TODO add a link or something, make the words better perhaps?
        send_emails(
            emails,
            'It has begun!',
            'The Kickstarter for Learning How to Program using Unreal and Skookum has started!');
        log.info("Got ${data.length} email(s)");
        close(data);
      }).catchError((e) {
        log.warning("Unable to get email(s): ${e}");
        close(new List());
      });
    }).catchError((e) {
      log.warning("Unable to get email(s): ${e}");
      close(new List());
    });

    return end;
  }

  /// Remove all posts in collection "posts"
  @Route("/api/delete_emails", method: DELETE)
  Future delete_emails() {
    mongodb.then((mongodb) {
      var postColl = mongodb.collection(collectionName);

      // Remove all posts
      postColl.remove().then((data) {
        log.info("Removed ${data["n"]} emails");
        close("Removed ${data["n"]} emails");
      }).catchError((e) {
        log.warning("Unable to delete emails: ${e}");
        close("Unable to delete emails");
      });
    }).catchError((e) {
      log.warning("Unable to delete emails: ${e}");
      close("Unable to delete emails");
    });

    return end;
  }
}

class AuthPostsFromTerminal extends Vane {
  Future main() {
    var secretToken = envVars['AUTH_TOKEN'];
    if(secretToken == req.headers.value("pwd")) {
      return next();
    } else {
      writeln("Unauthorized");
      return close();
    }
  }
}

class AuthPostsFromClient extends Vane {
  Future main() {
    var secretToken = envVars['AUTH_CLIENT'];
    if(secretToken == envVars['AUTH_TOKEN'] + envVars['CLIENT_TOKEN']) {
      log.info("here");
      return next();
    } else {
      writeln("Unauthorized");
      return close();
    }
  }
}



