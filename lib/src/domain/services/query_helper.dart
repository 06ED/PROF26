class QueryHelper {
  Future<void> request<T>({
    required Future<T> Function() request,
    required void Function(T) onResponse,
    required void Function(String) onError,
  }) async {
    try {
      T response = await request();
      onResponse(response);
    } on Exception catch (e) {
      onError(castError(e));
    }
  }

  String castError(Exception e) {
    return e.toString();
  }
}
