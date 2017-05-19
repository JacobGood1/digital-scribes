part of server;


@Route("/")
Future shelfStatic(HttpRequest request) {
  io.handleRequest(request, createStaticHandler(cmdArgs['static'], defaultDocument: 'index.html'));
}

class Handlers extends Vane {
  @Route("/api/stuff", method: POST)
  Future input_email() {
    writeln('Received request ${req.method}: ${req.uri.path}');
    writeln('Data: ${params}');
    return close();
  }
}

