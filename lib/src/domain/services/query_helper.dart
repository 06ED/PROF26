Future<void> queryHelper<ResponseT>({
  required Future<ResponseT> Function() request,
  required void Function(ResponseT) onResponse,
  required void Function(Exception) onError,
}) async {
  try {
    ResponseT response = await request();
    onResponse(response);
  } on Exception catch (e) {
    onError(e);
  }
}
