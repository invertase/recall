import 'package:backend/config/environment.dart';
import 'package:common/models/user.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:uuid/uuid.dart';

class JwtService {
  const JwtService();

  static final String _jwtSecret = Environment.jwtSecret;

  String createToken(User user) {
    final now = DateTime.now().toUtc();

    final jwt = JWT(
      subject: user.id,
      issuer: 'recall-app',
      audience: Audience(['recall.globe.dev']),
      jwtId: const Uuid().v4(),
      {
        'iat': now.millisecondsSinceEpoch ~/ 1000,
        'id': user.id,
        'email': user.email,
      },
    );

    return jwt.sign(
      SecretKey(_jwtSecret),
      expiresIn: const Duration(hours: 24),
    );
  }

  Future<String?> authenticateFromToken(String token) async {
    final jwt = JWT.tryVerify(token, SecretKey(_jwtSecret));

    if (jwt == null) return null;

    final payload = jwt.payload as Map<String, dynamic>;
    final userId = payload['id'] as String?;

    return userId;
  }
}
