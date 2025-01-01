// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';

class KeyPairGenerator {
  static AsymmetricKeyPair<PublicKey, PrivateKey> generateKeyPair() {
    final keyParams = RSAKeyGeneratorParameters(BigInt.parse('65537'), 2048, 12);
    final secureRandom = FortunaRandom();
    secureRandom.seed(KeyParameter(Uint8List.fromList(List.generate(32, (i) => i))));

    final keyGenerator = RSAKeyGenerator()
      ..init(ParametersWithRandom(keyParams, secureRandom));

    return keyGenerator.generateKeyPair();
  }

  static String generateSessionKey() {
    final random = Random.secure();
    final key = List<int>.generate(32, (_) => random.nextInt(256));
    return base64UrlEncode(key);
  }

}
