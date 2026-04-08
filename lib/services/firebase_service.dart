import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseService {
  FirebaseService._();

  static Future<void> initialize() async {
    try {
      await dotenv.load(fileName: '.env');
    } catch (_) {
      debugPrint('Delibox: .env file not found, skipping Firebase init.');
      return;
    }

    final apiKey = dotenv.env['FIREBASE_API_KEY'];
    final authDomain = dotenv.env['FIREBASE_AUTH_DOMAIN'];
    final projectId = dotenv.env['FIREBASE_PROJECT_ID'];
    final appId = dotenv.env['FIREBASE_APP_ID'];
    final messagingSenderId = dotenv.env['FIREBASE_MESSAGING_SENDER_ID'];
    final storageBucket = dotenv.env['FIREBASE_STORAGE_BUCKET'];
    final iosBundleId = dotenv.env['FIREBASE_IOS_BUNDLE_ID'];

    final hasRequiredValues = [
      apiKey,
      projectId,
      appId,
      messagingSenderId,
    ].every((value) => value != null && value.isNotEmpty);

    if (!hasRequiredValues) {
      debugPrint('Delibox: Firebase env vars are incomplete, init skipped.');
      return;
    }

    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: apiKey!,
          authDomain: authDomain,
          projectId: projectId!,
          appId: appId!,
          messagingSenderId: messagingSenderId!,
          storageBucket: storageBucket,
          iosBundleId: iosBundleId,
        ),
      );
    }
  }
}
