part of server;

@Route("/")
void shelfStatic(HttpRequest request) {
  shelf.logRequests(logger: (String msg, bool isError){
    print("kek");
  });
  io.handleRequest(request, createStaticHandler(cmdArgs['static'], defaultDocument: 'index.html'));

}

@Route("/tutorials.html", method: "POST")
void inp (HttpRequest request) {
  //io.handleRequest(request, createStaticHandler(cmdArgs['static'], defaultDocument: 'index.html'));
  print("hello");
}