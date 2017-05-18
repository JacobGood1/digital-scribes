part of server;



@Route("/", methods: const [GET, POST])
void shelfStatic(HttpRequest request) {
  io.handleRequest(request, createStaticHandler(cmdArgs['static'], defaultDocument: 'index.html'));
}

@Route("/api/stuff", method: POST)
void input_email(HttpRequest request) {
  //io.handleRequest(request, createStaticHandler(cmdArgs['static'], defaultDocument: 'index.html'));
  print("posted!");

}

