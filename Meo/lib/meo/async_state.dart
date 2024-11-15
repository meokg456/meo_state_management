enum Status {
  idle,
  loading,
  success,
  error,
}

class AsyncState<T> {
  Status status = Status.idle;
  T? data;
  Object? error;

  AsyncState({
    this.status = Status.idle,
    this.data,
    this.error,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AsyncState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          data == other.data &&
          error == other.error);

  @override
  int get hashCode => status.hashCode ^ data.hashCode ^ error.hashCode;

  @override
  String toString() {
    return 'AsyncState{ status: $status, data: $data, error: $error,}';
  }

  AsyncState<T> copyWith({
    Status? status,
    T? data,
    Object? error,
  }) {
    return AsyncState<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}
