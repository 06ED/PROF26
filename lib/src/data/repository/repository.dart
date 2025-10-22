abstract interface class Repository {
  abstract final String baseEndpoint;

  Future<void> getGoogle();
}
