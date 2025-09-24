import 'package:common/extensions/schema_validation_result_extension.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:luthor/luthor.dart';

part 'update_note_params.mapper.dart';

@MappableClass()
class UpdateNoteParams with UpdateNoteParamsMappable {
  const UpdateNoteParams({required this.title, required this.content});

  final String? title;
  final String? content;

  static const fromMap = UpdateNoteParamsMapper.fromMap;

  static String? validate(Map<String, dynamic> noteParams) {
    if (noteParams.isEmpty) return 'No fields to update.';

    final noteSchema = l.schema({
      'title': l.string().max(64),
      'content': l.string().max(1024),
    });

    return noteSchema
        .validateSchema<Map<String, dynamic>>(noteParams)
        .errorMessage;
  }
}
