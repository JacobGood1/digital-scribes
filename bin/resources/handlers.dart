part of server;


@Route("/")
Future shelfStatic(HttpRequest request) {
  io.handleRequest(request, createStaticHandler(cmdArgs['static'], defaultDocument: 'index.html'));
}

class Handlers extends Vane {

  var pipeline = [Log, Cors, This];

  String collectionName = "emails";

  @Route("/api/get_emails", method: GET)
  Future get_emails() {
    mongodb.then((mongodb) {
      var postColl = mongodb.collection(collectionName);

      // Find all posts but exclude _id from the results
      postColl.find(where.excludeFields(["_id"])).toList().then((data) {
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

  @Route("/api/add_email", method: POST)
  Future add_email() {
    mongodb.then((mongodb) {
      var postColl = mongodb.collection(collectionName);
      // Insert new post with data from the pre-processed json body
      postColl.insert(params).then((data) {
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
