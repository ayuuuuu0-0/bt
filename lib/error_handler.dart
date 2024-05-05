// errors_handler.dart

import 'package:flutter/foundation.dart';

class myErrorsHandler {
  Future<void> initialize() async {
    // Initialization logic for error handling (if needed)
    print('Error handler initialized');
  }

  void onErrorDetails(FlutterErrorDetails details) {
    // Handle Flutter framework errors
    print('Flutter Error: ${details.exception}');
    // Additional error handling logic can be added here
  }

  void onError(Object error, StackTrace stackTrace) {
    // Handle platform-specific errors
    print('Platform Error: $error');
    print('Stack Trace: $stackTrace');
    // Additional error handling logic can be added here
  }
}
