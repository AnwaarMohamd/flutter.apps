// Usage: Response class to handle response from API
class Response {
  final int statusCode;
  final String message;
  final bool success;

  Response(this.statusCode, this.message, this.success);
}

class ResponseOf<T> extends Response {
  final T result;

  ResponseOf(int statusCode, String message, bool success, this.result)
      : super(statusCode, message, success);
}

class PaginationResponse<T> extends Response {
  final List<T> result;
  final int pageSize;
  final int pageIndex;
  final int totalCount;
  final int count;
  final int totalPages;
  final bool moveNext;
  final bool movePrevious;

  PaginationResponse(
      int statusCode,
      String message,
      bool success,
      this.result,
      this.pageSize,
      this.pageIndex,
      this.totalCount,
      this.count,
      this.totalPages,
      this.moveNext,
      this.movePrevious)
      : super(statusCode, message, success);
}
// TODO : Ahmed want this i will use it later
