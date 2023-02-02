class AppExceptions implements Exception {
  final String? message;
  final String? prefix;

  AppExceptions({this.message, this.prefix});

  @override
  String toString() {
    return '$prefix $message';
  }
}

class FetchDataExcetion extends AppExceptions {
  FetchDataExcetion({String? message})
      : super(message: message, prefix: 'Error during communication');
}

class BadRequestExcetion extends AppExceptions {
  BadRequestExcetion({String? message})
      : super(message: message, prefix: 'Invalid request');
}

class UnauthorizedExcetion extends AppExceptions {
  UnauthorizedExcetion({String? message})
      : super(message: message, prefix: 'Unauthorized request');
}

class InvalidInputExcetion extends AppExceptions {
  InvalidInputExcetion({String? message})
      : super(message: message, prefix: 'Invalid input');
}
