import 'package:flutter/foundation.dart';

logger(String msg) {
  if (kDebugMode) {
    print('''👉👉👉  ${msg.toUpperCase()}''');
  }
}
