class AppError implements Error {
  AppError({required this.error});

  @override
  StackTrace? get stackTrace => StackTrace.current;

  final String error;
}
