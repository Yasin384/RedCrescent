/// {@template login_exception}
/// LoginException enumeration
/// {@endtemplate}
enum LoginException implements Exception {
  /// Incorrect data.
  incorrectData(401);

  /// {@macro login_exception}
  const LoginException(this.statusCode);

  static LoginException fromStatusCode(int? statusCode,
      {LoginException? fallback}) {
    switch (statusCode) {
      case 401:
        return incorrectData;
      default:
        return fallback ?? (throw ArgumentError.value(statusCode));
    }
  }

  /// statusCode of the enum
  final int statusCode;

  /// Pattern matching
  T map<T>({
    required T Function() incorrectData,
  }) {
    switch (this) {
      case LoginException.incorrectData:
        return incorrectData();
    }
  }

  // /// Pattern matching
  // T maybeMap<T>({
  //   required T Function() orElse,
  //   T Function()? a,
  //   T Function()? b,
  //   T Function()? c,
  // }) =>
  //     map<T>(
  //       a: a ?? orElse,
  //       b: b ?? orElse,
  //       c: c ?? orElse,
  //     );

  // /// Pattern matching
  // T? maybeMapOrNull<T>({
  //   T Function()? a,
  //   T Function()? b,
  //   T Function()? c,
  // }) =>
  //     maybeMap<T?>(
  //       orElse: () => null,
  //       a: a,
  //       b: b,
  //       c: c,
  //     );

  // @override
  // String toString() => statusCode;
}
