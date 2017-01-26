part of server;

@Route("/")
void shelfStatic(HttpRequest request) {
  io.handleRequest(request, createStaticHandler(cmdArgs['static'], defaultDocument: 'index.html'));
}

