part of dart_client;

abstract class AbstractClient {

}

class Client implements AbstractClient {

  final String host;
  final int port;

  Client(this.host, this.port);

}