// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

class ResponseBody {
  const ResponseBody({
    required this.success,
    required this.message,
    this.data,
  });
  final bool success;
  final String message;
  final dynamic data;

  Map<String, dynamic> toMap() => {
        'success': success,
        'message': message,
        'data': _processData(data),
      };

  String toJson() => json.encode(toMap());

  dynamic _processData(dynamic data) {
    if (data == null) return null;

    if (data is List) return data.map(_processData).toList();

    if (data is Map) {
      return data.map((key, value) => MapEntry(key, _processData(value)));
    }

    if (_hasToMapMethod(data)) {
      try {
        return data.toMap();
      } catch (e) {
        return data;
      }
    }

    return data;
  }

  bool _hasToMapMethod(dynamic obj) {
    if (obj == null || obj is String || obj is num || obj is bool) {
      return false;
    }

    try {
      final result = obj.toMap();
      return result is Map<String, dynamic>;
    } catch (e) {
      return false;
    }
  }
}
