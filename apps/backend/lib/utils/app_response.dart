import 'package:backend/utils/response_body.dart';
import 'package:dart_frog/dart_frog.dart';

class AppResponse {
  static Response json(
    ResponseBody body, {
    required HttpStatus status,
    Map<String, Object>? headers,
  }) {
    final jsonHeaders = <String, Object>{
      'content-type': 'application/json',
      ...?headers,
    };

    return Response(
      statusCode: status.code,
      body: body.toJson(),
      headers: jsonHeaders,
    );
  }

  /// Creates a successful JSON response (200)
  static Response ok(ResponseBody body, {Map<String, Object>? headers}) =>
      json(body, status: HttpStatus.ok, headers: headers);

  /// Creates a created JSON response (201)
  static Response created(ResponseBody body, {Map<String, Object>? headers}) =>
      json(body, status: HttpStatus.created, headers: headers);

  /// Creates a no content JSON response (204)
  static Response noContent({Map<String, Object>? headers}) =>
      Response(statusCode: HttpStatus.noContent.code, headers: headers);

  /// Creates a found JSON response (302)
  static Response found({required Uri redirectUri}) => Response.json(
        statusCode: HttpStatus.found.code,
        headers: {'location': redirectUri.toString()},
      );

  /// Creates a bad request JSON response (400)
  static Response badRequest(
    ResponseBody body, {
    Map<String, Object>? headers,
  }) =>
      json(body, status: HttpStatus.badRequest, headers: headers);

  /// Creates an unauthorized JSON response (401)
  static Response unauthorized(
    ResponseBody body, {
    Map<String, Object>? headers,
  }) =>
      json(body, status: HttpStatus.unauthorized, headers: headers);

  /// Creates a forbidden JSON response (403)
  static Response forbidden(
    ResponseBody body, {
    Map<String, Object>? headers,
  }) =>
      json(body, status: HttpStatus.forbidden, headers: headers);

  /// Creates a not found JSON response (404)
  static Response notFound(ResponseBody body, {Map<String, Object>? headers}) =>
      json(body, status: HttpStatus.notFound, headers: headers);

  /// Creates an unprocessable entity JSON response (422)
  static Response unprocessableEntity(
    ResponseBody body, {
    Map<String, Object>? headers,
  }) =>
      json(body, status: HttpStatus.unprocessableEntity, headers: headers);

  /// Creates an too many requests JSON response (429)
  static Response tooManyRequests(
    ResponseBody body, {
    Map<String, Object>? headers,
  }) =>
      json(body, status: HttpStatus.tooManyRequests, headers: headers);

  /// Creates an internal server error JSON response (500)
  static Response internalServerError(
    ResponseBody body, {
    Map<String, Object>? headers,
  }) =>
      json(body, status: HttpStatus.internalServerError, headers: headers);
}

enum HttpStatus {
  ok(200),
  created(201),
  noContent(204),
  found(302),
  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  unprocessableEntity(422),
  tooManyRequests(429),
  internalServerError(500);

  const HttpStatus(this.code);
  final int code;
}
