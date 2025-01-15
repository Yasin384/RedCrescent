import 'dart:async';

import 'package:red_crescent/src/core/util/logger.dart';

@pragma('vm:entry-point')
void main([List<String>? args]) => runZonedGuarded<Future<void>>(() async {
      // ...
    }, (error, stackTrace) {
      Error.safeToString(error);
      stackTrace.toString();

      logger.e('runZonedGuarded.onError', error: error, stackTrace: stackTrace);
    });
