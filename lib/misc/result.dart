class Result<T> {
  final bool isSuccessful;
  final T? data;
  final Exception? exception;

  Result({required this.isSuccessful, this.data, this.exception});
}