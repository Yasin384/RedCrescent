import 'dart:async';

import 'package:red_crescent/src/core/util/logger.dart';
import 'package:red_crescent/src/feature/initialization/runner.dart';
import 'package:stack_trace/stack_trace.dart';

@pragma('vm:entry-point')
void main([List<String>? args]) => runZonedGuarded<Future<void>>(() async {
      await Runner.initializeAndRun();
    }, (error, stackTrace) {
      Error.safeToString(error);
      stackTrace.toString();

      logger.e('runZonedGuarded.onError',
          error: error, stackTrace: Chain.forTrace(stackTrace));
    });
