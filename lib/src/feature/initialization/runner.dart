import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:red_crescent/src/core/constans/storage_key.dart';
import 'package:red_crescent/src/core/model/access.dart';
import 'package:red_crescent/src/core/util/token_interceptor.dart';
import 'package:red_crescent/src/feature/app/widget/red_crescent.dart';
import 'package:red_crescent/src/feature/auth/authorization/bloc/authorization_bloc.dart';
import 'package:red_crescent/src/feature/auth/authorization/data/authorization_repository.dart';
import 'package:red_crescent/src/feature/auth/login/bloc/login_bloc.dart';
import 'package:red_crescent/src/feature/auth/login/data/login_repository.dart';
import 'package:red_crescent/src/feature/leaderboard/bloc/leaderboard_bloc.dart';
import 'package:red_crescent/src/feature/leaderboard/data/leaderboard_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:stack_trace/stack_trace.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_crescent/src/core/util/bloc_observer.dart';
import 'package:red_crescent/src/core/util/logger.dart';
import 'package:dio/dio.dart';

/// {@template runner}
/// Runner.
/// {@endtemplate}
abstract final class Runner {
  /// {@macro runner}

  static Future<void> initializeAndRun() async {
    final binding = WidgetsFlutterBinding.ensureInitialized()
      ..deferFirstFrame();
    try {
      final prefs = SharedPreferences.getInstance();

      final flutterSecureStorage = FlutterSecureStorage();

      final packageInfoPlus = await PackageInfo.fromPlatform();

      Bloc.observer = MyBlocObserver();

      FlutterError.onError = (details) {
        FlutterError.presentError(details);
        logger.e(' FlutterError.onError',
            error: details.exception,
            stackTrace: Chain.forTrace(details.stack ?? StackTrace.current));
        if (kReleaseMode) exit(1);
      };

      PlatformDispatcher.instance.onError = (error, stack) {
        logger.e('PlatformDispatcher.instance.onError',
            error: error, stackTrace: Chain.forTrace(stack));
        return true;
      };

      final authRepository = AuthorizationRepositoryImpl(
        flutterSecureStorage: flutterSecureStorage,
      );

      await authRepository.initAuthSession();

      runApp(
        MultiRepositoryProvider(
          providers: [
            // --- Shared Preferences --- //

            RepositoryProvider(
              create: (context) => prefs,
            ),

            // --- Dio --- //

            RepositoryProvider(
              create: (context) => Dio(
                BaseOptions(
                  headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                  },
                  receiveDataWhenStatusError: true,
                  receiveTimeout: const Duration(seconds: 5),
                  connectTimeout: const Duration(seconds: 3),
                  baseUrl: const String.fromEnvironment('BASEURL', defaultValue: 'https://redcresent22.onrender.com'),
                ),
              )..interceptors.addAll(
                  [
                    InterceptorsWrapper(
                      onRequest: (options, handler) async {
                        try {
                          // Ждем получения токена
                          final access = await flutterSecureStorage.read(key: StorageKey.access);

                          if (access != null) {
                            final accessData = accessFromJson(access);
                            // Добавляем токен в заголовки
                            options.headers['Authorization'] = 'Bearer ${accessData.access}';
                          }

                          return handler.next(options);
                        } catch (error) {
                          return handler.reject(
                            DioException(
                              requestOptions: options,
                              error: error,
                              message: 'Ошибка при получении токена',
                            ),
                          );
                        }
                      },
                    ),
                    PrettyDioLogger(
                        requestHeader: true,
                        requestBody: true,
                        responseBody: true,
                        responseHeader: false,
                        error: true,
                        compact: true,
                        maxWidth: 90,
                        enabled: kDebugMode,
                        filter: (options, args) {
                          // don't print requests with uris containing '/posts'
                          if (options.path.contains('/posts')) {
                            return false;
                          }
                          // don't print responses with unit8 list data
                          return !args.isResponse || !args.hasUint8ListData;
                        }),
                  ],
                ),
            ),

            // --- Flutter secure storage --- //

            RepositoryProvider(
              create: (context) => flutterSecureStorage,
            ),

            // --- Auth --- //

            RepositoryProvider<AuthorizationRepository>(
              create: (context) => authRepository,
            ),

            RepositoryProvider<LoginRepository>(
              create: (context) =>
                  LoginRepositoryImpl(dio: context.read<Dio>()),
            ),
            // --- Auth --- //

            // --- Utisl --- //
            RepositoryProvider(create: (context) => packageInfoPlus),

            // --- Utisl --- //

            // --- Leaderboard --- //

            RepositoryProvider<LeaderboardRepository>(
              create: (context) => LeaderboardRepositoryImpl(
                dio: context.read<Dio>(),
              ),
            ),

            // --- Leaderboard --- //
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                lazy: false,
                create: (context) => AuthorizationBloc(
                  authorizationRepository:
                      RepositoryProvider.of<AuthorizationRepository>(context),
                )..add(StartedListenAuthChanges()),
              ),
              BlocProvider<LoginBloc>(
                create: (context) => LoginBloc(
                  loginRepository: context.read<LoginRepository>(),
                  authorizationRepository:
                      context.read<AuthorizationRepository>(),
                ),
              ),
              BlocProvider<LeaderboardBloc>(
                  create: (context) => LeaderboardBloc(
                    leaderboardRepository:
                    RepositoryProvider.of<LeaderboardRepository>(context),
                  )..add(GetLeaderboard()),
              )
            ],
            child: RedCrescent(),
          ),
        ),
      );
    } on Object {
      rethrow;
    } finally {
      binding.allowFirstFrame();
    }
  }
}
