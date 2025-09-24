import 'package:common/extensions/schema_validation_result_extension.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:luthor/luthor.dart';

part 'create_note_params.mapper.dart';

@MappableClass()
class CreateNoteParams with CreateNoteParamsMappable {
  const CreateNoteParams({required this.title, required this.content});

  final String title;
  final String content;

  static const fromMap = CreateNoteParamsMapper.fromMap;

  static String? validate(Map<String, dynamic> noteParams) {
    final noteSchema = l.schema({
      'title': l.string().max(64).required(),
      'content': l.string().max(1024).required(),
    });

    return noteSchema
        .validateSchema<Map<String, dynamic>>(noteParams)
        .errorMessage;
  }
}
