import 'package:backend/utils/app_response.dart';
import 'package:backend/utils/response_body.dart';
import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return AppResponse.ok(
    const ResponseBody(
      success: true,
      message: "You probably shouldn't be here, but...",
      data: {'service': 'recall-api'},
    ),
  );
}
