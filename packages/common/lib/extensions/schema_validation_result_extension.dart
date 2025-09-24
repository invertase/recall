import 'package:luthor/luthor.dart';

extension SchemaValidationResultExtension on SchemaValidationResult<dynamic> {
  String? get errorMessage {
    final result = this;
    if (result is SchemaValidationError) {
      final firstErrorKey = result.errors.keys.first;
      return result.getError(firstErrorKey);
    }

    return null;
  }
}
