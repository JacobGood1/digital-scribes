part of server;

@Route("/v1")
class HelloVane extends Vane {
  @Route("/")
  @Route("/vane")
  Future World() {
    return close("Hello world!");
  }

  @Route("/{user}")
  @Route("/vane/{user}")
  Future User(String user) {
    return close("Hello ${user}! (try changing \"myNameIs\" in the url)");
  }
}